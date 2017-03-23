/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.mall.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alipay.config.AlipayConfig;
import com.alipay.util.AlipayNotify;
import com.alipay.util.AlipaySubmit;
import com.ibaixiong.entity.User;
import com.ibaixiong.entity.util.OrderStatusEnum;
import com.ibaixiong.mall.service.PayNotifyService;
import com.papabear.order.api.DepositService;
import com.papabear.order.entity.MallFrontMoney;
import com.papabear.order.entity.MallOrder;
import com.papabear.order.entity.MallOrderItem;
import com.papabear.pay.entity.PayChannel;
import com.papabear.product.entity.MallProduct;

/**
 * @description
 * @author zhaolei
 * @create 2015年11月19日-上午11:25:42
 */
@Controller
@RequestMapping("/u/ali")
class UAliPayController extends AbstractController {
	@Resource
	PayNotifyService payAfterService;
	@Resource
	private DepositService depositService;

	/**
	 * 支付宝支付页面调用
	 * 
	 * @author zhaolei
	 * @date 2015年9月16日
	 * @param modelMap
	 * @param request
	 * @return
	 */
	@RequestMapping("/pay")
	String pay(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 商户订单号
		String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"), "UTF-8");
		//付款总金额
		String total_fee = request.getParameter("WIDtotal_fee");
		User user = getUser();
		MallOrder order = mallOrderService.queryOrderByOrderNumber(user, out_trade_no);
		if (order == null) {// 为空
			return "pay/payError";
		}
		if (order.getStatus().byteValue() == OrderStatusEnum.PAID.getCode()) {// 状态为支付
			modelMap.addAttribute("discountPrice", total_fee);
			modelMap.addAttribute("payType", PayChannel.ALIPYAY_PC.getType());
			return "pay/paySuccess";
		}
		// String notify_url =
		// "http://商户网关地址/create_direct_pay_by_user-JAVA-UTF-8/notify_url.jsp";源
		String notify_url = "http://www.ibaixiong.com/pay/notify/ali/pc.html";
		// String return_url =
		// "http://商户网关地址/create_direct_pay_by_user-JAVA-UTF-8/return_url.jsp";
		String return_url = "http://www.ibaixiong.com/u/ali/payafter.html";
		// 付款金额
		//String total_fee = order.getDiscountPrice().toString();

		// 订单名称查询订单详情中的商品名称
		String subject = "";
		String body = "";
		String show_url = "http://www.ibaixiong.com/u/order/detail.html?number=" + out_trade_no;
		List<MallOrderItem> list = orderItemService.queryMallOrderItemsByOrderNumber(getUser().getId(), order.getOrderNumber());
		for (MallOrderItem mallOrderItem : list) {
			subject = subject + mallOrderItem.getProductTitle() + " / ";
			body = body + mallOrderItem.getProductTitle() + "[" + mallOrderItem.getProductModelFormatName() + "]" + mallOrderItem.getUnitPrice() + "*"
					+ mallOrderItem.getNum() + ",";
		}
		if (StringUtils.isNotBlank(subject)) {
			subject = subject.substring(0, subject.length() - 2);
			body = body.substring(0, body.length() - 1);
		}
		// 需以http://开头的完整路径，例如：http://www.商户网址.com/myorder.html
		// 防钓鱼时间戳
		String anti_phishing_key = "";
		// 若要使用请调用类文件submit中的query_timestamp函数
		// 客户端的IP地址
		String exter_invoke_ip = "";
		// 把请求参数打包成数组
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", "create_direct_pay_by_user");
		sParaTemp.put("partner", AlipayConfig.partner);
		sParaTemp.put("seller_email", AlipayConfig.seller_email);
		sParaTemp.put("_input_charset", AlipayConfig.input_charset);
		sParaTemp.put("payment_type", PayChannel.ALIPYAY_PC.getType().toString());
		sParaTemp.put("notify_url", notify_url);
		sParaTemp.put("return_url", return_url);
		sParaTemp.put("out_trade_no", out_trade_no);
		sParaTemp.put("subject", subject);
		sParaTemp.put("total_fee", total_fee);
		sParaTemp.put("body", body);
		sParaTemp.put("show_url", show_url);
		sParaTemp.put("anti_phishing_key", anti_phishing_key);
		sParaTemp.put("exter_invoke_ip", exter_invoke_ip);
		// 建立请求
		String sHtmlText = AlipaySubmit.buildRequest(sParaTemp, "get", "确认");
		modelMap.addAttribute("alihtml", sHtmlText);
		return "/ali/pay";
	}

	/**
	 * 支付宝支付成功之后调用
	 * 
	 * @author zhaolei
	 * @date 2015年9月16日
	 * @param modelMap
	 * @param request
	 * @return
	 */
	@RequestMapping("/payafter")
	String payAfter(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		// 计算得出通知验证结果
		boolean verify_result = AlipayNotify.verify(params);
		if (verify_result) {// 验证成功
			String trade_status = params.get("trade_status");
			if ("TRADE_FINISHED".equals(trade_status) || "TRADE_SUCCESS".equals(trade_status)) {
				// 更改支付状态
				payAfterService.payNotifyAlipay(params, PayChannel.ALIPYAY_PC, request.getRemoteAddr());
				modelMap.addAttribute("discountPrice", params.get("total_fee"));
				modelMap.addAttribute("payType", PayChannel.ALIPYAY_PC.getType());
				return "pay/paySuccess";
			} else {
				return "pay/payError";
			}
		} else {
			// 该页面可做页面美工编辑
			return "pay/payError";
		}
	}
	
	
	/************************************定金支付************************************************/
	/**
	 * 支付宝支付页面调用
	 * 
	 * @author zhaolei
	 * @date 2015年9月16日
	 * @param modelMap
	 * @param request
	 * @return
	 */
	@RequestMapping("/deposit/pay")
	String depositPay(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 商户订单号
		String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"), "UTF-8");
		User user = getUser();
		MallFrontMoney order = depositService.getDeposit(user.getId(), out_trade_no);

		if (order == null) {// 为空
			return "pay/payError";
		}
		if (order.getStatus().byteValue() == OrderStatusEnum.PAID.getCode()) {// 状态为支付
			modelMap.addAttribute("discountPrice", order.getFrontMoney());
			modelMap.addAttribute("payType", PayChannel.ALIPYAY_PC.getType());
			return "pay/paySuccess";
		}
		// String notify_url =
		// "http://商户网关地址/create_direct_pay_by_user-JAVA-UTF-8/notify_url.jsp";源
		String notify_url = "http://www.ibaixiong.com/pay/notify/ali/pc.html";
		// String return_url =
		// "http://商户网关地址/create_direct_pay_by_user-JAVA-UTF-8/return_url.jsp";
		String return_url = "http://www.ibaixiong.com/u/ali/deposit/payafter.html";
		// 付款金额
		String total_fee = order.getFrontMoney().toString();

		// 订单名称查询订单详情中的商品名称
		String show_url = "http://www.ibaixiong.com/u/deposit/detail.html?number=" + out_trade_no;
		MallProduct product=productQueryService.getProduct(order.getProductId()==null?53l:order.getProductId());
		String subject =  product.getTitle();
		String body = product.getTitle() + "支付定金";
		
		// 需以http://开头的完整路径，例如：http://www.商户网址.com/myorder.html
		// 防钓鱼时间戳
		String anti_phishing_key = "";
		// 若要使用请调用类文件submit中的query_timestamp函数
		// 客户端的IP地址
		String exter_invoke_ip = "";
		// 把请求参数打包成数组
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", "create_direct_pay_by_user");
		sParaTemp.put("partner", AlipayConfig.partner);
		sParaTemp.put("seller_email", AlipayConfig.seller_email);
		sParaTemp.put("_input_charset", AlipayConfig.input_charset);
		sParaTemp.put("payment_type", PayChannel.ALIPYAY_PC.getType().toString());
		sParaTemp.put("notify_url", notify_url);
		sParaTemp.put("return_url", return_url);
		sParaTemp.put("out_trade_no", out_trade_no);
		sParaTemp.put("subject", subject);
		sParaTemp.put("total_fee", total_fee);
		sParaTemp.put("body", body);
		sParaTemp.put("show_url", show_url);
		sParaTemp.put("anti_phishing_key", anti_phishing_key);
		sParaTemp.put("exter_invoke_ip", exter_invoke_ip);
		// 建立请求
		String sHtmlText = AlipaySubmit.buildRequest(sParaTemp, "get", "确认");
		modelMap.addAttribute("alihtml", sHtmlText);
		return "deposit/ali_pay";
	}

	/**
	 * 支付宝支付成功之后调用
	 * 
	 * @author zhaolei
	 * @date 2015年9月16日
	 * @param modelMap
	 * @param request
	 * @return
	 */
	@RequestMapping("/deposit/payafter")
	String depositPayAfter(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		// 计算得出通知验证结果
		boolean verify_result = AlipayNotify.verify(params);
		if (verify_result) {// 验证成功
			String trade_status = params.get("trade_status");
			if ("TRADE_FINISHED".equals(trade_status) || "TRADE_SUCCESS".equals(trade_status)) {
				// 更改支付状态
				payAfterService.payDepositNotifyAlipay(params, PayChannel.ALIPYAY_PC, request.getRemoteAddr());
				modelMap.addAttribute("discountPrice", params.get("total_fee"));
				modelMap.addAttribute("payType", PayChannel.ALIPYAY_PC.getType());
				return "pay/paySuccess";
			} else {
				return "pay/payError";
			}
		} else {
			// 该页面可做页面美工编辑
			return "pay/payError";
		}
	}
}
