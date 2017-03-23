/*
 * baixiong.com Inc.
 * Copyright (c) 1999-2001 All Rights Reserved.
 * 
 */
package com.ibaixiong.mall.model;

/**
 * 产品图片类型说明
 * @author yaoweiguo
 * @Email  yaoweiguo@ibaixiong.com
 * @Description TODO
 * @date 2015年12月1日
 *
 */
public enum PicTypeEnum {


	/**1 产品缩略图*/
	PRODUCT_THUMB((byte)1),
	/**2 规格缩略图*/
	FORMAT_THUMB((byte)2),
	/**3APP产品详细顶部图*/
	APP_DETAIL_TOP((byte)3);
	
	private Byte code;

	private PicTypeEnum(Byte code) {
		this.code = code;
	}

	public Byte getCode() {
		return code;
	}
	
	
}
