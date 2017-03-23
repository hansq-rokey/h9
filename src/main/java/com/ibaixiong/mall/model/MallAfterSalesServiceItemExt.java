/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.mall.model;

import java.util.List;

import com.papabear.order.entity.MallAfterSalesServiceItem;
import com.papabear.product.entity.MallBasicCategoryModelFormat;
import com.papabear.product.entity.MallProductPic;

/**
 * 售后服务商品详情扩展
 * @author yaoweiguo
 * @email  280435353@qq.com
 * @date   2016年3月11日
 * @since  1.0.0
 */
public class MallAfterSalesServiceItemExt {

	private MallAfterSalesServiceItem serviceItem;
	
	private MallBasicCategoryModelFormat format;
	
	private List<MallProductPic> pics;

	public MallAfterSalesServiceItem getServiceItem() {
		return serviceItem;
	}

	public void setServiceItem(MallAfterSalesServiceItem serviceItem) {
		this.serviceItem = serviceItem;
	}

	public List<MallProductPic> getPics() {
		return pics;
	}

	public void setPics(List<MallProductPic> pics) {
		this.pics = pics;
	}
	public MallBasicCategoryModelFormat getFormat() {
		return format;
	}

	public void setFormat(MallBasicCategoryModelFormat format) {
		this.format = format;
	}

}
