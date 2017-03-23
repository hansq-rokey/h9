package com.ibaixiong.mall.service;

import com.ibaixiong.entity.ErpSecurityCodeMacRelation;

public interface ErpSecurityCodeMacRelationService {
	
	/**
	 * 查询mac地址
	 * @param code		防伪码
	 * @return
	 */
	ErpSecurityCodeMacRelation getErpSecurityCodeMacRelation(String code);
}
