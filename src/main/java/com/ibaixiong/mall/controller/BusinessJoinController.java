/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.mall.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibaixiong.core.web.RequestUtils;
import com.ibaixiong.entity.MallBusinessJoin;
import com.ibaixiong.mall.service.MallBusinessJoinService;

/**
 * 
 * @author yaoweiguo
 * @email  280435353@qq.com
 * @date   2016年7月12日
 * @since  1.0.0
 */

@Controller
public class BusinessJoinController extends AbstractController{
	Logger logger=LoggerFactory.getLogger(getClass());
	
	@Resource
	private MallBusinessJoinService businessJoinService;
	/**
	 * 添加招商加盟功能
	 * @author yaoweiguo
	 * @date 2016年7月12日
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/join/add.html")
	public String addBusinessJoin(@ModelAttribute MallBusinessJoin join,HttpServletRequest request){
		join.setIp(RequestUtils.getIpAddr(request));
		try {
			businessJoinService.add(join);
			
		} catch (Exception e) {
			logger.error("提交招商数据报错,错误信息:{}",e.getMessage());
			return "error";
		}
		
		return "success";
	}
	
	@RequestMapping("/attract.html")
	public String index(HttpServletRequest request,ModelMap modelMap){
		String orgin=request.getParameter("orgin");
		String pageValue=request.getParameter("pageValue");
		String advertValue=request.getParameter("advertValue");
		if(orgin==null || pageValue==null || advertValue==null){
			return "enterprise/attract";
		}
		if(checkUrl(orgin) || !orgin.matches("[0-9]+")){
			return "enterprise/error";
		}
		modelMap.addAttribute("type", orgin);
		modelMap.addAttribute("pageValue", pageValue);
		modelMap.addAttribute("advertValue", advertValue);
		return "enterprise/attract";
	}
	
	/** 
	* @Description:新招商页面1
	* @param request
	* @param modelMap
	* @return String
	* @author hansq
	* @date 2017年3月17日 下午3:57:03   
	*/
	@RequestMapping("/attract1.html")
	public String index1(HttpServletRequest request,ModelMap modelMap){
		String orgin=request.getParameter("orgin");
		String pageValue=request.getParameter("pageValue");
		String advertValue=request.getParameter("advertValue");
		if(orgin==null || pageValue==null || advertValue==null){
			return "enterprise/attract1";
		}
		if(checkUrl(orgin) || !orgin.matches("[0-9]+")){
			return "enterprise/error";
		}
		modelMap.addAttribute("type", orgin);
		modelMap.addAttribute("pageValue", pageValue);
		modelMap.addAttribute("advertValue", advertValue);
		return "enterprise/attract1";
	}
	/** 
	* @Description:新招商页面2
	* @param request
	* @param modelMap
	* @return String
	* @author hansq
	* @date 2017年3月17日 下午1:57:03   
	*/
	@RequestMapping("/attractb02.html")
	public String attractb02(HttpServletRequest request,ModelMap modelMap){
		String orgin=request.getParameter("orgin");
		String pageValue=request.getParameter("pageValue");
		String advertValue=request.getParameter("advertValue");
		if(orgin==null || pageValue==null || advertValue==null){
			return "enterprise/attractb02";
		}
		if(checkUrl(orgin) || !orgin.matches("[0-9]+")){
			return "enterprise/error";
		}
		modelMap.addAttribute("type", orgin);
		modelMap.addAttribute("pageValue", pageValue);
		modelMap.addAttribute("advertValue", advertValue);
		return "enterprise/attractb02";
	}
	/** 
	* @Description:新招商页面3
	* @param request
	* @param modelMap
	* @return String
	* @author hansq
	* @date 2017年3月17日 下午1:57:03   
	*/
	@RequestMapping("/attractb03.html")
	public String attractb03(HttpServletRequest request,ModelMap modelMap){
		String orgin=request.getParameter("orgin");
		String pageValue=request.getParameter("pageValue");
		String advertValue=request.getParameter("advertValue");
		if(orgin==null || pageValue==null || advertValue==null){
			return "enterprise/attractb03";
		}
		if(checkUrl(orgin) || !orgin.matches("[0-9]+")){
			return "enterprise/error";
		}
		modelMap.addAttribute("type", orgin);
		modelMap.addAttribute("pageValue", pageValue);
		modelMap.addAttribute("advertValue", advertValue);
		return "enterprise/attractb03";
	}
	/** 
	* @Description:验证路径上数据是否包含特殊字符
	* @param str
	* @return boolean
	* @author hansq
	* @date 2017年3月22日 下午3:09:17   
	*/
	public static boolean checkUrl(String str){
		String regex = "[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
		boolean flag = false;
		for(int i=0;i<str.length();i++){
			String s = str.charAt(i)+"";
			if(s.equals(" ") || s.matches(regex)){
				flag = true;
				break;
			}
		}
		return flag;
	}
}
