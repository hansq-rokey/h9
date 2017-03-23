package com.ibaixiong.mall.service;

import com.ibaixiong.entity.User;
import com.papabear.order.entity.MallOrderRevicerInformation;


/**
 * created by 重剑 on 2015/8/5
 */
public interface MallOrderRevicerInformationService {
	/**
	 * 查询收货人信息
	 * @param user     用户ID
	 * @param orderNumber   订单号
	 * @return
	 */
	MallOrderRevicerInformation getOrderRevicerInformation(User user,String orderNumber);
   
}
