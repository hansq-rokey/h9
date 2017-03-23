package com.ibaixiong.mall.service;

import java.util.List;

import com.ibaixiong.entity.MallAddress;
import com.ibaixiong.entity.User;
import com.papabear.order.entity.MallAfterSalesService;
import com.papabear.order.entity.MallOrderItem;

/**
 * created by 重剑 on 2015/8/30 0030
 */
public interface OrderItemService {
	/**
	 * 添加
	 * @param service
	 * @param address
	 * @param regional
	 * @param regionalName
	 * @param user
	 * @return
	 */
	Long add(MallAfterSalesService service,MallAddress address,String regional,String regionalName,User user,String ip);

	/**
	 * 查询订单详细信息
	 * @param userId		用户ID
	 * @param orderNumber	订单编号
	 * @return
	 */
	List<MallOrderItem> queryMallOrderItemsByOrderNumber(Long userId, String orderNumber);
	/**
	 * 查询订单详细信息及图片
	 * @param userId
	 * @param orderNumber
	 * @return
	 */
	List<MallOrderItem> queryMallOrderItemsAndPicsByOrderNumber(Long userId, String orderNumber);
}
