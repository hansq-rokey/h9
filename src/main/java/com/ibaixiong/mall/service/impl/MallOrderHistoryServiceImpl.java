package com.ibaixiong.mall.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibaixiong.entity.User;
import com.ibaixiong.entity.util.OrderStatusEnum;
import com.ibaixiong.mall.service.MallOrderHistoryService;
import com.papabear.order.api.OrderService;
import com.papabear.order.entity.MallOrderHistory;

@Service
class MallOrderHistoryServiceImpl implements MallOrderHistoryService {
	@Resource
	private OrderService orderService;
	@Override
	public List<MallOrderHistory> queryHistoryByOrderNumber(String orderNumber) {
		return orderService.queryHistoryByOrderNumber(orderNumber);
	}
	@Override
	public MallOrderHistory getmMallOrderHistory(String orderNumber, OrderStatusEnum orderStatusEnum, User user) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("orderNumber", orderNumber);
		map.put("status", orderStatusEnum.getCode());
		map.put("userId", user.getId());
		return orderService.getMallOrderHistory(orderNumber, orderStatusEnum.getCode(), user.getId());
	}
	@Override
	public int addMallOrderHistory(String orderNumber, Long userId, String ip, Byte status, Byte operateType){
		return orderService.addOrderHistory(orderNumber, userId, ip, status, operateType);
	}
}
