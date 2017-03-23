package com.ibaixiong.mall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ibaixiong.mall.model.DictCode;


public interface DictCodeDao {
    int deleteByPrimaryKey(Long id);

    int insert(DictCode record);

    int insertSelective(DictCode record);

    DictCode selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(DictCode record);

    int updateByPrimaryKey(DictCode record);
    
    List<DictCode> queryDictCodeList(Map<String, Object> map);
    
    DictCode getByDictTypeAndValue(@Param("dictType")String dictType,@Param("dictCodeValue")String dictTypeValue);
}