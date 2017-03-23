package com.ibaixiong.mall.dao;

import com.ibaixiong.entity.PayHistory;


public interface PayHistoryDao {
    int deleteByPrimaryKey(Long id);

    int insert(PayHistory record);

    int insertSelective(PayHistory record);

    PayHistory selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(PayHistory record);

    int updateByPrimaryKey(PayHistory record);
}