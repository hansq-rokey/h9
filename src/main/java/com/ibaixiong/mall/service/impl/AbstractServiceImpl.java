package com.ibaixiong.mall.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.ibaixiong.mall.dao.MallAddressDao;
import com.ibaixiong.mall.dao.UserDao;
import com.ibaixiong.mall.dao.VerificationCodeDao;

/**
 * Created by Administrator on 2015/7/28.
 */
abstract class AbstractServiceImpl {

	protected Logger logger = Logger.getLogger(this.getClass());

	@Resource
	MallAddressDao addressDao;

	@Resource
	UserDao userDao;

	@Resource
	VerificationCodeDao verificationCodeDao;

}
