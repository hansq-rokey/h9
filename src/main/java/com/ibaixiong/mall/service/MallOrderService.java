package com.ibaixiong.mall.service;

import java.util.List;

import com.ibaixiong.entity.User;
import com.ibaixiong.mall.model.MallOrderModel;
import com.ibaixiong.mall.model.OrderSubmitInfo;
import com.papabear.commons.entity.Pager;
import com.papabear.order.entity.MallCarItem;
import com.papabear.order.entity.MallOrder;
import com.papabear.product.entity.MallBasicCategoryModelFormat;
import com.papabear.product.entity.MallFormatExt;

/**
 * created by 重剑 on 2015/8/5
 */
public interface MallOrderService {
	
	/**
     * 列出用户的订单,默认分页10
     * @param userId		用户ID
     * @param pageNo		分页
     * @param pageSize		分页大小
     * @param statusArray	状态数据
     * @return
     */
	Pager<MallOrder> queryOrderByStatusArr(Long userId,Byte[] statusArray, int pageNo);
	/**
     * 列出用户的订单
     * @param userId		用户ID
     * @param pageNo		分页
     * @param pageSize		分页大小
     * @param statusArray	状态数据
     * @return
     */
	Pager<MallOrder> queryOrderByStatusArr(Long userId,Byte[] statusArray, int pageNo, int pageSize);

	/**
     * 列出用户的订单,默认分页10
     * @param userId		用户ID
     * @param status		状态
     * @param pageNo		分页
     * @param pageSize		分页大小
     * @return
     */
	Pager<MallOrder> queryOrderByStatus(Long userId,Byte status, int pageNo);
	/**
     * 列出用户的订单
     * @param userId		用户ID
     * @param status		状态
     * @param pageNo		分页
     * @param pageSize		分页大小
     * @return
     */
	Pager<MallOrder> queryOrderByStatus(Long userId,Byte status, int pageNo, int pageSize);

    /**
     * 
     * @param order
     * @param addressId
     * @param deliverTimeName
     * @param deliverValue
     * @param ip
     * @param inviteCodeId  邀请码ID
     * @return
     */
    MallOrder commit(MallOrderModel order,User user,Long addressId,String deliverTimeName,String deliverValue,String ip,List<MallCarItem> mallList);
    
    /**
     * 单个产品下单
     * @author yaoweiguo
     * @date 2016年5月23日
     * @param user
     * @param info
     * @param ip
     * @return
     */
    MallOrder createSingleOrder(User user,MallBasicCategoryModelFormat format,OrderSubmitInfo info,String ip,List<MallFormatExt> extList,Float totalPrice,String depositIds,Float length,Float width,Float hight,Float groundArea,Float fixateProfit);    

    /**
     * 单个订单详情
     * @param user
     * @param orderNumber  订单号
     * @return
     */
    MallOrder queryOrderByOrderNumber(User user,String orderNumber);
    /**
	 * 更新订单状态
	 * 
	 * @param status
	 *            订单状态
	 * @param orderNumber
	 *            订单编号
	 * @return
	 */
    int updateOrderStatus(Byte status, String orderNumber);
    
    
    /**
     * 活动页面下单
     * @param user
     * @param format
     * @param remark
     * @param num
     * @param ip
     * @param dictTypeValue
     * @param address
     * @param countyId
     * @param name
     * @param phone
     * @param totalPrice
     * @param length
     * @param width
     * @param height
     * @param groundArea
     * @param fixateProfit
     * @return
     */
    public MallOrder createSingleOrderSource(
			User user,MallBasicCategoryModelFormat format,
			String remark,Float num,String ip,Byte dictTypeValue,
			String address,Long countyId,String name,String phone,
			Float totalPrice,Float length,Float width,Float height,Float groundArea,Float fixateProfit);
    
}
