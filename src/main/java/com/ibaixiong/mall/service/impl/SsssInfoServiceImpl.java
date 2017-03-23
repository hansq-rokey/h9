package com.ibaixiong.mall.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibaixiong.entity.SsssInfo;
import com.ibaixiong.mall.dao.SsssInfoDao;
import com.ibaixiong.mall.service.SsssInfoService;

@Service
public class SsssInfoServiceImpl implements SsssInfoService {
	@Resource
	SsssInfoDao ssssInfoDao;

	@Override
	public SsssInfo getByUserId(Long userId) {
		return ssssInfoDao.getByUserId(userId);
	}

	/**
	 * 扣除金额
	 * 
	 * @param money
	 * @return
	 */
	@Override
	public int reduceMoney(Long ssssId, Float money) {
		return ssssInfoDao.reduceMoney(ssssId, money);
	}

}
