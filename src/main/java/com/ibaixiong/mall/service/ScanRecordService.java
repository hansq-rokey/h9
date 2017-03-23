/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.mall.service;

import java.util.List;

import com.ibaixiong.entity.ErpHardwareProduct;
import com.ibaixiong.entity.ScanRecod;

/**
 * @description 
 * @author chenzehe
 * @email hljuczh@163.com
 * @create 2015年12月11日-下午4:52:12
 */
public interface ScanRecordService {
	ErpHardwareProduct getErpHardwareProductByMacCode(String macCode);

	List<ScanRecod> getListScanRecod(String uniqueCode);
}
