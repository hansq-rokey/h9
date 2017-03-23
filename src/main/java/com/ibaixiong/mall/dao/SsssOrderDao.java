package com.ibaixiong.mall.dao;

import java.util.List;

import com.ibaixiong.entity.SsssOrder;

public interface SsssOrderDao {
    int deleteByPrimaryKey(Long id);

    int insert(SsssOrder record);

    int insertSelective(SsssOrder record);

    SsssOrder selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SsssOrder record);

    int updateByPrimaryKey(SsssOrder record);
    
    List<SsssOrder> getOrderByNumber(String number);
}