package com.ibaixiong.mall.service;

import java.util.Map;

import com.papabear.pay.entity.OrderPayCmbChina;
import com.papabear.pay.entity.PayChannel;

public interface PayNotifyService {

	void payNotifyWxPay(String orderNumber, String thirdNumber, String ip, Float totalFee, PayChannel payChannel, Map<String, Object> map);

	void payNotifyAlipay(Map<String, String> params, PayChannel payChannel, String ip);

	boolean payNotifyCmbChina(String orderNumber, String ip, OrderPayCmbChina payCmbChina);
	
	void payDepositNotifyWxPay(String orderNumber, String thirdNumber, String ip, Float totalFee, PayChannel payChannel, Map<String, Object> map);
	
	void payDepositNotifyAlipay(Map<String, String> params, PayChannel payChannel, String ip);
	
	boolean payDepositNotifyCmbChina(String orderNumber, String ip, OrderPayCmbChina payCmbChina);

}
