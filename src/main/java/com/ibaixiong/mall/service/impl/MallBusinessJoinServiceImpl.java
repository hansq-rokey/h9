/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.mall.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibaixiong.entity.MallBusinessJoin;
import com.ibaixiong.mall.dao.MallBusinessJoinDao;
import com.ibaixiong.mall.service.MallBusinessJoinService;
import com.papabear.commons.entity.enumentity.Constant.Status;

/**
 * 
 * @author yaoweiguo
 * @email  280435353@qq.com
 * @date   2016年7月12日
 * @since  1.0.0
 */
@Service
public class MallBusinessJoinServiceImpl implements MallBusinessJoinService {

	@Resource
	private MallBusinessJoinDao businessJoinDao;
	/* (non-Javadoc)
	 * @see com.ibaixiong.mall.service.MallBusinessJoinService#add(com.ibaixiong.entity.MallBusinessJoin)
	 */
	@Override
	public void add(MallBusinessJoin businessJoin) {
		businessJoin.setCreateDateTime(new Date());
		businessJoin.setStatus(Status.NORMAL.getStatus());
		businessJoin.setOrigin((byte)2);
		businessJoinDao.insert(businessJoin);
		
	}

	
	
}
