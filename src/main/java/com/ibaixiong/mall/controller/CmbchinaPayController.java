/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.mall.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cmb.MerchantCode;
import cmb.netpayment.Security;

import com.ibaixiong.core.utils.DateUtil;
import com.ibaixiong.core.utils.IpUtil;
import com.ibaixiong.entity.User;
import com.ibaixiong.entity.util.OrderStatusEnum;
import com.ibaixiong.mall.cmbchinapay.util.CmbChina;
import com.ibaixiong.mall.exception.PayException;
import com.ibaixiong.mall.service.PayNotifyService;
import com.papabear.order.entity.MallOrder;
import com.papabear.pay.entity.OrderPayCmbChina;

/**
 * @description 招行网银支付
 * @author chenzehe
 * @email hljuczh@163.com
 * @create 2015年12月7日-上午11:56:40
 */
@Controller
public class CmbchinaPayController extends AbstractController {

	@Autowired
	CmbChina cmbChina;
	@Resource
	PayNotifyService payNotifyService;

	@RequestMapping("/u/pay/cmbchina/getpaydata")
	@ResponseBody
	public String getCmbchinaPayData(ModelMap modelMap, HttpServletRequest request) {
		User user = getUser();
		String orderNumber = request.getParameter("orderNumber");

		// 1、根据orderNumber获取订单金额
		MallOrder order = mallOrderService.queryOrderByOrderNumber(user, orderNumber);
		if (order == null || order.getStatus() != OrderStatusEnum.OBLIGATION.getCode()) {
			return "{\"code\":-1}";
		}
		String fee = request.getParameter("fee");
//		Float amount = order.getDiscountPrice();

		// 2、生成校验码
		String strDate = DateUtil.getDateNow("yyyyMMdd");
		String strMerchantPara = "payType=" + cmbChina.getPayType() + "|orderNumber=" + orderNumber;
		String strPayerID = "";// 付方用户
		String strPayeeID = "";// 收放用户
		String strClientIP = IpUtil.getIpAddr(request);// 付方IP
		String strReserved = "";
		String thirdBankNo = request.getParameter("thirdBankNo");
		String strMerchantCode = "";
		String billno = createBillNo(order.getId().toString());
//		if (!StringUtils.isBlank(thirdBankNo)) {
			strReserved = "<CardBank>" + thirdBankNo + "</CardBank>";
			strMerchantCode = MerchantCode.genMerchantCode(cmbChina.getKey(), strDate, cmbChina.getBranchId(), cmbChina.getCoNo(), billno, fee,
					strMerchantPara, cmbChina.getMerchantUrl(), strPayerID, strPayeeID, strClientIP, cmbChina.getGoodsType(), strReserved);
//		}

		return "{\"branchid\":\"" + cmbChina.getBranchId() + "\",\"cono\":\"" + cmbChina.getCoNo() + "\",\"date\":\"" + strDate + "\",\"billno\":\"" + billno
				+ "\",\"amount\":\"" + fee + "\",\"merchantPara\":\"" + strMerchantPara + "\",\"merchantURL\":\"" + cmbChina.getMerchantUrl()
				+ "\",\"merchantRetURL\":\"" + cmbChina.getMerchantRetUrl() + "\",\"merchantCode\":\"" + strMerchantCode + "\",\"payUrl\":\""
				+ cmbChina.getPayUrl() + "\"}";
	}

	@RequestMapping("/pay/cmbchina/notify")
	@ResponseBody
	public String payNotify(ModelMap modelMap, HttpServletRequest request) {
		try {
			String sucess = request.getParameter("Succeed");
			if ("Y".equals(sucess)) {
				payAfter(request);
			}
		} catch (Exception e) {

		}

		return "";
	}

	@RequestMapping("/pay/cmbchina/show")
	public String show(ModelMap modelMap, HttpServletRequest request) {
		boolean result = false;
		String msg = "";
		try {
			String sucess = request.getParameter("Succeed");
			if ("Y".equals(sucess)) {
				result = payAfter(request);
			}
		} catch (PayException e) {
			msg = e.getMessage();
		} catch (Exception e) {
			e.printStackTrace();
		}

		modelMap.addAttribute("amount", request.getParameter("Amount"));
		modelMap.addAttribute("payType", "5");
		if (result) {
			modelMap.addAttribute("payResultImg", "http://fe.ibaixiong.com/shop/image/cmbchinapay-sucess.png");
		} else {
			modelMap.addAttribute("payResultImg", "http://fe.ibaixiong.com/shop/image/pay-error.png");
			modelMap.addAttribute("msg", msg);
		}

		return "pay/paySuccess";
	}

	private boolean payAfter(HttpServletRequest request) throws Exception {
		boolean result = false;
		// 对签名进行验证

		String cmbChinaPubKey = this.getClass().getClassLoader().getResource("").getPath() + "cmbchinapay/public.key";
		System.out.println(cmbChinaPubKey);
		Security security = new Security(cmbChinaPubKey);
		if (!security.checkInfoFromBank(request.getQueryString().getBytes("GB2312"))) {
			return false;
		}

		String sucess = request.getParameter("Succeed");
		String coNo = request.getParameter("CoNo");
		String billNo = request.getParameter("BillNo");
		String amount = request.getParameter("Amount");
		String date = request.getParameter("Date");
		String msg = request.getParameter("Msg");
		String merchantPara = request.getParameter("MerchantPara");
		String signature = request.getParameter("Signature");

		OrderPayCmbChina payCmbChina = new OrderPayCmbChina();
		payCmbChina.setBankPayNumber(msg);
		payCmbChina.setBranchId(msg.substring(0, 4));
		payCmbChina.setCono(msg.substring(4, 10));
		payCmbChina.setDate8(msg.substring(10, 18));
		payCmbChina.setBankPayNumber(msg.substring(18, 38));
		payCmbChina.setCreateDateTime(new Date());
		payCmbChina.setInvalid(false);
		payCmbChina.setBillno(billNo);
		Map<String, String> merchantPara2Map = merchantPara2Map(merchantPara);
		String orderNumber = merchantPara2Map.get("orderNumber");
		payCmbChina.setOrderNumber(orderNumber);
		payCmbChina.setPara(merchantPara);
		payCmbChina.setSignature(signature);
		payCmbChina.setNotifyQueryString(request.getQueryString());
		payCmbChina.setAmount(Float.valueOf(amount));

		result = payNotifyService.payNotifyCmbChina(orderNumber, IpUtil.getIpAddr(request), payCmbChina);

		return result;
	}

	/**
	 * 返回10位的billNo
	 */
	private String createBillNo(String orderId) {
		int billNoLength = 10;
		StringBuilder str = new StringBuilder();
		for (int i = 0; i < billNoLength - orderId.length(); i++) {
			str.append("0");
		}
		return str.toString() + orderId;
	}

	private Map<String, String> merchantPara2Map(String merchantPara) {
		String[] allMerchantParas = merchantPara.split("\\|");
		Map<String, String> merchantParaMap = new HashMap<String, String>();
		for (int i = 0; i < allMerchantParas.length; i++) {
			String[] oneMerchantParas = allMerchantParas[i].split("=");
			merchantParaMap.put(oneMerchantParas[0], oneMerchantParas[1]);
		}
		return merchantParaMap;
	}
}
