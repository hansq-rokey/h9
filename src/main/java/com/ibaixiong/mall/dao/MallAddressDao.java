package com.ibaixiong.mall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ibaixiong.entity.MallAddress;

public interface MallAddressDao {
    int deleteByPrimaryKey(Long id);

    int insert(MallAddress record);

    Long insertSelective(MallAddress record);

    MallAddress selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(MallAddress record);

    int updateByPrimaryKey(MallAddress record);
    
    int remove(MallAddress address);
    /**
     * 获取用户的地址列表,原来的方法getList
     * @param userId
     * @param status
     * @return
     */
    List<MallAddress> queryAddressList(@Param("userId")Long userId,@Param("status")Byte status);
    /**
     * 用户ID 和id查询对象
     * @param id	         地址ID
     * @param userId   用户id
     * @return
     */
    MallAddress  getMallAddress(@Param("id")Long id,@Param("userId")Long userId);
    
    int setDefUpdate(MallAddress address);
    
    int setNotDefUpdate(MallAddress address);
}