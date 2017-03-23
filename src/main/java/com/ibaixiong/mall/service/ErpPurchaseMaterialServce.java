/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.mall.service;

/**
 * 
 * @author yaoweiguo
 * @email  280435353@qq.com
 * @date   2016年7月20日
 * @since  1.0.0
 */
public interface ErpPurchaseMaterialServce {

	/**
	 * 计算发热墙纸价格
	 * @author yaoweiguo
	 * @date 2016年7月20日
	 * @param formatId
	 * @param wallArea
	 * @param groundArea
	 * @return
	 */
	float calculatePrice(Long formatId, float wallArea,float groundArea);
}
