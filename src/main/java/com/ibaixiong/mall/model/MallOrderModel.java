/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.mall.model;

import java.util.List;

import com.papabear.order.entity.MallOrder;

/**
 * 用于前台数据模型
 * @author yaoweiguo
 * @email  280435353@qq.com
 * @date   2016年3月9日
 * @since  1.0.0
 */
public class MallOrderModel extends MallOrder {
    /**
	 * 
	 */
	private static final long serialVersionUID = -7139656546770389175L;
	//购物车下单时使用邀请码的情况下用到
    private List<MallCarItemExt> carItems;

	public List<MallCarItemExt> getCarItems() {
		return carItems;
	}

	public void setCarItems(List<MallCarItemExt> carItems) {
		this.carItems = carItems;
	}
    
    
}
