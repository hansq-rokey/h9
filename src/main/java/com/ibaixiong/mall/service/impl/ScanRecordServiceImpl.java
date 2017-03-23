/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.mall.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ibaixiong.entity.ErpHardwareProduct;
import com.ibaixiong.entity.ScanRecod;
import com.ibaixiong.mall.dao.MallHardwareProductDao;
import com.ibaixiong.mall.dao.ScanRecodDao;
import com.ibaixiong.mall.service.ScanRecordService;
import com.papabear.product.api.CategoryQueryService;

/**
 * @description
 * @author chenzehe
 * @email hljuczh@163.com
 * @create 2015年12月11日-下午4:53:39
 */
@Service
public class ScanRecordServiceImpl implements ScanRecordService {
	@Autowired
	MallHardwareProductDao mallHardwareProductDao;
	@Autowired
	ScanRecodDao scanRecodDao;
	@Resource
	CategoryQueryService categoryQueryService;

	@Override
	public ErpHardwareProduct getErpHardwareProductByMacCode(String macCode) {
		ErpHardwareProduct ep = mallHardwareProductDao.getErpHardwareProductByMacNumber(macCode);
		if(ep != null){
			ep.setCategory(categoryQueryService.getCategoryById(ep.getCategoryId()));
			ep.setCategoryModel(categoryQueryService.getCategoryModelById(ep.getCategoryModelId()));
			ep.setCategoryModelFormat(categoryQueryService.getCategoryModelFormatById(ep.getCategoryModelFormatId()));
		}
		return ep;
	}

	@Override
	public List<ScanRecod> getListScanRecod(String uniqueCode) {
		if (uniqueCode.length() != 16) {
			return null;
		}
		ScanRecod scanRecod = new ScanRecod();
		scanRecod.setCreateDateTime(new Date());
		scanRecod.setStatus((short) 1);
		scanRecod.setUniqueCode(uniqueCode);
		scanRecodDao.insert(scanRecod);
		return scanRecodDao.selectByUniqueCode(uniqueCode);
	}

}
