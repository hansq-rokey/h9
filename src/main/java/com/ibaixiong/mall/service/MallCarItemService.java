package com.ibaixiong.mall.service;

import java.util.List;

import com.ibaixiong.entity.User;
import com.ibaixiong.mall.model.MallCarItemExt;
import com.papabear.order.entity.MallCarItem;

/**
 * Created by Administrator on 2015/8/4.
 */
public interface MallCarItemService {

    /**
     *
     * @param user
     * @param formatId 购买型号
     * @param num 购买数量
     * @param productId  产品Id
     */
//    void add(User user, long formatId, int num,long productId);
    /**
     * 删除购物车
     * @param user
     * @param carItem 购物车Id
     * @return
     */
    int delete(Long userId, Long carId);

    /** 只能更新 num 属性  0:num 不能小于1 ； -1 :库存不足   1：正常 */
    int update(User user, MallCarItem carItem);

    List<MallCarItem> list(Long userId);
    
    /**
     * @param user
     * @param carItemIdList 例如 1,2,3,4...
     * @param carItemNumList        同上     */
	List<MallCarItem> confirm(User user, String carItemIdList, String carItemNumList);
	
	List<MallCarItemExt> getList(User user);
}