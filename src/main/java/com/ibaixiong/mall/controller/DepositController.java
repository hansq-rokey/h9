/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.mall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.ibaixiong.entity.User;
import com.ibaixiong.mall.util.Response;
import com.papabear.order.api.DepositService;
import com.papabear.order.entity.MallFrontMoney;
import com.papabear.order.entity.enums.DepositEnum;
import com.papabear.order.entity.enums.SourceEnum;
import com.papabear.product.api.ProductQueryService;
import com.papabear.product.entity.MallProduct;

/**
 * 定金操作
 * @author yaoweiguo
 * @email  280435353@qq.com
 * @date   2016年7月22日
 * @since  1.0.0
 */
@Controller
public class DepositController extends AbstractController {

	@Resource
	private DepositService depositService;
	@Resource
	private ProductQueryService productQueryService;
	
	/*
	 * 查看产品是否允许下定金
	 * @author yaoweiguo
	 * @date 2016年7月25日
	 * @param productId
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/deposit/view/{productId}")
	public String view(@PathVariable Long productId,ModelMap modelMap){
		MallProduct product=productQueryService.getProduct(productId);
		if(product==null){
			return "redirect:/";
		}
		if(product.getIsUseDeposit()==null||product.getIsUseDeposit().intValue()!=1){
			return "redirect:/";
			
		}
		modelMap.addAttribute("money", product.getDepositMoney());
		modelMap.addAttribute("productId", productId);
		return "deposit/view";
	}
	/*
	 * 添加定金信息
	 */
	@ResponseBody
	@RequestMapping("/u/deposit/add")
	public String add(@ModelAttribute MallFrontMoney deposit,@RequestParam(value="payType",defaultValue="weixinpay")String payType,ModelMap modelMap){
		Response response=new Response();
		Map<String, String> resultData=new HashMap<String, String>();
		try {
			if(StringUtils.isBlank(deposit.getTel())||StringUtils.isBlank(deposit.getName())||
					deposit.getProvinceId()==null||deposit.getCityId()==null||
					deposit.getCountyId()==null||deposit.getProductId()==null){
				modelMap.addAttribute("deposit", deposit);
				response.setSuccess(Boolean.FALSE);
				response.setMessage("内容为空，请检查后再提交！");
				return JSON.toJSONString(response);
			}
			MallProduct product=productQueryService.getProduct(deposit.getProductId());
			if(product==null){
				response.setSuccess(Boolean.FALSE);
				response.setMessage("该产品不翼而飞了，请重新选择商品！");
				return JSON.toJSONString(response);
			}
			if(product.getIsUseDeposit()==null||product.getIsUseDeposit().intValue()!=1){
				response.setSuccess(Boolean.FALSE);
				response.setMessage("改产品不允许下定金，请确认后再提交哦!");
				return JSON.toJSONString(response);
			}
			User user=getUser();
			deposit.setUserId(user.getId());
			deposit.setUserName(user.getUserName());
			deposit.setBxNum(user.getBxNum());
			deposit.setSource(SourceEnum.MALL_PC.getSource());
			//TODO  根据产品id查询定金金额
			deposit.setFrontMoney(product.getDepositMoney());
			String depositNumber=depositService.createDeposit(deposit);
			if(StringUtils.equalsIgnoreCase(payType, "alipay")){
				resultData.put("url", "http://www.ibaixiong.com/u/ali/deposit/pay.html?WIDout_trade_no="+depositNumber+"&WIDtotal_fee=0.01");
			}else if(StringUtils.equalsIgnoreCase(payType, "weixinpay")){				
				resultData.put("url", "http://www.ibaixiong.com/u/weixin/deposit/pay.html?order_Number="+depositNumber+"&fee="+0.01+"&orderText=papabear");
			}else{
				resultData.put("url", "");
			}
			
			resultData.put("number", depositNumber);
			response.setResult(resultData);
		} catch (Exception e) {
			e.printStackTrace();
			response.setSuccess(Boolean.FALSE);
			response.setMessage("数据保存失败！");
		}
		return JSON.toJSONString(response);
	}
	
	@RequestMapping("/u/deposit/list")
	public String list(ModelMap modelMap){
		
		List<MallFrontMoney>list=depositService.queryDeposits(getUser().getId(), null);
		modelMap.addAttribute("list", list);
		modelMap.addAttribute("statusArray", DepositEnum.values());
		return "deposit/list";
	}
	
	@ResponseBody
	@RequestMapping("/u/deposit/refund")
	public String applyRefund(@RequestParam("number")String depositNumber){
		int flag=depositService.updateDepositStatus(depositNumber, getUser().getId(), DepositEnum.AUDIT_REFUND.getStatus());
		Response response=new Response();
		if(flag==1){
			response.setMessage("您的退款申请已提交，请耐心等待！");
		}else{
			response.setSuccess(Boolean.FALSE);
			response.setMessage("很抱歉！程序猿睡着了，没有写完！");
		}
		return JSON.toJSONString(response);
	}
}
