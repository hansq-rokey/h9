package com.ibaixiong.mall.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibaixiong.entity.MallAddress;
import com.ibaixiong.entity.MallCustomPic;
import com.ibaixiong.entity.StaffRegion;
import com.ibaixiong.entity.User;
import com.ibaixiong.mall.activemq.MallOrderProducer;
import com.ibaixiong.mall.dao.MallCustomPicDao;
import com.ibaixiong.mall.exception.CreateOrderFailedException;
import com.ibaixiong.mall.exception.NotFindOrderException;
import com.ibaixiong.mall.model.MallOrderModel;
import com.ibaixiong.mall.model.OrderSubmitInfo;
import com.ibaixiong.mall.service.ErpPurchaseMaterialServce;
import com.ibaixiong.mall.service.MallCustomPicService;
import com.ibaixiong.mall.service.MallOrderService;
import com.ibaixiong.mall.service.StaffRegionService;
import com.papabear.commons.entity.Pager;
import com.papabear.order.api.CarItemService;
import com.papabear.order.api.DepositService;
import com.papabear.order.api.OrderService;
import com.papabear.order.entity.MallCarItem;
import com.papabear.order.entity.MallFrontMoney;
import com.papabear.order.entity.MallOrder;
import com.papabear.order.entity.MallOrderItem;
import com.papabear.order.entity.MallOrderRevicerInformation;
import com.papabear.order.entity.enums.DepositEnum;
import com.papabear.order.entity.enums.SourceEnum;
import com.papabear.order.model.OrderParamters;
import com.papabear.pay.api.PayService;
import com.papabear.product.api.CategoryQueryService;
import com.papabear.product.api.ProductQueryService;
import com.papabear.product.entity.MallBasicCategoryModelFormat;
import com.papabear.product.entity.MallFormatExt;
import com.papabear.product.entity.MallProductPic;

/**
 * Created by Administrator on 2015/8/5.
 */
@Service
class MallOrderServiceImpl extends AbstractServiceImpl implements MallOrderService {
	// @Resource
	// private MallOrderItemDao mallOrderItemDao;
	@Resource
	private MallCustomPicDao mallCustomPicDao;
	@Resource
	private MallOrderProducer mallOrderProducer;
//	@Resource
//	private SsssInvitationCodeDao ssssInvitationCodeDao;
//	@Resource
//	private SsssOrderDao ssssOrderDao;
//	@Resource
//	private SsssCityMerchantDao ssssCityMerchantDao;
//	@Resource
//	private SsssMerchantFormatPriceDao ssssMerchantFormatPriceDao;
//	@Resource
//	private SsssInfoDao ssssInfoDao;
	@Resource
	private CarItemService carItemService;
	@Resource
	private OrderService orderService;
	@Resource
	private ErpPurchaseMaterialServce erpPurchaseMaterialServce;

	@Resource
	private PayService payService;

	@Resource
	private ProductQueryService productQueryService;

	@Resource
	private CategoryQueryService categoryQueryService;
	@Resource
	private DepositService depositService;
	@Resource
	private MallCustomPicDao customPicDao;
	@Resource
	private StaffRegionService staffRegionService;
	@Override
	@Transactional
	public MallOrder commit(MallOrderModel orderModel,User user, Long addressId, String deliverTimeName, String deliverValue, String ip,List<MallCarItem> mallList) {
		orderModel.setSource(SourceEnum.MALL_PC.getSource());
//		MallOrder order = orderService.createCartOrder((MallOrder) orderModel, addressId, deliverTimeName, deliverValue, ip);
		//根据用户角色类型，区别下单类型
		//默认为普通C用户下单
		Byte type=1;
		//（淘宝、天猫）商城下单
		if(user.getType()==1){
			type=3;
		}
		//白熊员工下单
		if(user.getType()==2){
			type=4;
		}
		OrderParamters params = this.CreateOrderParamters(user, orderModel.getRemark(), (byte)0, 
				SourceEnum.MALL_PC.getSource(),null,null, type,(byte)0, (byte)0, 0f, (byte)0, ip,null,null,null,null, null);
		
		MallOrder order =orderService.createCartCommonOrder(params,mallList);

		MallAddress address = addressDao.getMallAddress(addressId, order.getUserId());
		if (address == null) {
			throw new CreateOrderFailedException("收货人信息不能为空！");
		}
		// 快递信息保存
		MallOrderRevicerInformation revicer = new MallOrderRevicerInformation();
		revicer.setDeliverTimeName(deliverTimeName);
		revicer.setDeliverTimeValue(deliverValue);
		revicer.setCityCode(address.getCityCode());
		revicer.setCityName(address.getCityName());
		revicer.setCreateDateTime(new Date());
		revicer.setDetailAddress(address.getDetailAddress());
		revicer.setDistrictCode(address.getDistrictCode());
		revicer.setDistrictName(address.getDistrictName());

		revicer.setMobilePhone(address.getMobilePhone());
		revicer.setOrderId(order.getId());
		revicer.setOrderNumber(order.getOrderNumber());
		revicer.setProvinceCode(address.getProvinceCode());
		revicer.setProvinceName(address.getProvinceName());
		revicer.setReveiveUserName(address.getUserName());
		revicer.setTelPhone(address.getTelPhone());
		revicer.setUserId(order.getUserId());
		revicer.setZipcode(address.getZipcode());

		Long expressId = orderService.saveMallOrderRevicerInformation(revicer);
		orderService.updateOrderExpressId(expressId, order.getOrderNumber());
		//发一条订单消息给服务器
		mallOrderProducer.send("queue.order", order.getOrderNumber());
//		User user = (User) SecurityUtils.getSubject().getPrincipal();
//		this.saveSsssOrder(order, user, order.getOrderNumber(), orderModel.getCarItems());
		return order;
	}

	public OrderParamters CreateOrderParamters(User user, String remark,
			Byte isUseInvitecode, Byte source,Float totalNum,Float totalPrice,
			Byte type,Byte isMakeBill,Byte isInstall, Float frontMoney, Byte isUseFrontMoney,
			String ip, String orderItemIds,Float length,Float width,
			Float height,Float groundArea){
		OrderParamters paramters = new OrderParamters();
		paramters.setBxNum(user.getBxNum());
		paramters.setUserId(user.getId());
		paramters.setUserName(user.getUserName());
		paramters.setFrontMoney(frontMoney);
		paramters.setIp(ip);
		paramters.setRemark(remark);
		paramters.setSource(source);
		paramters.setTotalNum(totalNum);
		paramters.setTotalPrice(totalPrice);
		paramters.setType(type);
//		//发热墙布
		paramters.setLength(length);
		paramters.setWidth(width);
		paramters.setHeight(height);
		paramters.setGroundArea(groundArea);
		paramters.setFixateProfit(0f);
		
		paramters.setIsInstall((byte)0);
		paramters.setIsMakeBill((byte)0);
		paramters.setIsUseFrontMoney((byte)0);
		paramters.setIsUseInvitecode((byte)0);
		return paramters;
	}
	
	@Override
	public MallOrder queryOrderByOrderNumber(User user, String orderNumber) {

		MallOrder order = orderService.getOrderByOrderNumber(user.getId(), orderNumber);
		if (order == null) {
			throw new NotFindOrderException("没有找到订单信息");
		}
		return order;
	}

	
	/* (non-Javadoc)
	 * 活动下单
	 */
	@Override
	@Transactional
	public MallOrder createSingleOrderSource(
			User user,MallBasicCategoryModelFormat format,
			String remark,Float num,String ip,Byte dictTypeValue,
			String address,Long countyId,String name,String phone,
			Float totalPrice,Float length,Float width,Float height,Float groundArea,Float fixateProfit) {
		MallOrder order = null;
		Byte type=1;//普通用户
		if(format.getIsExtProperties()!=null&&format.getIsExtProperties().intValue()==1){
			//创建特殊商品订单
			OrderParamters paramters=this.CreateOrderParamters(user, format, 0f, ip, remark, dictTypeValue, 
					null, num, totalPrice, type, length, width, height, groundArea, fixateProfit);
			order=orderService.createMerchantSingleSpecialOrder(paramters);
			//发一条订单消息给服务器
//			mallOrderProducer.send("queue.bom", order.getOrderNumber());
		}else{
			//创建普通订单
			OrderParamters paramters=this.CreateOrderParamters(user, format, 0f, ip, remark, dictTypeValue, 
					null, num, totalPrice, type, null, null, null, 0f, fixateProfit);
			order=orderService.createMerchantSingleCommonOrderC(paramters);
		}

		MallOrderRevicerInformation revicerInformation = new MallOrderRevicerInformation();
		revicerInformation.setDistrictCode(countyId+"");
		StaffRegion countyRegion = staffRegionService.selectByPrimaryKey(countyId);
		revicerInformation.setDistrictName(countyRegion.getName());
		StaffRegion cityRegion = staffRegionService.selectByPrimaryKey(countyRegion.getParent());
		revicerInformation.setCityCode(cityRegion.getId()+"");
		revicerInformation.setCityName(cityRegion.getName());
		StaffRegion provinceRegion = staffRegionService.selectByPrimaryKey(cityRegion.getParent());
		revicerInformation.setProvinceCode(provinceRegion.getId()+"");
		revicerInformation.setProvinceName(provinceRegion.getName());
		revicerInformation.setDetailAddress(address);
		revicerInformation.setCreateDateTime(new Date());
		revicerInformation.setUpdateTime(new Date());
		revicerInformation.setOrderNumber(order.getOrderNumber());
		revicerInformation.setOrderId(order.getId());
		revicerInformation.setReveiveUserName(name);
		revicerInformation.setMobilePhone(phone);
		revicerInformation.setUserId(user.getId());
		
		Long expressId = orderService.saveMallOrderRevicerInformation(revicerInformation);
		orderService.updateOrderExpressId(expressId, order.getOrderNumber());
		//发一条订单消息给服务器
		mallOrderProducer.send("queue.sourceOrder", order.getOrderNumber());
		return order;
	}
	
	
	@Override
	@Transactional
	public MallOrder createSingleOrder(User user,MallBasicCategoryModelFormat format,OrderSubmitInfo info,String ip,List<MallFormatExt> extList,Float totalPrice,String depositIds,Float length,Float width,Float height,Float groundArea,Float fixateProfit) {
		MallOrder order = null;
		//根据用户角色类型，区别下单类型
		//默认为普通C用户下单
		Byte type=1;
		//（淘宝、天猫）商城下单
		if(user.getType()==1){
			type=3;
		}
		//白熊员工下单
		if(user.getType()==2){
			type=4;
		}
		if(format.getIsExtProperties()!=null&&format.getIsExtProperties().intValue()==1){
			//创建特殊商品订单
			OrderParamters paramters=this.CreateOrderParamters(user, format, 0f, ip, info.getRemark(), SourceEnum.MALL_PC.getSource(), 
					info.getTag(), info.getNum(), totalPrice, type, length, width, height, groundArea, fixateProfit);
			order=orderService.createSingleSpecialOrder(paramters);
			//发一条订单消息给服务器
			mallOrderProducer.send("queue.bom", order.getOrderNumber());
//			order=orderService.createSingleSpecialOrder(user.getId(), user.getUserName(), user.getBxNum(), info.getRemark(), info.getNum(), format,
//					totalPrice,(byte)0, SourceEnum.MALL_PC.getSource(), (byte)0, (byte)0,  0f, (byte)0, ip,info.getTag(), extList);
		}else{
			//创建普通订单
			OrderParamters paramters=this.CreateOrderParamters(user, format, 0f, ip, info.getRemark(), SourceEnum.MALL_PC.getSource(), 
					info.getTag(), info.getNum(), totalPrice, type, null, null, null, 0f, fixateProfit);
			order=orderService.createMerchantSingleCommonOrderC(paramters);
//			order=orderService.createSingleCommonOrder(user.getId(), user.getUserName(), user.getBxNum(), info.getRemark(), info.getNum(), format,
//					(byte)0, SourceEnum.MALL_PC.getSource(), (byte)0, (byte)0,  0f, (byte)0, ip);
		}


		MallAddress address = addressDao.getMallAddress(info.getAddressId(), user.getId());
		if (address == null) {
			throw new CreateOrderFailedException("收货人信息不能为空！");
		}
		// 快递信息保存
		MallOrderRevicerInformation revicer = new MallOrderRevicerInformation();
		revicer.setDeliverTimeName(info.getDeliverTimeName());
		revicer.setDeliverTimeValue(info.getDeliverValue());
		revicer.setCityCode(address.getCityCode());
		revicer.setCityName(address.getCityName());
		revicer.setCreateDateTime(new Date());
		revicer.setDetailAddress(address.getDetailAddress());
		revicer.setDistrictCode(address.getDistrictCode());
		revicer.setDistrictName(address.getDistrictName());
		revicer.setMobilePhone(address.getMobilePhone());
		revicer.setOrderId(order.getId());
		revicer.setOrderNumber(order.getOrderNumber());
		revicer.setProvinceCode(address.getProvinceCode());
		revicer.setProvinceName(address.getProvinceName());
		revicer.setReveiveUserName(address.getUserName());
		revicer.setTelPhone(address.getTelPhone());
		revicer.setUserId(user.getId());
		revicer.setZipcode(address.getZipcode());

		Long expressId = orderService.saveMallOrderRevicerInformation(revicer);
		orderService.updateOrderExpressId(expressId, order.getOrderNumber());

		String orderNumber = order.getOrderNumber();
		// -------------------------私人定制功能------------------------------
		if (info.getPicId() != null && info.getPicId().longValue() > 0 && info.getIsCustomMade().intValue() == 1) {
			MallCustomPic mallCustomPic = mallCustomPicDao.selectByPrimaryKey(info.getPicId());
			if (mallCustomPic != null && mallCustomPic.getUserId().longValue() == user.getId().longValue()) {
				mallCustomPic.setOrderNumber(orderNumber);
				mallCustomPic.setUpdateTime(new Date());
				mallCustomPicDao.updateByPrimaryKey(mallCustomPic);
				MallCustomPic cutPic = mallCustomPicDao.getmalCustomPic(user.getId(), mallCustomPic.getPicName() + "-1");
				if (cutPic != null) {
					cutPic.setOrderNumber(orderNumber);
					cutPic.setUpdateTime(new Date());
					mallCustomPicDao.updateByPrimaryKey(cutPic);
				}
			}
		}
		
		//定金支付业务
		
		if(StringUtils.isNotBlank(depositIds)&&depositIds.length()>0){
			depositService.useDeposites(order.getOrderNumber(), user.getId(), depositIds);			
		}
		
		//发一条订单消息给服务器
		mallOrderProducer.send("queue.order", order.getOrderNumber());
		return order;
	}

	/**
	 * 创建订单参数
	 * @param user			用户对象
	 * @param format		规格对象
	 * @param frontMoney	定金金额
	 * @param ip			ip地址
	 * @param remark		订单备注
	 * @param source		来源
	 * @param tagCode		发热墙布房间标识
	 * @param totalNum		购买总数量
	 * @param totalPrice	订单总价
	 * @param type			类型，1、个人订单  2：经销商订单
	 * @param length		发热墙布长
	 * @param width			发热墙布宽
	 * @param height		发热墙布高
	 * @param groundArea	地面面积
	 * @param fixateProfit	经销商进货价系数
	 * @return
	 */
private OrderParamters CreateOrderParamters(User user,MallBasicCategoryModelFormat format,Float frontMoney,String ip,
		String remark,Byte source,Integer tagCode,Float totalNum,Float totalPrice,Byte type,Float length,Float width,
		Float height,Float groundArea,Float fixateProfit){
	OrderParamters paramters=new OrderParamters();
	paramters.setBxNum(user.getBxNum());
	paramters.setUserId(user.getId());
	paramters.setUserName(user.getUserName());
	paramters.setFormat(format);
	paramters.setFrontMoney(frontMoney);
	paramters.setIp(ip);
	paramters.setRemark(remark);
	paramters.setSource(source);
	paramters.setTagCode(tagCode);
	paramters.setTotalNum(totalNum);
	paramters.setTotalPrice(totalPrice);
	paramters.setType(type);
	//发热墙布
	paramters.setLength(length);
	paramters.setWidth(width);
	paramters.setHeight(height);
	paramters.setGroundArea(groundArea);
	paramters.setFixateProfit(fixateProfit);
	
	paramters.setIsInstall((byte)0);
	paramters.setIsMakeBill((byte)0);
	paramters.setIsUseFrontMoney((byte)0);
	paramters.setIsUseInvitecode((byte)0);
	return paramters;
}
	/*
	 * 单个商品购买，将前台数据转化为购物车下单数据格式 便于邀请码计算
	 */
//	private List<MallCarItemExt> convertInvite(MallOrder order, OrderSubmitInfo info) {
//		if (info == null || info.getInviteCodeId() == null || info.getInviteCodeId().longValue() == 0) {
//			return null;
//		}
//		List<MallCarItemExt> list = new ArrayList<MallCarItemExt>();
//		MallCarItemExt carItem = new MallCarItemExt();
//		carItem.setProductModelFormatId(info.getFormatId());
//		carItem.setInviteCodeId(info.getInviteCodeId());
//		list.add(carItem);
//		// order.setCarItems(list); TODO
//		return list;
//	}

	/**
	 * 保存4S店订单
	 * 
	 * @param order
	 * @param user
	 * @param orderNumber
	 */
//	private void saveSsssOrder(MallOrder order, User user, String orderNumber, List<MallCarItemExt> carItemExtList) {
//
//		Subject subject = SecurityUtils.getSubject();
//		// List<MallCarItem> carItems =null;// order.getCarItems();TODO
//		// 既不是4s店，也不是用户使用邀请码，不执行以下代码
//		if (!subject.hasRole("4s") && (carItemExtList == null || carItemExtList.size() == 0)) {
//			return;
//		}
//
//		float inviteCodeTotalMoney = 0;
//		List<MallOrderItem> orderItemList = orderService.queryOrderItems(user.getId(), orderNumber); // mallOrderItemDao.queryMallOrderItemsByOrderNumber(user.getId(),
//																										// orderNumber);
//		Map<Long, Float> ssssProfitMap = new HashMap<Long, Float>();
//		Map<Long, Float> merchantProfitMap = new HashMap<Long, Float>();
//		Map<Long, Long> inviteCodeMap = new HashMap<Long, Long>();
//		for (MallCarItemExt carItem : carItemExtList) {
//			inviteCodeMap.put(carItem.getProductModelFormatId(), carItem.getInviteCodeId());
//		}
//
//		for (MallOrderItem orderItem : orderItemList) {
//			if (subject.hasRole("4s")) {// 4S角色
//				SsssInfo ssssInfo = ssssInfoDao.getByUserId(user.getId());
//				if (ssssInfo == null || ssssInfo.getInvalid()) {// 判断4S店是否为空或有效
//					continue;
//				}
//				// 更新订单详细信息
//				orderItem.setIsUseInvitecode((byte) 1);
//				orderService.updateOrderItem(orderItem);
//				// mallOrderItemDao.updateByPrimaryKeySelective(orderItem);
//				// 计算各层级利润
//				this.calculateProfit(ssssProfitMap, merchantProfitMap, ssssInfo, orderItem, 0);
//			} else {// 邀请码订单
//				Long inviteCodeId = inviteCodeMap.get(orderItem.getProductModelFormatId());
//				if (inviteCodeId == null || inviteCodeId.longValue() == 0)
//					continue;
//
//				SsssInvitationCode inviteCode = ssssInvitationCodeDao.getInviteCodeByMobileAndProductId(orderItem.getProductId(),
//						Constant.InvitationCodeStatus.PAY.getStatus(), inviteCodeId, user.getPhone());
//				if (inviteCode == null)
//					continue;
//
//				SsssInfo ssssInfo = ssssInfoDao.selectByPrimaryKey(inviteCode.getSsssId());
//				if (ssssInfo == null || ssssInfo.getInvalid()) {// 判断4S店是否为空或有效
//					continue;
//				}
//				// 更新邀请码信息
//				inviteCode.setStatus(Constant.InvitationCodeStatus.USEING.getStatus());
//				inviteCode.setOrderNumber(orderNumber);
//				inviteCode.setOrderItemId(orderItem.getId());
//				inviteCode.setUpdateTime(new Date());
//				inviteCode.setUseTime(new Date());
//				ssssInvitationCodeDao.updateByPrimaryKeySelective(inviteCode);
//				// 更新订单详细信息
//				orderItem.setIsUseInvitecode((byte) 1);
//				orderService.updateOrderItem(orderItem);
//				// mallOrderItemDao.updateByPrimaryKeySelective(orderItem);
//
//				// 计算邀请码累计金额
//				inviteCodeTotalMoney += inviteCode.getMoney().floatValue();
//				// 计算各层级利润
//				this.calculateProfit(ssssProfitMap, merchantProfitMap, ssssInfo, orderItem, inviteCode.getMoney().floatValue());
//
//			}
//		}
//		if (subject.hasRole("4s")) {// 4S角色
//			createSsssOrder(ssssProfitMap, (byte) 1, orderNumber, (byte) 1);
//			createSsssOrder(merchantProfitMap, (byte) 3, orderNumber, (byte) 2);
//		} else {
//			createSsssOrder(ssssProfitMap, (byte) 2, orderNumber, (byte) 1);
//			createSsssOrder(merchantProfitMap, (byte) 3, orderNumber, (byte) 2);
//			// 更新订单价格和订单是否使用邀请码
//			if (inviteCodeTotalMoney > 0) {
//				order = orderService.getOrderByOrderNumber(user.getId(), orderNumber);// orderDao.getOrderByOrderNumber(orderNumber);
//				order.setIsUseInvitecode((byte) 1);
//				order.setUpdateTime(new Date());
//				float discountPrice = order.getDiscountPrice() - inviteCodeTotalMoney;
//				order.setDiscountPrice(discountPrice > 0 ? discountPrice : 0);
//				orderService.updateOrder(order);
//				// 更新订单支付信息
//				payService.updateOrderPayRealByOrderNumber(discountPrice > 0 ? discountPrice : 0, orderNumber);
//			}
//		}
//	}

	/**
	 * 计算4s店和代理商的利润
	 * 
	 * @param ssssProfitMap
	 *            4s店利润保存
	 * @param merchantProfitMap
	 *            代理商利润保存
	 * @param ssssInfo
	 *            4s店对象
	 * @param orderItem
	 *            订单详细对象
	 * @param inviteMoney
	 *            邀请码的价格，没有的话是0
	 */
//	public void calculateProfit(Map<Long, Float> ssssProfitMap, Map<Long, Float> merchantProfitMap, SsssInfo ssssInfo, MallOrderItem orderItem,
//			float inviteMoney) {
//		// 得到4S店ID，计算4S店利润
//		SsssMerchantFormatPrice ssssPrice = ssssMerchantFormatPriceDao.getSsssFormatPriceByFormatIdAndssssId(orderItem.getProductModelFormatId(),
//				ssssInfo.getId());
//		Float ssssprofit = orderItem.getDiscountUnitPrice() - ssssPrice.getPrice() - inviteMoney;
//		if (ssssProfitMap.get(ssssInfo.getId()) == null) {
//			ssssProfitMap.put(ssssInfo.getId(), ssssprofit);
//		} else {
//			Float oldSsssPfofit = ssssProfitMap.get(ssssInfo.getId());
//			ssssProfitMap.put(ssssInfo.getId(), ssssprofit + oldSsssPfofit);
//		}
//
//		// 计算市级代理商利润
//		SsssCityMerchant cityMerchant = ssssCityMerchantDao.selectByPrimaryKey(ssssInfo.getCityMerchantId());
//		if (cityMerchant == null || cityMerchant.getId() == 0) {
//			return;
//		}
//		SsssMerchantFormatPrice cityPrice = ssssMerchantFormatPriceDao.getSsssMerchantFormatPriceByFormatIdAndMerchantId(orderItem.getProductModelFormatId(),
//				cityMerchant.getId());
//		Float cityProfit = ssssPrice.getPrice() - cityPrice.getPrice();
//		if (merchantProfitMap.get(cityMerchant.getId()) == null) {
//			merchantProfitMap.put(cityMerchant.getId(), cityProfit);
//		} else {
//			Float oldCityPfofit = merchantProfitMap.get(cityMerchant.getId());
//			merchantProfitMap.put(cityMerchant.getId(), cityProfit + oldCityPfofit);
//		}
//
//		// 计算省级代理商利润
//		SsssCityMerchant provinceMerchant = ssssCityMerchantDao.selectByPrimaryKey(cityMerchant.getParentCityMerchantId());
//		if (provinceMerchant == null || provinceMerchant.getId() == 0) {
//			return;
//		}
//		SsssMerchantFormatPrice provincePrice = ssssMerchantFormatPriceDao.getSsssMerchantFormatPriceByFormatIdAndMerchantId(
//				orderItem.getProductModelFormatId(), provinceMerchant.getId());
//		Float provinceProfit = cityPrice.getPrice() - provincePrice.getPrice();
//
//		if (merchantProfitMap.get(provinceMerchant.getId()) == null) {
//			merchantProfitMap.put(provinceMerchant.getId(), provinceProfit);
//		} else {
//			Float oldProvincePfofit = merchantProfitMap.get(provinceMerchant.getId());
//			merchantProfitMap.put(provinceMerchant.getId(), provinceProfit + oldProvincePfofit);
//		}
//	}

	/**
	 * 
	 * @param ssssId
	 * @param merchantId
	 * @param orderType
	 *            1：店铺订单 2：邀请码订单 3：下级4S店订单
	 * @param profit
	 * @param orderNumber
	 * @param type
	 *            1:4S店 2：代理商
	 */
//	private void createSsssOrder(Map<Long, Float> ssssProfit, byte orderType, String orderNumber, byte type) {
//		Iterator<Entry<Long, Float>> iter = ssssProfit.entrySet().iterator();
//		while (iter.hasNext()) {
//			Entry<Long, Float> entry = iter.next();
//			Long id = entry.getKey();
//			Float profit = entry.getValue();
//			SsssOrder ssssOrder = new SsssOrder();
//			ssssOrder.setCreateDateTime(new Date());
//			ssssOrder.setStatus(Constant.Status.WAIT.getStatus());
//			ssssOrder.setInvalid(InvalidEnum.FALSE.getInvalidValue());
//			ssssOrder.setOrderNumber(orderNumber);
//			ssssOrder.setOrderType(orderType);
//			ssssOrder.setProfit(profit);
//			if (type == 1) {
//				ssssOrder.setSsssId(id);
//			} else {
//				ssssOrder.setMerchantId(id);
//			}
//			ssssOrder.setStatus((byte) 0);
//			ssssOrderDao.insert(ssssOrder);
//		}
//
//	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.ibaixiong.mall.service.MallOrderService#queryOrderByStatusArr(java
	 * .lang.Long, java.lang.Byte[], int)
	 */
	@Override
	public Pager<MallOrder> queryOrderByStatusArr(Long userId, Byte[] statusArray, int pageNo) {

		return this.queryOrderByStatusArr(userId, statusArray, pageNo, 10);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.ibaixiong.mall.service.MallOrderService#queryOrderByStatusArr(java
	 * .lang.Long, java.lang.Byte[], int, int)
	 */
	@Override
	public Pager<MallOrder> queryOrderByStatusArr(Long userId, Byte[] statusArray, int pageNo, int pageSize) {
		Pager<MallOrder> pager = orderService.queryOrdersByUserIdAndStatusArr(userId, statusArray, pageNo, pageSize);
//		List<MallOrderExt> orderExtList = new ArrayList<MallOrderExt>();
		for (MallOrder order : pager.getList()) {
//			MallOrderExt orderExt = new MallOrderExt();
//			orderExt.setOrder(order);
			order.setInformation(orderService.getRevicerByUserIdAndOrderNumber(userId, order.getOrderNumber()));
			List<MallOrderItem> orderItems = orderService.queryOrderItems(userId, order.getOrderNumber());
//			List<MallOrderItemExt> orderItemExtList = new ArrayList<MallOrderItemExt>();

			for (MallOrderItem orderItem : orderItems) {
//				MallOrderItemExt orderItemExt = new MallOrderItemExt();
//				orderItem.setOrderItem(orderItem);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("productId", orderItem.getProductId());
				map.put("formatId", orderItem.getProductModelFormatId());
				orderItem.setPics(productQueryService.queryProductPicByFormatId(map));
//				orderItemExtList.add(orderItemExt);
			}
			order.setOrderItems(orderItems);
//			orderExtList.add(orderExt);
		}

//		Pager<MallOrder> page = new Pager<MallOrderExt>(pager.getTotal(), pageNo, pageSize);
//		page.setList(orderExtList);
		return pager;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.ibaixiong.mall.service.MallOrderService#queryOrderByStatus(java.lang
	 * .Long, java.lang.Byte, int)
	 */
	@Override
	public Pager<MallOrder> queryOrderByStatus(Long userId, Byte status, int pageNo) {

		return this.queryOrderByStatus(userId, status, pageNo, 10);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.ibaixiong.mall.service.MallOrderService#queryOrderByStatus(java.lang
	 * .Long, java.lang.Byte, int, int)
	 */
	@Override
	public Pager<MallOrder> queryOrderByStatus(Long userId, Byte status, int pageNo, int pageSize) {
		Pager<MallOrder> pager = orderService.queryOrdersByUserIdAndStatus(userId, status, pageNo, pageSize);
//		List<MallOrderExt> orderExtList = new ArrayList<MallOrderExt>();
		for (MallOrder order : pager.getList()) {
//			MallOrderExt orderExt = new MallOrderExt();
//			orderExt.setOrder(order);
			order.setInformation(orderService.getRevicerByUserIdAndOrderNumber(userId, order.getOrderNumber()));
			List<MallOrderItem> orderItems = orderService.queryOrderItems(userId, order.getOrderNumber());
//			List<MallOrderItemExt> orderItemExtList = new ArrayList<MallOrderItemExt>();

			for (MallOrderItem orderItem : orderItems) {
//				MallOrderItemExt orderItemExt = new MallOrderItemExt();
//				orderItemExt.setOrderItem(orderItem);
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("productId", orderItem.getProductId());
				map.put("formatId", orderItem.getProductModelFormatId());
				if(order.getIsCustomMade()!=null && order.getIsCustomMade().intValue()==1){
					List<MallCustomPic> customPics = customPicDao.queryByOrderNumber(order.getOrderNumber());
					List<MallProductPic> list = new ArrayList<MallProductPic>();
					for(MallCustomPic customPic : customPics){
						MallProductPic pic = new MallProductPic();
						pic.setUrl(customPic.getUrl());
						list.add(pic);
					}
					customPics=null;
					orderItem.setPics(list);
				}else{
					orderItem.setPics(productQueryService.queryProductPicByFormatId(map));
//					orderItemExtList.add(orderItemExt);
				}
			}
			order.setOrderItems(orderItems);
//			orderExtList.add(orderExt);
		}

//		Pager<MallOrderExt> page = new Pager<MallOrderExt>(pager.getTotal(), pageNo, pageSize);
//		page.setList(orderExtList);
		return pager;
	}

	public int updateOrderStatus(Byte status, String orderNumber){
		return orderService.updateOrderStatus(status, orderNumber);
	}
}
