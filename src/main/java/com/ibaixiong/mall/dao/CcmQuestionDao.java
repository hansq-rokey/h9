package com.ibaixiong.mall.dao;

import com.ibaixiong.entity.CcmQuestion;

public interface CcmQuestionDao extends AbstractEntityDao{

    int deleteByPrimaryKey(Long id);

    int insert(CcmQuestion record);

    int insertSelective(CcmQuestion record);

    CcmQuestion selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(CcmQuestion record);

    int updateByPrimaryKey(CcmQuestion record);
}
