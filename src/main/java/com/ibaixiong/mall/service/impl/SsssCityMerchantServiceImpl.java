package com.ibaixiong.mall.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibaixiong.entity.SsssCityMerchant;
import com.ibaixiong.mall.dao.SsssCityMerchantDao;
import com.ibaixiong.mall.service.SsssCityMerchantService;
@Service
public class SsssCityMerchantServiceImpl implements SsssCityMerchantService{
	@Resource
	private SsssCityMerchantDao ssssCityMerchantDao;

	@Override
	public SsssCityMerchant getByUserId(Long userId) {
		return ssssCityMerchantDao.getByUserId(userId);
	}

	@Override
	public void insert(SsssCityMerchant merchant) {
		ssssCityMerchantDao.insertSelective(merchant);
	}

	@Override
	public void update(SsssCityMerchant merchant) {
		ssssCityMerchantDao.updateByPrimaryKeySelective(merchant);
	}
}
