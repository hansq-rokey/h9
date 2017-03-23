package com.ibaixiong.mall.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibaixiong.entity.User;
import com.ibaixiong.mall.service.MallOrderRevicerInformationService;
import com.papabear.order.api.OrderService;
import com.papabear.order.entity.MallOrderRevicerInformation;

@Service
class MallOrderRevicerInformationServiceImpl implements MallOrderRevicerInformationService {
	@Resource
	private OrderService orderService;
	@Override
	public MallOrderRevicerInformation getOrderRevicerInformation(User user,String orderNumber) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("orderNumber", orderNumber);
		map.put("userId", user.getId());
		return orderService.getRevicerByUserIdAndOrderNumber(user.getId(), orderNumber);
	}
}
