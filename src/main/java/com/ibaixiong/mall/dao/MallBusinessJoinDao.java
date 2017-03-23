package com.ibaixiong.mall.dao;

import com.ibaixiong.entity.MallBusinessJoin;

public interface MallBusinessJoinDao {
    int deleteByPrimaryKey(Long id);

    int insert(MallBusinessJoin record);

    int insertSelective(MallBusinessJoin record);

    MallBusinessJoin selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(MallBusinessJoin record);

    int updateByPrimaryKey(MallBusinessJoin record);
}