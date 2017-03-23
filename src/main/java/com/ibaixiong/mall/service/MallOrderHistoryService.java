package com.ibaixiong.mall.service;

import java.util.List;

import com.ibaixiong.entity.User;
import com.ibaixiong.entity.util.OrderStatusEnum;
import com.papabear.order.entity.MallOrderHistory;

public interface MallOrderHistoryService {

	List<MallOrderHistory> queryHistoryByOrderNumber(String orderNumber);
	
	/**
	 * 查询某订单状态变更历史记录
	 * @param orderNumber
	 * @param orderStatusEnum
	 * @param user
	 * @return
	 */
	MallOrderHistory getmMallOrderHistory(String orderNumber,OrderStatusEnum orderStatusEnum,User user);
	/**
	 * 只要修改了订单数据，都需要在订单历史记录表进行添加一条记录
	 * 
	 * @param orderNumber		订单编号
	 * @param userId			用户ID
	 * @param ip				用户操作IP
	 * @param status			订单状态
	 * @param operateType		操作类型 {@link com.papabear.order.entity.OrderConstant.OrderOperateTye}
	 * @return
	 */
	int addMallOrderHistory(String orderNumber, Long userId, String ip, Byte status, Byte operateType);
}
