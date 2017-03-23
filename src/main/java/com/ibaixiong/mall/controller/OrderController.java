package com.ibaixiong.mall.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.ibaixiong.core.utils.IpUtil;
import com.ibaixiong.core.utils.ResponseResult;
import com.ibaixiong.entity.ErpBom;
import com.ibaixiong.entity.MallAddress;
import com.ibaixiong.entity.MallCustomPic;
import com.ibaixiong.entity.MallOrderLogistics;
import com.ibaixiong.entity.User;
import com.ibaixiong.entity.util.OrderStatusEnum;
import com.ibaixiong.logistics.LogisticsUtils;
import com.ibaixiong.mall.core.Token;
import com.ibaixiong.mall.exception.LowStocksException;
import com.ibaixiong.mall.exception.NotFindFormatProductException;
import com.ibaixiong.mall.exception.NotFindProductException;
import com.ibaixiong.mall.model.DictCode;
import com.ibaixiong.mall.model.DictTypeEnum;
import com.ibaixiong.mall.model.MallCarItemExt;
import com.ibaixiong.mall.model.MallOrderModel;
import com.ibaixiong.mall.model.OrderSubmitInfo;
import com.ibaixiong.mall.model.PicTypeEnum;
import com.ibaixiong.mall.model.SendGoodsValueEnum;
import com.ibaixiong.mall.service.ErpBomService;
import com.ibaixiong.mall.service.ErpPurchaseMaterialServce;
import com.ibaixiong.mall.service.MallCarItemService;
import com.ibaixiong.mall.service.MallOrderHistoryService;
import com.ibaixiong.mall.service.MallOrderLogisticsService;
import com.ibaixiong.mall.util.Response;
import com.papabear.commons.entity.Pager;
import com.papabear.order.api.CarItemService;
import com.papabear.order.api.DepositService;
import com.papabear.order.entity.MallCarItem;
import com.papabear.order.entity.MallCarItemExtend;
import com.papabear.order.entity.MallOrder;
import com.papabear.order.entity.MallOrderHistory;
import com.papabear.order.entity.OrderConstant.OrderStatus;
import com.papabear.order.entity.enums.HouseTagEnum;
import com.papabear.product.entity.MallBasicCategoryModelFormat;
import com.papabear.product.entity.MallFormatExt;
import com.papabear.product.entity.MallProduct;
import com.papabear.product.entity.MallProductPic;

/**
 * Created by Administrator on 2015/8/3.
 */
@Controller
@RequestMapping("/u/order")
class OrderController extends AbstractController {

	@Resource
	private MallOrderLogisticsService orderLogisticsService;
	@Resource
	private MallOrderHistoryService orderHistoryService;
//	@Resource
//	private SsssInvitationCodeService invitationCodeService;
	@Resource
	private CarItemService carItemService;
	@Resource
	private ErpPurchaseMaterialServce erpPurchaseMaterialServce;
	@Resource
	private DepositService depositService;
	@Resource
	private MallCarItemService mallCarItemService;
	@Resource
	private ErpBomService erpBomService;
	
	/* 确认下订单，也就是结算购物车 */
	/**
	 * 结算购物车
	 * 
	 * @param user
	 * @param carItemIdList
	 * @param carItemNumList
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/confirm")
	@Token(save = true)
	String confirm(@ModelAttribute("user") User user, @RequestParam(value = "carItemIdList") String carItemIdList,
			@RequestParam(value = "carItemNumList") String carItemNumList, ModelMap modelMap,HttpServletRequest request) {
		float totalMoney = 0, favourablePrice = 0;
		// List<Long> idList = new ArrayList<Long>();
		List<MallCarItem> carItemList = carItemService.confirm(user.getId(), carItemIdList, carItemNumList);
		List<Map<String, Object>> carItemListExt = new ArrayList<Map<String, Object>>();
		for (MallCarItem car : carItemList) {
			Map<String, Object> result = new HashMap<String, Object>();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("productId", car.getProductId());
			map.put("formatId", car.getProductModelFormatId());
			List<MallProductPic> pics = productQueryService.queryProductPicByFormatId(map);			
//			if(car.getType().intValue()==2){
//				List<com.papabear.order.entity.MallCarItemExt> extList= carItemService.queryCarItemExts(user.getId(), car.getId());
//				result.put("carItemExtList", extList);
//			}
//			// 计算总价及优惠价
//			totalMoney += car.getTotalPrice();
//			favourablePrice += car.getTotalPrice();
			float price = 0f;
			MallBasicCategoryModelFormat format = categoryQueryService.getCategoryModelFormat(car.getProductModelFormatId());
			if(format.getIsExtProperties()!=null && format.getIsExtProperties().intValue()==1){
				MallCarItemExtend extend = carItemService.getCarItemExtend(user.getId(), car.getId());
				float groundArea = extend.getLength()*extend.getWidth();
				price = erpPurchaseMaterialServce.calculatePrice(car.getProductModelFormatId(), car.getNum(), groundArea);
			}else{
				price = format.getPrice()*car.getNum();
			}
			car.setTotalPrice(price);
			totalMoney+=price;
			favourablePrice+=price;
//			List<SsssInvitationCode> inviteCodeList = invitationCodeService.queryInviteCodeByMobileAndProductId(user.getPhone(),Arrays.asList(car.getProductId()));
//			carItemExt.setInvitationCodes(inviteCodeList);
			result.put("carItem", car);
			result.put("pics", pics);
			result.put("format", format);
			carItemListExt.add(result);
		}
		modelMap.addAttribute("depositList", depositService.queryDeposits(user.getId(), OrderStatusEnum.PAID.getCode()));
		modelMap.addAttribute("bomList", erpBomService.virtualCatList(carItemList));
		// 邀请码列表
		// if (has4sRole()) {
		// List<SsssInvitationCode> inviteCodeList =
		// invitationCodeService.queryInviteCodeByMobileAndProductId(user.getPhone(),
		// idList);
		// modelMap.addAttribute("inviteCodeList", inviteCodeList);
		// }
		List<MallAddress> addressList = addressService.getList(user);
		modelMap.addAttribute("carItemList", carItemListExt);
		modelMap.addAttribute("addressList", addressList);
		modelMap.addAttribute("totalMoney", totalMoney);
		modelMap.addAttribute("favourablePrice", favourablePrice);
		if (addressList != null && addressList.size() > 0) {
			modelMap.addAttribute("showAddress", 1);
		} else {
			modelMap.addAttribute("showAddress", 0);
		}
		return "order/committing";
	}

	/**
	 * 购物车确认下单并保存数据库
	 * 
	 * @param user
	 * @param order
	 *            里面可能就只有 id remark address 有值
	 * @return
	 */
	@RequestMapping("/commit")
	@Token(remove = true)
	String commit(@ModelAttribute("order") MallOrderModel orderModel, @RequestParam("addressId") Long addressId,
			@RequestParam("deliverValue") String deliverValue, HttpServletRequest request, ModelMap modelMap) {
		
		String depositIds=request.getParameter("depositId");
		List<MallCarItem> carList = new ArrayList<MallCarItem>();
		List<MallCarItemExt> carItemExts = mallCarItemService.getList(getUser());
		for(MallCarItemExt car : carItemExts){
			MallBasicCategoryModelFormat format = categoryQueryService.getCategoryModelFormat(car.getCarItem().getProductModelFormatId());
			//判断该规格是否是扩展属性
			Float price=0f;
			if(format.getIsExtProperties()!=null&&format.getIsExtProperties().intValue()==1){
				MallCarItemExtend extend=carItemService.getCarItemExtend(getUser().getId(), car.getCarItem().getId());
				float groundArea=extend.getLength()*extend.getWidth();
				price=erpPurchaseMaterialServce.calculatePrice(car.getCarItem().getProductModelFormatId(), car.getCarItem().getNum(), groundArea);
			}else{
				price=format.getPrice()*car.getCarItem().getNum();
			}
			car.getCarItem().setTotalPrice(price);
			carList.add(car.getCarItem());
		}
		String deliverName = SendGoodsValueEnum.getSendGoodsValueEnum(deliverValue).getMessage();
		MallOrder order = mallOrderService.commit(orderModel, getUser(),addressId, deliverName, deliverValue, IpUtil.getIpAddr(request),carList);
		if (StringUtils.isNotBlank(depositIds)&&depositIds.length()>0) {
			depositService.useDeposites(order.getOrderNumber(), getUser().getId(), depositIds);
		}
		modelMap.addAttribute("order", mallOrderService.queryOrderByOrderNumber(getUser(), order.getOrderNumber()));
		modelMap.addAttribute("orderItems", orderItemService.queryMallOrderItemsByOrderNumber(getUser().getId(), order.getOrderNumber()));
		modelMap.addAttribute("reciver", orderRevicerInformationService.getOrderRevicerInformation(getUser(), order.getOrderNumber()));
		return "order/paying";
	}

	/**
	 * 重新支付
	 * 
	 * @param user
	 * @param modelMap
	 * @param number
	 *            订单号
	 * @return
	 */
	@RequestMapping("/repeat/pay")
	String repeatPay(@RequestParam("number") String orderNumber, ModelMap modelMap) {
		modelMap.addAttribute("order", mallOrderService.queryOrderByOrderNumber(getUser(), orderNumber));
		modelMap.addAttribute("orderItems", orderItemService.queryMallOrderItemsByOrderNumber(getUser().getId(), orderNumber));
		modelMap.addAttribute("reciver", orderRevicerInformationService.getOrderRevicerInformation(getUser(), orderNumber));
		return "order/paying";
	}

	/**
	 * 选中某个产品，直接购买，跳过了购物车确认的流程
	 * 
	 * @param user
	 * @param order
	 *            id 属性为空, orderItemSet 有一个元素，且该元素未被持久化
	 * @return
	 */
	@Token(save = true)
	@RequestMapping("/buy")
	String buy(@ModelAttribute("user") User user, @RequestParam("format") String flag, @RequestParam("num") Integer num,// 购买数量
			@RequestParam("picId") Long picId,// 私人订制时上传返回的图片ID
			@RequestParam("mallCustomPicId") Long mallCustomPicId,// 私人订制时上传返回的剪切图片ID
			@RequestParam("isCustomMade") Integer isCustomMade,// 是否私人订制
			@RequestParam("productId") Long productId,// 是否私人订制
			@RequestParam(value="tag",required=false) Integer tagCode,// 发热墙纸 用到
			ModelMap modelMap, HttpServletRequest request) {
		MallProduct product = productQueryService.detail(productId);
		if (product == null)
			throw new NotFindProductException("没有找到该商品！");
		MallBasicCategoryModelFormat format = categoryQueryService.queryFormatByCombine(flag.replace(",", "-"));
		if (format == null || format.getId().intValue() == 0 || format.getcDisplay()!=1) {
			throw new NotFindFormatProductException("没有找到该型号");// TODO
		}
		if (format.getStock() < num.intValue()) {
			throw new LowStocksException("库存不足！");
		}
		List<MallAddress> addressList = addressService.getList(user);
		if (addressList != null && addressList.size() > 0) {
			modelMap.addAttribute("showAddress", 1);
		} else {
			modelMap.addAttribute("showAddress", 0);
		}
		////////////////定金 start/////////////////
		// 定金列表
		modelMap.addAttribute("depositList", depositService.queryDeposits(user.getId(), OrderStatusEnum.PAID.getCode()));
		////////////////定金 end/////////////////
		modelMap.addAttribute("format", format);
		modelMap.addAttribute("addressList", addressList);
		modelMap.addAttribute("num", num);
		modelMap.addAttribute("product", product);
		modelMap.addAttribute("picId", picId);
		modelMap.addAttribute("isCustomMade", isCustomMade);
		modelMap.addAttribute("tag", tagCode);
		DecimalFormat df = new DecimalFormat("#.##");
		float totalMoney = Float.parseFloat(df.format(format.getPrice() * num));
		if(format.getIsExtProperties()!=null&&format.getIsExtProperties().intValue()==1){
			String length = request.getParameter("length");
			String width = request.getParameter("width");
			if(StringUtils.isBlank(length)||StringUtils.isBlank(width)){
				throw new RuntimeException("发热墙纸长、宽、高任意参数不能为空");
			}
			if(Float.valueOf(length) <= 0||Float.valueOf(width) <=0){
				throw new RuntimeException("发热墙纸长、宽、高任意参数不能为空");
			}
			totalMoney=erpPurchaseMaterialServce.calculatePrice(format.getId(), num, Float.valueOf(length)*Float.valueOf(width));
			modelMap.addAttribute("flag", 1);
			modelMap.addAttribute("tagName", HouseTagEnum.getTagName(tagCode));
			modelMap.addAttribute("bomList", erpBomService.virtualList(format.getId(), num, Float.valueOf(length)*Float.valueOf(width)));
		}

		modelMap.addAttribute("totalMoney", totalMoney);
		modelMap.addAttribute("favourablePrice", totalMoney);

		if(format.getIsCustomMade()!=null&&format.getIsCustomMade().intValue()==1){
			MallCustomPic customPic = mallCustomPicService.getmCustomPic(mallCustomPicId);
			modelMap.addAttribute("url", customPic.getUrl());
		}else{
 			// 查询图片信息
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("productId", product.getId());
			map.put("type", PicTypeEnum.FORMAT_THUMB.getCode());
			map.put("formatId", format.getId());
			List<MallProductPic> productPics = productQueryService.queryProductPicByFormatId(map);
			modelMap.addAttribute("url", productPics.size()>0?productPics.get(0).getUrl():"");
		}
		
		// 查询图片信息
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("productId", product.getId());
		map.put("type", PicTypeEnum.FORMAT_THUMB.getCode());
		map.put("formatId", format.getId());
		modelMap.addAttribute("productPics", productQueryService.queryProductPicByFormatId(map));
		// 判断是否发热墙纸
		if (format.getIsExtProperties() != null && format.getIsExtProperties().intValue() == 1) {
			List<MallFormatExt> extList = categoryQueryService.queryMallFormatExts(format.getId(), (byte) 1);
			for (MallFormatExt ext : extList) {
				String identifyValue = request.getParameter(ext.getIdentify());
				if (StringUtils.isNotBlank(identifyValue) && (Float.valueOf(identifyValue) > 0)) {
					ext.setValue(Float.valueOf(identifyValue));
				} else {
					extList.clear();
					break;
				}
			}
			modelMap.addAttribute("exts", extList);
		}

		return "order/committing_buy";
	}

	/**
	 * 选中某个产品，直接购买，跳过了购物车确认的流程
	 * 
	 * @param user
	 * @param order
	 *            里面可能就只有 id remark address 有值
	 * @return
	 */
	@RequestMapping("/submit")
	@Token(remove = true)
	String commitBuy(@ModelAttribute("info") OrderSubmitInfo info, HttpServletRequest request, ModelMap modelMap) {
		String deliverName = SendGoodsValueEnum.getSendGoodsValueEnum(info.getDeliverValue()).getMessage();
		info.setDeliverTimeName(deliverName);
		MallBasicCategoryModelFormat format = categoryQueryService.getCategoryModelFormat(info.getFormatId());
		String depositIds=request.getParameter("depositId");
		if(format==null){
			throw new NotFindFormatProductException("没有找到该产品规格");
		}
		String length = request.getParameter("length");
		String width = request.getParameter("width");
		String height = request.getParameter("height");
		float totalMoney =0f;
		List<MallFormatExt> extList=null;
		MallOrder order = new MallOrder();
		if(format.getIsExtProperties()!=null&&format.getIsExtProperties().intValue()==1){
			if(StringUtils.isBlank(length)||StringUtils.isBlank(width)){
				throw new RuntimeException("发热墙纸长、宽、高任意参数不能为空");
			}
			
			if(Float.valueOf(length) <= 0||Float.valueOf(width) <=0){
				throw new RuntimeException("发热墙纸长、宽、高任意参数不能为空");
			}
			totalMoney=erpPurchaseMaterialServce.calculatePrice(format.getId(), info.getNum(), Float.valueOf(length)*Float.valueOf(width));
			extList = categoryQueryService.queryMallFormatExts(info.getFormatId(), (byte) 1);
			for (MallFormatExt ext : extList) {
				String identifyValue = request.getParameter(ext.getIdentify());
				if (StringUtils.isNotBlank(identifyValue) && (Float.valueOf(identifyValue) > 0)) {
					ext.setValue(Float.valueOf(identifyValue));
				} else {
					extList.clear();
					break;
				}
			}
			order = mallOrderService.createSingleOrder(
					getUser(), format,info, IpUtil.getIpAddr(request),extList,totalMoney,depositIds,
					Float.valueOf(length),Float.valueOf(width),Float.valueOf(height),
					Float.parseFloat(length)*Float.parseFloat(width),null);
		}else{
			totalMoney = format.getPrice()*info.getNum();
			order = mallOrderService.createSingleOrder(
					getUser(), format,info, IpUtil.getIpAddr(request),extList,totalMoney,depositIds,
					null,null,null,null,null);
		}
		
		//MallOrder order = mallOrderService.createSingleOrder(getUser(), format,info, IpUtil.getIpAddr(request),extList,totalMoney,depositIds);
		modelMap.addAttribute("order", mallOrderService.queryOrderByOrderNumber(getUser(), order.getOrderNumber()));
		modelMap.addAttribute("orderItems", orderItemService.queryMallOrderItemsByOrderNumber(getUser().getId(), order.getOrderNumber()));
		modelMap.addAttribute("reciver", orderRevicerInformationService.getOrderRevicerInformation(getUser(), order.getOrderNumber()));
		return "order/paying";
	}

	/* 列出所有订单，按时间排倒序 */
	@RequestMapping("/list")
	String list(ModelMap modelMap, @RequestParam(value = "pageNo", defaultValue = "0") int pageNo) {
		Pager<MallOrder> pager = mallOrderService.queryOrderByStatus(getUser().getId(), null, pageNo);
		modelMap.addAttribute("orderList", pager.getList());
		modelMap.addAttribute("pager", pager);
		modelMap.addAttribute("url", "/u/order/list.html?pageNo=");
		modelMap.addAttribute("tag", 1);
		return "order/list/all";
	}

	/* 待付款的订单 */
	@RequestMapping("/list/obligation")
	String listObligation(ModelMap modelMap, @RequestParam(value = "pageNo", defaultValue = "0") int pageNo) {
		Pager<MallOrder> pager = mallOrderService.queryOrderByStatus(getUser().getId(), OrderStatus.OBLIGATION.getStatus(), pageNo);
		modelMap.addAttribute("orderList", pager.getList());
		modelMap.addAttribute("pager", pager);
		modelMap.addAttribute("url", "/u/order/list/obligation.html?pageNo=");
		modelMap.addAttribute("tag", 10);
		return "order/list/obligation";
	}

	/* 列出待收货(交易中)订单，按时间倒排 */
	@RequestMapping("/list/receiving")
	String listReceiving(ModelMap modelMap, @RequestParam(value = "pageNo", defaultValue = "0") int pageNo) {
		Byte[] bytes = new Byte[3];
		bytes[0] = OrderStatus.PAID.getStatus();
		bytes[1] = OrderStatus.PICKING.getStatus();
		bytes[2] = OrderStatus.SIPPING.getStatus();
		Pager<MallOrder> pager = mallOrderService.queryOrderByStatusArr(getUser().getId(), bytes, pageNo);
		modelMap.addAttribute("orderList", pager.getList());
		modelMap.addAttribute("pager", pager);
		modelMap.addAttribute("url", "/u/order/list/receiving.html?pageNo=");
		modelMap.addAttribute("tag", 20);
		return "order/list/receiving";
	}

	/* 列出已完成订单，按时间倒排 */
	@RequestMapping("/list/completed")
	String listCompleted(ModelMap modelMap, @RequestParam(value = "pageNo", defaultValue = "0") int pageNo) {
		Byte[] bytes = new Byte[2];
		bytes[0] = OrderStatus.COMPLETED.getStatus();
		bytes[1] = OrderStatus.AFTERSALE.getStatus();
		Pager<MallOrder> pager = mallOrderService.queryOrderByStatusArr(getUser().getId(), bytes, pageNo);
		modelMap.addAttribute("orderList", pager.getList());
		modelMap.addAttribute("pager", pager);
		modelMap.addAttribute("url", "/u/order/list/completed.html?pageNo=");
		modelMap.addAttribute("tag", 50);
		return "order/list/completed";
	}

	/* 列出已关闭订单，按时间倒排 */
	@RequestMapping("/list/closed")
	String listClosed(ModelMap modelMap, @RequestParam(value = "pageNo", defaultValue = "0") int pageNo) {
		Pager<MallOrder> pager = mallOrderService.queryOrderByStatus(getUser().getId(), OrderStatus.CLOSED.getStatus(), pageNo);
		modelMap.addAttribute("orderList", pager.getList());
		modelMap.addAttribute("pager", pager);
		modelMap.addAttribute("url", "/u/order/list/closed.html?pageNo=");
		modelMap.addAttribute("tag", 60);
		return "order/list/closed";
	}

	@ResponseBody
	@RequestMapping("/orderSure")
	String orderSure(@RequestParam("orderNumber")String orderNumber){
		Response response = new Response();
		//更新订单的状态为已完成
		mallOrderService.updateOrderStatus(OrderStatus.COMPLETED.getStatus(), orderNumber);
		//增加该订单完成状态的历史记录
		MallOrderHistory orderHistory = orderHistoryService.getmMallOrderHistory(orderNumber, OrderStatusEnum.SIPPING, getUser());
		orderHistoryService.addMallOrderHistory(
				orderHistory.getOrderNumber(), orderHistory.getUserId(), orderHistory.getOperatorIp(), OrderStatus.COMPLETED.getStatus(), orderHistory.getOperatorType());
		response.setMessage("确认收货成功！");
		return JSON.toJSONString(response);
	}
	/**
	 * 订单详细信息查看
	 * 
	 * @param modelMap
	 * @param orderNumber
	 * @return
	 */
	@RequestMapping("/detail")
	String detail(ModelMap modelMap, @RequestParam("number") String orderNumber) {
		MallOrder order = mallOrderService.queryOrderByOrderNumber(getUser(), orderNumber);
		modelMap.addAttribute("order", order);
		modelMap.addAttribute("orderItems", orderItemService.queryMallOrderItemsAndPicsByOrderNumber(getUser().getId(), orderNumber));
		modelMap.addAttribute("reciver", orderRevicerInformationService.getOrderRevicerInformation(getUser(), orderNumber));
		modelMap.addAttribute("logistics", orderLogisticsService.getMallOrderLogistics(orderNumber));
		List<DictCode> dictCodes = null;
		if (order.getIsCustomMade() != null && order.getIsCustomMade().intValue() == 1) {
			dictCodes = dictCodeService.queryDictCodeList(DictTypeEnum.ORDER_STATUS);
		} else {
			dictCodes = dictCodeService.queryDictCodeList(DictTypeEnum.ORDER_STATUS, (byte) 0);
		}
		modelMap.addAttribute("orderStatusList", dictCodes);
		List<ErpBom> boms = erpBomService.getListByOrderNumber(orderNumber);
		modelMap.addAttribute("bomList", boms);
		List<MallOrderHistory> historyList = orderHistoryService.queryHistoryByOrderNumber(orderNumber);
		for (DictCode code : dictCodes) {
			for (MallOrderHistory history : historyList) {
				if (code.getDictCodeValue().trim().equals(history.getStatus().toString())) {
					code.setFlow(true);
					code.setOrderHistory(history);
				}
			}
		}
		return "order/detail";
	}

	@InitBinder("order")
	protected void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
		binder.registerCustomEditor(Timestamp.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
		binder.setFieldDefaultPrefix("order.");
	}

	/**
	 * 检查订单是否允许支付
	 * 
	 * @author zhaolei
	 * @date 2015年9月16日
	 * @param address
	 * @param response
	 * @return
	 */
	@RequestMapping("/checkOrderPay")
	@ResponseBody
	String remove(@RequestParam("number") String orderNumber) {
		int code = 0;
		String msg = null;
		User user = getUser();
		MallOrder order = mallOrderService.queryOrderByOrderNumber(user, orderNumber);
		if (order == null) {// 为空
			code = 1;
		}
		if (order.getStatus() == OrderStatusEnum.OBLIGATION.getCode()) {// 状态为待付款
			code = 0;
		} else {
			code = 2;
		}
		return JSON.toJSONString(ResponseResult.result(code, msg));
	}

	/**
	 * 货物追踪查询
	 * 
	 * @param mailNo
	 * @param respons
	 *            http://erp.ibaixiong.com/order/trace.html?logisticsId=
	 *            O1007941445415653832
	 */
	@ResponseBody
	@RequestMapping("/trace")
	public String queryLogisticsTrace(@RequestParam("orderNumber") String orderNumber) {
//		String json = orderLogisticsService.queryLogisticsTraceByOrderNumber(orderNumber);
		//62A900000479976000 测试
		Map<String, Object> map = new HashMap<String, Object>();
		MallOrderLogistics logistics=orderLogisticsService.getMallOrderLogistics(orderNumber);
		if(logistics==null){
			map.put("code", "0");
			map.put("message", "没有找到物流信息");
			
		}else{
			String json=LogisticsUtils.getSuNingLogistics(logistics.getExpressNo());
			map.put("logistics", json);
		}
			
		return JSON.toJSONString(map);
	}

	/**
	 * 异步上传图片
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/upload")
	public String uploadPic(@RequestParam(value = "file") MultipartFile file, @RequestParam("format") String format) {

		Response respone = new Response();
		MallBasicCategoryModelFormat modelFormat = categoryQueryService.queryFormatByCombine(format.replace(",", "-"));
		Map<String, Object> map = new HashMap<String, Object>();
		if (file == null || file.isEmpty()) {
			respone.setSuccess(Boolean.FALSE);
			respone.setMessage("图片不能为空！");
			return JSON.toJSONString(respone);
		}
		if (modelFormat == null) {
			respone.setSuccess(Boolean.FALSE);
			respone.setMessage("请选择正确的规格！");
			return JSON.toJSONString(respone);
		}
		BufferedImage image = null;
		try {
			image = ImageIO.read(file.getInputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
		int height = image.getHeight();
		int width = image.getWidth();
		if ((height < 2000 && width < 4000) || (height < 4000 && width < 2000)) {
			respone.setSuccess(Boolean.FALSE);
			respone.setMessage("图片尺寸不符合");
			return JSON.toJSONString(respone);
		}
		MallCustomPic pic = new MallCustomPic();
		pic.setWidth(width);
		pic.setHeigth((float) height);
		pic.setUserId(getUser().getId());
		pic = mallCustomPicService.upload(file, pic, modelFormat.getId());
		map.put("url", pic.getUrl());
		map.put("width", width);
		map.put("heigth", height);
		map.put("id", pic.getId());

		respone.setResult(map);
		respone.setMessage("成功");
		return JSON.toJSONString(respone);
	}

	/**
	 * 异步上传图片
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/cut")
	public String cutImage(@RequestParam Long id, @RequestParam int x, @RequestParam(defaultValue = "0") int degree, @RequestParam int y,
			@RequestParam int width, @RequestParam int height) {
		Response respone = null;
		try {
			respone = mallCustomPicService.uploadCutImage(getUser(), id, x, y, width, height, degree);

		} catch (Exception e) {
			e.printStackTrace();
			respone = new Response();
			respone.setSuccess(Boolean.FALSE);
			respone.setMessage("裁剪失败");
		}
		return JSON.toJSONString(respone);
	}
}
