package com.ibaixiong.mall.service;

import com.ibaixiong.entity.MallOrderLogistics;

public interface MallOrderLogisticsService {
	/**
	 * 查询物流信息
	 * @param orderNumber
	 * @return
	 */
	String queryLogisticsTraceByOrderNumber(String orderNumber);
	
	/**
	 * 确定是该用户的订单下才可以使用
	 * @param orderNumber
	 * @return
	 */
	MallOrderLogistics getMallOrderLogistics(String orderNumber);
}
