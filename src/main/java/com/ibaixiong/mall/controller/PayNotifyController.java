/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.mall.controller;

import java.io.BufferedOutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alipay.util.AlipayNotify;
import com.ibaixiong.mall.service.PayNotifyService;
import com.papabear.pay.entity.PayChannel;
import com.weixinpay.model.Notify;

/**
 * @description
 * @author zhaolei
 * @create 2015年11月19日-上午11:25:42
 */
@Controller
@RequestMapping("/pay/notify")
class PayNotifyController {
	
	Logger logger= LoggerFactory.getLogger(getClass());
	@Resource
	PayNotifyService payAfterService;

	@RequestMapping("/ali/app")
	void aliApp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		aliPayNotify(request, response, PayChannel.ALIPAY_APP);
	}

	@RequestMapping("/ali/pc")
	void aliPc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		aliPayNotify(request, response, PayChannel.ALIPYAY_PC);
	}

	/**
	 * 支付宝回调通知处理
	 * 
	 * @param request
	 * @param response
	 * @param payType
	 * @throws Exception
	 */
	private void aliPayNotify(HttpServletRequest request, HttpServletResponse response, PayChannel payChannel) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			params.put(name, valueStr);
		}

		String msg = "";
		if (AlipayNotify.verify(params)) {
			String trade_status = params.get("trade_status");
			if ("TRADE_FINISHED".equals(trade_status) || "TRADE_SUCCESS".equals(trade_status)) {
				payAfterService.payNotifyAlipay(params, payChannel, request.getRemoteAddr());
			}
			msg = "success";
		} else {
			msg = "fail";
		}
		PrintWriter writer = null;
		writer = response.getWriter();
		writer.write(msg);
		writer.close();
	}

	@RequestMapping("/wx/app")
	void wxApp(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		wxPayNotify(request, response, PayChannel.WXPAY_APP);
	}

	@RequestMapping("/wx/pc")
	void wxPc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		wxPayNotify(request, response, PayChannel.WXPAY_PC);
	}

	private void wxPayNotify(HttpServletRequest request, HttpServletResponse response, PayChannel payChannel) throws Exception {
		String inputLine = null;
		String notityXml = ""; // "<xml><appid><![CDATA[wxa6aa5833e4953106]]></appid><bank_type><![CDATA[CFT]]></bank_type><cash_fee><![CDATA[1]]></cash_fee><fee_type><![CDATA[CNY]]></fee_type><is_subscribe><![CDATA[Y]]></is_subscribe><mch_id><![CDATA[1269303801]]></mch_id><nonce_str><![CDATA[1817547416]]></nonce_str><openid><![CDATA[o98rqvoBRh9n9uQA9gnrAmrg453E]]></openid><out_trade_no><![CDATA[1442303706]]></out_trade_no><result_code><![CDATA[SUCCESS]]></result_code><return_code><![CDATA[SUCCESS]]></return_code><sign><![CDATA[E79D80F5B0B5549CCA4D52603D3ABEDE]]></sign><time_end><![CDATA[20150916181832]]></time_end><total_fee>1</total_fee><trade_type><![CDATA[NATIVE]]></trade_type><transaction_id><![CDATA[1003230407201509160898807762]]></transaction_id></xml>";
		String resXml = "";
		try {
			while ((inputLine = request.getReader().readLine()) != null) {
				notityXml += inputLine;
			}
			request.getReader().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("微信支付成功后返回的数据={}",notityXml);
		Map<String, Object> map = Notify.parseXmlToList2(notityXml);
		/*
		 * WxPayResult wpr = new WxPayResult();
		 * wpr.appid(m.get("appid").toString());
		 * wpr.bankType(m.get("bank_type").toString());
		 * wpr.cashFee(m.get("cash_fee").toString());
		 * wpr.feeType(m.get("fee_type").toString());
		 * wpr.isSubscribe(m.get("is_subscribe").toString());
		 * wpr.mchId(m.get("mch_id").toString());
		 * wpr.nonceStr(m.get("nonce_str").toString());
		 * wpr.openid(m.get("openid").toString());
		 * wpr.setOutTradeNo(m.get("out_trade_no"));
		 * wpr.setResultCode(m.get("result_code"));
		 * wpr.returnCode(m.get("return_code").toString());
		 * wpr.sign(m.get("sign").toString());
		 * wpr.timeEnd(m.get("time_end").toString());
		 * wpr.totalFee(m.get("total_fee").toString());
		 * wpr.tradeType(m.get("trade_type").toString());
		 * wpr.setTransactionId(m.get("transaction_id"));
		 */

		if ("SUCCESS".equals(map.get("return_code").toString())) {
			resXml = "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>";
			float totalFee = Float.valueOf(map.get("total_fee").toString()) / 100;//微信支付以分为单位，需要转换成元
			payAfterService.payNotifyWxPay(map.get("out_trade_no").toString(), map.get("transaction_id").toString(), request.getRemoteAddr(), totalFee,
					payChannel, map);
		} else {
			resXml = "<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[报文为空]]></return_msg></xml>";
		}
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		out.write(resXml.getBytes());
		out.flush();
		out.close();
	}
}
