/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.mall.model;

import java.util.List;

import com.papabear.order.entity.MallAfterSalesService;

/**
 * 售后服务扩展类
 * 
 * @author yaoweiguo
 * @email 280435353@qq.com
 * @date 2016年3月10日
 * @since 1.0.0
 */
public class MallAfterSalesServiceExt {

	private MallAfterSalesService afterSalesService;

	private List<MallAfterSalesServiceItemExt> afterSalesServiceItems;

	public MallAfterSalesService getAfterSalesService() {
		return afterSalesService;
	}

	public void setAfterSalesService(MallAfterSalesService afterSalesService) {
		this.afterSalesService = afterSalesService;
	}

	public List<MallAfterSalesServiceItemExt> getAfterSalesServiceItems() {
		return afterSalesServiceItems;
	}

	public void setAfterSalesServiceItems(List<MallAfterSalesServiceItemExt> afterSalesServiceItems) {
		this.afterSalesServiceItems = afterSalesServiceItems;
	}

}
