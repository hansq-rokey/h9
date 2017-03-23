package com.ibaixiong.mall.dao;

import java.util.List;

import com.ibaixiong.entity.ScanRecod;

public interface ScanRecodDao {

	int insert(ScanRecod record);

	ScanRecod selectByPrimaryKey(Long id);

	List<ScanRecod> selectByUniqueCode(String uniqueCode);

}