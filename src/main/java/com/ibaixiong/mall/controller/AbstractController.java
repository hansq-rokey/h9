package com.ibaixiong.mall.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.ibaixiong.entity.SsssCityMerchant;
import com.ibaixiong.entity.User;
import com.ibaixiong.mall.service.AddressService;
import com.ibaixiong.mall.service.DictCodeService;
import com.ibaixiong.mall.service.MallCustomPicService;
import com.ibaixiong.mall.service.MallOrderRevicerInformationService;
import com.ibaixiong.mall.service.MallOrderService;
import com.ibaixiong.mall.service.OrderItemService;
import com.ibaixiong.mall.service.UserService;
import com.papabear.product.api.CategoryQueryService;
import com.papabear.product.api.ProductQueryService;

/**
 * Created by Administrator on 2015/7/27.
 */
class AbstractController {

	@Resource
	MallOrderService mallOrderService;

	@Resource
	OrderItemService orderItemService;

	@Resource
	ProductQueryService productQueryService;
	
	@Resource
	CategoryQueryService categoryQueryService;

	@Resource
	UserService userService;

	@Resource
	AddressService addressService;

	@Resource
	MallCustomPicService mallCustomPicService;

	@Resource
	MallOrderRevicerInformationService orderRevicerInformationService;

	@Resource
	protected DictCodeService dictCodeService;

	@ModelAttribute("user")
	User getUser() {

		// session.getAttribute("user")
		Subject subject = SecurityUtils.getSubject();
		if (subject != null && subject.getPrincipal() != null) {
			Object obj = subject.getPrincipal();
			if (obj instanceof User) {
				return (User) obj;
			}
		}
		return null;
	}

	/**
	 * 判断该用户是否有4s店角色
	 * 
	 * @return
	 */
	public boolean has4sRole() {
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole("4s")) {
			return true;
		}
		return false;
	}

	/**
	 * 判断该用户是否有城运商角色
	 * 
	 * @return
	 */
	public boolean hasCitySellRole() {
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole("citySell")) {
			return true;
		}
		return false;
	}
}
