package com.ibaixiong.mall.dao;

import com.ibaixiong.entity.VerificationCode;

public interface VerificationCodeDao {

    int deleteByPrimaryKey(Long id);

    int insert(VerificationCode record);

    int insertSelective(VerificationCode record);

    VerificationCode selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(VerificationCode record);

    int updateByPrimaryKey(VerificationCode record);
	
    /**
     * 根据用户查询验证码
     * @param name   手机号码/邮箱
     * @return
     */
    VerificationCode selectByName(String name);
}