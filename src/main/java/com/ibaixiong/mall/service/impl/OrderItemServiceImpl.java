package com.ibaixiong.mall.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibaixiong.entity.MallAddress;
import com.ibaixiong.entity.MallCustomPic;
import com.ibaixiong.entity.User;
import com.ibaixiong.mall.dao.MallCustomPicDao;
import com.ibaixiong.mall.service.OrderItemService;
import com.papabear.order.api.AfterSaleService;
import com.papabear.order.api.OrderService;
import com.papabear.order.entity.MallAfterSalesService;
import com.papabear.order.entity.MallOrder;
import com.papabear.order.entity.MallOrderItem;
import com.papabear.order.entity.MallOrderRevicerInformation;
import com.papabear.order.entity.OrderConstant.OrderOperateTye;
import com.papabear.order.entity.OrderConstant.OrderStatus;
import com.papabear.product.api.ProductQueryService;
import com.papabear.product.entity.MallProductPic;



/**
 * Created by Administrator on 2015/8/30 0030.
 */
@Service
class OrderItemServiceImpl extends AbstractServiceImpl implements OrderItemService {
	@Resource
	private OrderService orderService;
	@Resource
	private AfterSaleService afterSaleService;
	@Resource
	private ProductQueryService productQueryService;
	@Resource
	private MallCustomPicDao customPicDao;
	@Override
	public List<com.papabear.order.entity.MallOrderItem> queryMallOrderItemsByOrderNumber(Long userId,String orderNumber) {
		return orderService.queryOrderItems(userId, orderNumber);
	}
	/**
	 * 查询订单详细信息及图片
	 * @param userId
	 * @param orderNumber
	 * @return
	 */
	public List<MallOrderItem> queryMallOrderItemsAndPicsByOrderNumber(@Param("userId")Long userId, @Param("orderNumber")String orderNumber){
//		return orderItemDao.queryMallOrderItemsAndPicsByOrderNumber(userId, orderNumber);TODO
		MallOrder order = orderService.getOrderByOrderNumber(userId, orderNumber);
		List<MallOrderItem> orderItems=orderService.queryOrderItems(userId, orderNumber);
//		List<MallOrderItemExt> list=new ArrayList<MallOrderItemExt>();
		for(MallOrderItem	item:orderItems){
//			MallOrderItemExt ext=new MallOrderItemExt();
//			ext.setOrderItem(item);
			Map<String, Object>map=new HashMap<String, Object>();
			map.put("productId", item.getProductId());
			map.put("formatId", item.getProductModelFormatId());
			if(order.getIsCustomMade()!=null&&order.getIsCustomMade().intValue()==1){
				
				List<MallCustomPic> customPics= customPicDao.queryByOrderNumber(order.getOrderNumber());
				List<MallProductPic> picList=new ArrayList<MallProductPic>();
				for(MallCustomPic pic:customPics){
					MallProductPic p=new MallProductPic();
					p.setUrl(pic.getUrl());
					picList.add(p);
				}
				customPics=null;
				item.setPics(picList);
			}else{
				item.setPics(productQueryService.queryProductPicByFormatId(map));					
			}
			//item.setPics(productQueryService.queryProductPicByFormatId(map));
			item.setOrderItemExts(orderService.queryOrderItemExts(item.getOrderNumber(), item.getId()));
//			list.add(ext);
		}
		
		return orderItems;
	}
	@Override
	@Transactional
	public Long add(MallAfterSalesService service, MallAddress address,String regional, String regionalName, User user,String ip) {
				
		service=afterSaleService.addAfterSalesService(service,user.getId(),ip);

		String[] regIds = regional.split("-");
		String[] regNames = regionalName.split("-");
		//快递信息保存
		MallOrderRevicerInformation revicer=new MallOrderRevicerInformation();
//		revicer.deliverTimeName			=deliverTimeName
//		revicer.deliverTimeValue	=deliverValue
		revicer.setCityCode(regIds[1]);
		revicer.setCityName(regNames[1]);
		revicer.setCreateDateTime(new Date());
		revicer.setDetailAddress(address.getDetailAddress());
		revicer.setDistrictCode(regIds[2]);
		revicer.setDistrictName(regNames[2]);
		revicer.setMobilePhone(address.getMobilePhone());
		revicer.setOrderId(service.getId());
		revicer.setOrderNumber(service.getServiceNumber());
		revicer.setProvinceCode(regIds[0]);
		revicer.setProvinceName(regNames[0]);
		revicer.setReveiveUserName(address.getUserName());//收货人
		revicer.setTelPhone(address.getTelPhone());
		revicer.setUserId(user.getId());
		revicer.setZipcode(address.getZipcode());
//		orderRevicerInformationDao.insert(revicer);
		
		orderService.saveMallOrderRevicerInformation(revicer);
		//更新收货人信息ID
//		MallAfterSalesService serviceUpdate=new MallAfterSalesService();
//		serviceUpdate.setExpressId(revicer.getId());
//		serviceUpdate.setId(service.getId());
//		afterSaleServiceDao.updateByPrimaryKeySelective(serviceUpdate);
		afterSaleService.updateAfterSalesService(null, revicer.getId(), service.getId());
//		MallOrder orderUpdateStatus=new MallOrder();
//		orderUpdateStatus.setStatus(OrderStatus.AFTERSALE.getStatus());
//		orderUpdateStatus.setId(order.getId());
		orderService.updateOrderStatus(OrderStatus.AFTERSALE.getStatus(), service.getOrderNumber());
		//添加订单历史记录
//		MallOrderHistory history=new MallOrderHistory();
//		history.setOrderNumber(service.getOrderNumber());
//		history.setOperatorType((byte)1);
//		history.setUserId(user.getId());
//		history.setOperatorIp(ip);
//		history.setCreateDateTime(new Date());
//		history.setUpdateTime(new Date());
//		history.setStatus(OrderStatusEnum.AFTERSALE.getCode());
//		orderHistoryDao.insert(history);
		orderService.addOrderHistory(service.getOrderNumber(), user.getId(), ip, OrderStatus.AFTERSALE.getStatus(),OrderOperateTye.USER.getOperateType());
		return 1l;
	}
}
