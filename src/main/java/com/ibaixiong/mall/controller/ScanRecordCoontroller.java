/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.mall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibaixiong.entity.ErpHardwareProduct;
import com.ibaixiong.entity.ErpSecurityCodeMacRelation;
import com.ibaixiong.entity.ScanRecod;
import com.ibaixiong.mall.service.ErpSecurityCodeMacRelationService;
import com.ibaixiong.mall.service.ScanRecordService;
import com.papabear.product.entity.MallProductPic;

/**
 * @description 防伪查询
 * @author chenzehe
 * @email hljuczh@163.com
 * @create 2015年12月7日-上午11:56:40
 */
@Controller
public class ScanRecordCoontroller extends AbstractController {
	@Autowired
	ScanRecordService scanRecordService;
	@Resource
	ErpSecurityCodeMacRelationService securityCodeMacRelationService;

	@RequestMapping("/h5/scan-record")
	public String show(ModelMap modelMap, HttpServletRequest request) {
		String macCode = request.getParameter("code");
		ErpSecurityCodeMacRelation relation=securityCodeMacRelationService.getErpSecurityCodeMacRelation(macCode);
		if(relation==null||relation.getMac()==null){
			modelMap.addAttribute("scanResult", "查询不到熊爸爸的产品！");
			return "h5/scan-record";
		}
		ErpHardwareProduct heardwareProduct = scanRecordService.getErpHardwareProductByMacCode(relation.getMac());
		if (heardwareProduct != null) {
			modelMap.addAttribute("productName", heardwareProduct.getCategoryModel().getName());
			modelMap.addAttribute("productFormat", heardwareProduct.getCategoryModelFormat().getName());
			modelMap.addAttribute("productMfgDate", heardwareProduct.getMfgDateTime());
			Map<String, Object> picMap = new HashMap<String, Object>();
			picMap.put("formatId", heardwareProduct.getCategoryModelFormat().getId());
			picMap.put("type", 2);
			List<MallProductPic> pics = productQueryService.queryProductPicByFormatId(picMap);
			modelMap.addAttribute("pic", (pics != null && pics.size() > 0) ? pics.get(0).getUrl() : null);
			modelMap.addAttribute("scanResult", "您买到的是正品！");
			List<ScanRecod> listScanRecod = scanRecordService.getListScanRecod(macCode);
			modelMap.addAttribute("listScanRecod", listScanRecod);
		} else {
			modelMap.addAttribute("scanResult", "查询不到熊爸爸的产品！");
		}
		return "h5/scan-record";
	}

}
