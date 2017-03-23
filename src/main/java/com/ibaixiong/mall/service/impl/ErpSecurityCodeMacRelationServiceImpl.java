package com.ibaixiong.mall.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibaixiong.entity.ErpSecurityCodeMacRelation;
import com.ibaixiong.mall.dao.ErpSecurityCodeMacRelationDao;
import com.ibaixiong.mall.service.ErpSecurityCodeMacRelationService;

@Service
public class ErpSecurityCodeMacRelationServiceImpl implements ErpSecurityCodeMacRelationService {

	@Resource
	ErpSecurityCodeMacRelationDao securityCodeMacRelationDao;
//	private Logger logger=LoggerFactory.getLogger(getClass());
	

	

	@Override
	public ErpSecurityCodeMacRelation getErpSecurityCodeMacRelation(String code) {

		return securityCodeMacRelationDao.getSecurityCodeMacRelation(code);
	}
}
