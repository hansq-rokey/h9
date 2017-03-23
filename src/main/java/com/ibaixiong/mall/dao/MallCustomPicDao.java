package com.ibaixiong.mall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ibaixiong.entity.MallCustomPic;

public interface MallCustomPicDao extends AbstractEntityDao {

    int deleteByPrimaryKey(Long id);

    int insert(MallCustomPic record);

    int insertSelective(MallCustomPic record);

    MallCustomPic selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(MallCustomPic record);

    int updateByPrimaryKey(MallCustomPic record);
	
	int updateOrderNumberById(Map<String, Object> map);
	
	MallCustomPic getmalCustomPic(@Param("userId")Long userId,@Param("picName") String picName);
	
	List<MallCustomPic> queryByOrderNumber(String orderNumber);
}
