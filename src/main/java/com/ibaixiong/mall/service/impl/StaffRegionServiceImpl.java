package com.ibaixiong.mall.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibaixiong.entity.StaffRegion;
import com.ibaixiong.mall.dao.StaffRegionDao;
import com.ibaixiong.mall.service.StaffRegionService;

@Service
public class StaffRegionServiceImpl implements StaffRegionService {
	@Resource
	private StaffRegionDao staffRegionDao;

	@Override
	public StaffRegion selectByPrimaryKey(Long id) {
		return staffRegionDao.selectByPrimaryKey(id);
	}
	
}
