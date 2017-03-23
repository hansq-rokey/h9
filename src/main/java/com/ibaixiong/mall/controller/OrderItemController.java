package com.ibaixiong.mall.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibaixiong.core.utils.DateUtil;
import com.ibaixiong.core.utils.IpUtil;
import com.ibaixiong.entity.MallAddress;
import com.ibaixiong.entity.User;
import com.ibaixiong.entity.util.OrderStatusEnum;
import com.ibaixiong.mall.model.MallAfterSalesServiceExt;
import com.ibaixiong.mall.service.MallAfterSalesServiceService;
import com.ibaixiong.mall.service.MallOrderHistoryService;
import com.papabear.commons.entity.Pager;
import com.papabear.order.entity.MallAfterSalesService;
import com.papabear.order.entity.MallOrder;
import com.papabear.order.entity.MallOrderHistory;
import com.papabear.order.entity.OrderConstant.ServiceTypeEnum;

/**
 * 售后服务 Created by Administrator on 2015/8/30 0030.
 */
@Controller
@RequestMapping("/u/service")
class OrderItemController extends AbstractController {

	@Resource
	private MallAfterSalesServiceService afterSalesServiceService;
	@Resource
	private MallOrderHistoryService historyService;

	/* 申请售后服务入口 */
	@RequestMapping("/apply")
	String afterSaleService(ModelMap modelMap, @RequestParam("number") String orderNumber) {
		MallOrder order = mallOrderService.queryOrderByOrderNumber(getUser(), orderNumber);
		modelMap.addAttribute("order", order);
		// 售后服务时间判断，暂定从发货时间开始算，15天后不允许
		MallOrderHistory history = historyService.getmMallOrderHistory(orderNumber, OrderStatusEnum.SIPPING, getUser());
		boolean isAfter = false;
		if (history != null) {
			Date date = history.getCreateDateTime();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.add(Calendar.DAY_OF_MONTH, 15);
			isAfter = DateUtil.compareDate(calendar.getTime(), new Date());
		}
		modelMap.addAttribute("isAfter", isAfter);
		modelMap.addAttribute("orderItems", orderItemService.queryMallOrderItemsAndPicsByOrderNumber(getUser().getId(), order.getOrderNumber()));
		modelMap.addAttribute("receiver", orderRevicerInformationService.getOrderRevicerInformation(getUser(), orderNumber));
		return "order/list/service";
	}

	/* 申请退货售后服务入口 */
	@RequestMapping("/back")
	String backSercie(@ModelAttribute("user") User user, ModelMap modelMap, @RequestParam("number") String orderNumber) {
		MallOrder order = mallOrderService.queryOrderByOrderNumber(user, orderNumber);
		modelMap.addAttribute("order", order);
		// 售后服务时间判断，暂定从发货时间开始算，7天后不允许
		MallOrderHistory history = historyService.getmMallOrderHistory(orderNumber, OrderStatusEnum.SIPPING, getUser());
		boolean isAfter = false;
		if (history != null) {
			Date date = history.getCreateDateTime();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			calendar.add(Calendar.DAY_OF_MONTH, 7);
			isAfter = DateUtil.compareDate(calendar.getTime(), new Date());
		}
		modelMap.addAttribute("isAfter", isAfter);
		modelMap.addAttribute("orderItems", orderItemService.queryMallOrderItemsAndPicsByOrderNumber(getUser().getId(), order.getOrderNumber()));
		modelMap.addAttribute("receiver", orderRevicerInformationService.getOrderRevicerInformation(user, orderNumber));
		return "order/list/apply_back";
	}

	/* 提交售后服务 */
	@RequestMapping("/commit")
	String apply(@ModelAttribute("address") MallAddress address, @ModelAttribute("service") MallAfterSalesService service,
			@RequestParam("regional") String regional, ModelMap modelMap, @RequestParam("regionalName") String regionalName,
			HttpServletRequest request) {
		orderItemService.add(service, address, regional, regionalName, getUser(), IpUtil.getIpAddr(request));
		if (service.getServiceType() == 1) {
			return "redirect:/u/service/list/back.html";
		} else if (service.getServiceType() == 2) {
			return "redirect:/u/service/list/exchange.html";
		} else {
			return "redirect:/u/service/list/repair.html";
		}
	}

	/* 换货 */
	/* 列出换货的订单，按时间倒排 */
	@RequestMapping("/list/exchange")
	String listExchangeApply(@ModelAttribute("user") User user, ModelMap modelMap,
			@RequestParam(value = "pageNo", required = false, defaultValue = "0") int pageNo) {
		int pageSize = 10;
		Pager<MallAfterSalesServiceExt> pager = afterSalesServiceService.queryMallAfterSalesServices(getUser(), ServiceTypeEnum.EXCHANGE.getCode(), pageNo, pageSize);
		modelMap.addAttribute("serviceList", pager.getList());
		modelMap.addAttribute("pager", pager);
		modelMap.addAttribute("url", "/u/service/list/exchange.html?pageNo=");
		return "order/list/service/exchange";
	}

	/* 列出申请换货已通过审核的订单，按时间倒排 */
	@RequestMapping("/list/back")
	String listExchangeAgreed(@ModelAttribute("user") User user, ModelMap modelMap,
			@RequestParam(value = "pageNo", required = false, defaultValue = "0") int pageNo) {
		int pageSize = 10;
		Pager<MallAfterSalesServiceExt> pager = afterSalesServiceService.queryMallAfterSalesServices(getUser(), ServiceTypeEnum.BACK.getCode(), pageNo, pageSize);
		modelMap.addAttribute("serviceList", pager.getList());
		modelMap.addAttribute("pager", pager);
		modelMap.addAttribute("url", "/u/service/list/back.html?pageNo=");
		return "order/list/service/back";
	}

	/* 列出申请换货已通过审核进入配货状态的订单，按时间倒排 */
	@RequestMapping("/list/repair")
	String listExchangePreparing(@ModelAttribute("user") User user, ModelMap modelMap,
			@RequestParam(value = "pageNo", required = false, defaultValue = "0") int pageNo) {
		int pageSize = 10;
		Pager<MallAfterSalesServiceExt> pager = afterSalesServiceService.queryMallAfterSalesServices(getUser(), ServiceTypeEnum.REPAIR.getCode(), pageNo, pageSize);
		modelMap.addAttribute("serviceList", pager.getList());
		modelMap.addAttribute("pager", pager);
		modelMap.addAttribute("url", "/u/service/list/repair.html?pageNo=");
		return "order/list/service/repair";
	}

	@InitBinder("orderItem")
	protected void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
		binder.registerCustomEditor(Timestamp.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
		binder.setFieldDefaultPrefix("orderItem.");
	}
}
