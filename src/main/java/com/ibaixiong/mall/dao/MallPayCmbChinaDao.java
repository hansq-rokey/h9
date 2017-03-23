package com.ibaixiong.mall.dao;

import com.ibaixiong.entity.MallPayCmbChina;

public interface MallPayCmbChinaDao {
    int deleteByPrimaryKey(Long id);

    int insert(MallPayCmbChina record);

    int insertSelective(MallPayCmbChina record);

    MallPayCmbChina selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(MallPayCmbChina record);

    int updateByPrimaryKey(MallPayCmbChina record);
}