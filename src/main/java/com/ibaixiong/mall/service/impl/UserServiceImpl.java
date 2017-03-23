package com.ibaixiong.mall.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ibaixiong.entity.User;
import com.ibaixiong.mall.service.UserService;

/**
 * Created by Administrator on 2015/7/27.
 */
@Service
class UserServiceImpl extends AbstractServiceImpl implements UserService {
	@Override
	public void update(User user) {
		userDao.updateByPrimaryKeySelective(user);
	}
	@Override
	public User get(long id) {
		return userDao.selectByPrimaryKey(id);
	}
	public List<String> queryRoles(Long userId) {
		
		return userDao.queryRoles(userId);
	}
	@Override
	public List<String> queryPermissions(Long userId) {
		
		return userDao.queryPermissions(userId);
	}
	
	@Override
	public List<String> queryRoleNames(Long userId) {
		return userDao.queryRoleNames(userId);
	}
}
