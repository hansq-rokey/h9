package com.ibaixiong.mall.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.ibaixiong.mall.model.PicTypeEnum;
import com.papabear.product.api.CategoryQueryService;
import com.papabear.product.api.ProductQueryService;
import com.papabear.product.entity.MallBasicCategoryModelFormat;
import com.papabear.product.entity.MallProduct;
import com.papabear.product.entity.MallProductPic;

@Controller
public class CreateFormatJsonController {

	@Autowired
	CategoryQueryService categoryQueryService;
	@Autowired
	ProductQueryService productQueryService;

	@ResponseBody
	@RequestMapping("/format/json")
	public String createFormatJson(@RequestParam String productId, @RequestParam String name, @RequestParam String userName, @RequestParam String password,
			HttpServletRequest request) {

		if (!userName.equals("qazwsx654321") && password.equals("123qaz")) {
			return "你没有权限访问";
		}
		String productName = "";
		String[] productIds = productId.split(",");
		List<Map<String, Object>> firstListMap = new ArrayList<Map<String, Object>>();
		try {
			for (String id : productIds) {
				MallProduct product = productQueryService.getProduct(Long.valueOf(id));
				if (product == null) {
					return "产品为空";
				}
				productName += product.getTitle() + "|";
				List<MallBasicCategoryModelFormat> list = 
						categoryQueryService.queryFormatsByModelIdAndDisplay(product.getCategoryModelId(), (byte)1, null);

				Map<String, Object> firstMap = new HashMap<String, Object>();
				firstMap.put("productId", product.getId());

				List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();
				for (MallBasicCategoryModelFormat format : list) {
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("id", format.getId());
					map.put("price", format.getPrice());
					map.put("name", format.getName());
					map.put("stock", format.getStock());
					// 查询图片
					Map<String, Object> picMap = new HashMap<String, Object>();
					picMap.put("type", PicTypeEnum.FORMAT_THUMB.getCode());
					picMap.put("formatId", format.getId());
					List<MallProductPic> pics = productQueryService.queryProductPicByFormatId(picMap);
					List<String> picUrlList = new ArrayList<String>();
					for (MallProductPic pic : pics) {
						picUrlList.add(pic.getUrl());
					}
					map.put("pics", picUrlList);
					listMap.add(map);
				}
				firstMap.put("formats", listMap);
				firstListMap.add(firstMap);
			}
			String json = JSON.toJSONString(firstListMap);
			String path = request.getSession().getServletContext().getRealPath("/") + "plug/walldraw_plug_new/" + name + ".js";
			InputStream in = new ByteArrayInputStream(json.getBytes());
			FileUtils.copyInputStreamToFile(in, new File(path));
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "成功生成产品名称为《" + productName + "》的规格json数据";
	}
}
