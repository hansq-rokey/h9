package com.ibaixiong.mall.service;

import java.util.List;

import com.ibaixiong.entity.MallAddress;
import com.ibaixiong.entity.User;

/**
 * created by 重剑 on 2015/8/24
 */
public interface AddressService {

    Long add(MallAddress address);

    int update(MallAddress address);

    int remove(MallAddress address);
    
    List<MallAddress> getList(User user);
    
    int setDefUpdate(MallAddress address);
}
