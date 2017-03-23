package com.ibaixiong.mall.controller;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.ibaixiong.core.utils.ResponseResult;
import com.ibaixiong.entity.User;
import com.ibaixiong.entity.util.OrderStatusEnum;
import com.papabear.order.api.DepositService;
import com.papabear.order.entity.MallFrontMoney;
import com.papabear.order.entity.MallOrder;
import com.papabear.pay.entity.PayChannel;
import com.weixinpay.model.WeixinPayUtils;
import com.weixinpay.model.WxPayDto;

/**
 * Created by Administrator on 2015/7/27.
 */
@Controller
@RequestMapping("/u/weixin")
class UWeiXinPayController extends AbstractController {
	@Resource
	DepositService depositService;
	@RequestMapping("/pay")
	String pay(ModelMap modelMap,@RequestParam("orderText") String orderText,@RequestParam("order_Number") String orderNumber,
		@RequestParam("fee") String fee,HttpServletRequest request) {
		User user = getUser();
		try {
			orderText = new String(orderText.getBytes("iso-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		MallOrder order = mallOrderService.queryOrderByOrderNumber(user, orderNumber);
		if(order==null){//为空
			return "pay/payError";
		}
		if(order.getStatus() == OrderStatusEnum.PAID.getCode()){//状态为支付
			modelMap.addAttribute("discountPrice", fee);
			modelMap.addAttribute("payType", PayChannel.WXPAY_PC.getType());
			return "pay/paySuccess";
		}
		
		WxPayDto pd = new WxPayDto();
		pd.setBody(orderText);// 订单描述
		pd.setOrderId(orderNumber);//订单号
		pd.setSpbillCreateIp(request.getRemoteAddr());//获取操作人的IP地址
		pd.setTotalFee(fee);
		//通过订单号查询看该订单是否被支付过如果支付过直接跳到一个错误页面 
		String url = WeixinPayUtils.getCodeurl(pd);
		if(StringUtils.isNotBlank(url)){
			modelMap.addAttribute("orderNumber",orderNumber);
			modelMap.addAttribute("payUrl",url);
			modelMap.addAttribute("discountPrice", fee);
			modelMap.addAttribute("orderItems", orderItemService.queryMallOrderItemsByOrderNumber(getUser().getId(), orderNumber));
			modelMap.addAttribute("receiver", orderRevicerInformationService.getOrderRevicerInformation(user, orderNumber));
		}else{ 
			return "pay/payError";
		}
		return "weixin/pay";
	}
	@ResponseBody
	@RequestMapping("/checkOrderPay")
	String checkOrderPay(ModelMap modelMap,@RequestParam("orderNumber") String orderNumber,HttpServletRequest request)  throws Exception {
		int code=0;
		String msg=null;
		User user =  getUser();
		MallOrder order = mallOrderService.queryOrderByOrderNumber(user, orderNumber);
		if(order==null){//为空
			//说明查到没有属于自己的这个订单
			code=1;
		}
		if(order.getStatus() == OrderStatusEnum.PAID.getCode()){//状态为支付
			//说明已经支付成功
			code=2;
		}
		return JSON.toJSONString(ResponseResult.result(code, msg));
	}
	@RequestMapping("/payEnd")
	String payEnd(ModelMap modelMap,@RequestParam("orderNumber") String orderNumber,@RequestParam(value = "payType", required = false) String payType,HttpServletRequest request) {
		modelMap.addAttribute("payType", payType);
		User user =  getUser();
		MallOrder order = mallOrderService.queryOrderByOrderNumber(user, orderNumber);
		if(order==null){//为空
			return "pay/payError";
		}
		if(order.getStatus() == OrderStatusEnum.PAID.getCode()){//状态为支付
			modelMap.addAttribute("discountPrice", order.getDiscountPrice());
			modelMap.addAttribute("payType", PayChannel.WXPAY_PC.getType());
			return "pay/paySuccess";
		}
		return "pay/payError";
	}
	
	
	/*********************************定金支付**********************************************************/
	@RequestMapping("/deposit/pay")
	String depositPay(ModelMap modelMap,@RequestParam("orderText") String orderText,@RequestParam("order_Number") String depositNumber,
		@RequestParam("fee") String fee,HttpServletRequest request) {
		User user = getUser();
		try {
			orderText = new String(orderText.getBytes("iso-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		MallFrontMoney deposit=depositService.getDeposit(user.getId(), depositNumber);
		if(deposit==null){//为空
			return "pay/payError";
		}
		if(deposit.getStatus() == OrderStatusEnum.PAID.getCode()){//状态为支付
			modelMap.addAttribute("discountPrice", deposit.getFrontMoney());
			modelMap.addAttribute("payType", PayChannel.WXPAY_PC.getType());
			return "pay/paySuccess";
		}
		
		WxPayDto pd = new WxPayDto();
		pd.setBody(orderText);// 订单描述
		pd.setOrderId(depositNumber);//订单号
		pd.setSpbillCreateIp(request.getRemoteAddr());//获取操作人的IP地址
		pd.setTotalFee(deposit.getFrontMoney().toString());
		//通过订单号查询看该订单是否被支付过如果支付过直接跳到一个错误页面 
		String url = WeixinPayUtils.getCodeurl(pd);
		if(StringUtils.isNotBlank(url)){
			modelMap.addAttribute("orderNumber",depositNumber);
			modelMap.addAttribute("payUrl",url);
			modelMap.addAttribute("discountPrice", deposit.getFrontMoney());
		}else{ 
			return "pay/payError";
		}
		return "deposit/weixin_pay";
	}
	@ResponseBody
	@RequestMapping("/deposit/checkOrderPay")
	String checkDepositPay(ModelMap modelMap,@RequestParam("orderNumber") String depositNumber,HttpServletRequest request)  throws Exception {
		int code=0;
		String msg=null;
		User user =  getUser();
		MallFrontMoney order = depositService.getDeposit(user.getId(), depositNumber);
		if(order==null){//为空
			//说明查到没有属于自己的这个订单
			code=1;
		}
		if(order.getStatus() == OrderStatusEnum.PAID.getCode()){//状态为支付
			//说明已经支付成功
			code=2;
		}
		return JSON.toJSONString(ResponseResult.result(code, msg));
	}
	@RequestMapping("/deposit/payEnd")
	String depositPayEnd(ModelMap modelMap,@RequestParam("orderNumber") String depositNumber,@RequestParam(value = "payType", required = false) String payType,HttpServletRequest request) {
		modelMap.addAttribute("payType", payType);
		User user =  getUser();
		MallFrontMoney order = depositService.getDeposit(user.getId(), depositNumber);
		if(order==null){//为空
			return "pay/payError";
		}
		if(order.getStatus() == OrderStatusEnum.PAID.getCode()){//状态为支付
			modelMap.addAttribute("discountPrice", order.getFrontMoney());
			modelMap.addAttribute("payType", PayChannel.WXPAY_PC.getType());
			return "pay/paySuccess";
		}
		return "pay/payError";
	}
}
