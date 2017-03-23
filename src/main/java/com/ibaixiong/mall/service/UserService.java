package com.ibaixiong.mall.service;

import java.util.List;

import com.ibaixiong.entity.User;

public interface UserService {
	void update(User user);
	User get(long id);
	
	/**
	 * 根据用户ID查询角色信息
	 * @param userId   用户id
	 * @return   
	 */
	List<String> queryRoles(Long userId);
	
	/**
     * 根据用户ID查询权限
     * @param userId
     * @return
     */
	List<String> queryPermissions(Long userId);
	
	/**
     * 根据用户id查询角色名称
     * @param userId
     * @return
     */
    List<String> queryRoleNames(Long userId);
}
