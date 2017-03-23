package com.ibaixiong.mall.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.ibaixiong.mall.exception.NotFindProductException;
import com.ibaixiong.mall.model.PicTypeEnum;
import com.ibaixiong.mall.service.ErpPurchaseMaterialServce;
import com.ibaixiong.mall.util.Response;
import com.papabear.product.entity.MallBasicCategoryModelFormat;
import com.papabear.product.entity.MallFormatExt;
import com.papabear.product.entity.MallProduct;
import com.papabear.product.entity.MallProductPic;
import com.papabear.product.entity.MallProductProperties;

/**
 * Created by Administrator on 2015/8/4.
 */
@Controller
@RequestMapping("/product")
class ProductController extends AbstractController{
	
	@Resource
	private ErpPurchaseMaterialServce erpPurchaseMaterialServce;
	/**
	 * 产品详细页
	 * @author yaoweiguo
	 * @date 2016年7月20日
	 * @param id
	 * @param modelMap
	 * @return
	 */
    @RequestMapping("/{id}.html")
    String detail(@PathVariable("id") long id,ModelMap modelMap) {
		MallProduct product=productQueryService.detail(id);
		if(product==null){
			throw new NotFindProductException("1001",null);
		}
		if(product.getcDisplay()==null || product.getcDisplay().intValue()==0){
			throw new NotFindProductException("您暂时不能查看该商品详细信息！");
		}
//		List<MallBasicCategoryModelFormat> formatLists= categoryQueryService.queryFormatsByModelId(product.getCategoryModelId());
		//查询C端所有可见的产品规格
		List<MallBasicCategoryModelFormat> formatLists = 
				categoryQueryService.queryFormatsByModelIdAndDisplay(product.getCategoryModelId(), (byte)1, null);
		//查询C端所有不可见的产品规格
		List<MallBasicCategoryModelFormat> formats = 
				categoryQueryService.queryFormatsByModelIdAndDisplay(product.getCategoryModelId(), (byte)0, null);
		modelMap.addAttribute("noneFomats", formats);
		List<MallProductProperties> propertiesList=productQueryService.queryProductPropertiesByModelId(product.getCategoryModelId());
		modelMap.addAttribute("properties",propertiesList );
		if(formatLists.size()>0){
			//通过sql price 升序 获取最低价格
			MallBasicCategoryModelFormat format=formatLists.get(0);
			if(format.getIsExtProperties()!=null&&format.getIsExtProperties().intValue()==1){
				List<MallFormatExt> formatExts= categoryQueryService.queryMallFormatExts(format.getId(),null);
				modelMap.addAttribute("exts", formatExts);
			}
			modelMap.addAttribute("bottomPriceFormat",format );
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("productId", product.getId());
			map.put("type", PicTypeEnum.FORMAT_THUMB.getCode());
			map.put("formatId", format.getId());
			modelMap.addAttribute("productPics",productQueryService.queryProductPicByFormatId(map) );
		}
        modelMap.addAttribute("product", product);
        return "product/detail";
    }
	
    /**
     * 具体规格相关信息
     * @author yaoweiguo
     * @date 2016年7月20日
     * @param flag
     * @param response
     * @return
     */
	@ResponseBody
	@RequestMapping("/format/price")
	public String getPrice(@RequestParam("flag")String flag,HttpServletResponse response){
		MallBasicCategoryModelFormat format=categoryQueryService.queryFormatByCombine(flag.replace(",", "-"));
		response.setContentType("text/javascript; charset=utf-8");
		Response respone=new Response();
		if(format==null){
			respone.setSuccess(Boolean.FALSE);
			respone.setMessage("没有查询到相关数据!");
			return JSON.toJSONString(respone);
		}
		Map<String, Object> result=new LinkedHashMap<String, Object>();
		result.put("price", format.getPrice());
		result.put("discountPrice", format.getDiscountPrice());
		result.put("stock", format.getStock());
		result.put("length", format.getLength());
		result.put("width", format.getWidth());
		result.put("isExt", format.getIsExtProperties());
		result.put("unit", format.getUnit());
		result.put("explain", format.getExplain());
		result.put("id", format.getId());
		//查询图片
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("type", PicTypeEnum.FORMAT_THUMB.getCode());
		map.put("formatId", format.getId());
		List<MallProductPic> pics= productQueryService.queryProductPicByFormatId(map);
		List<String> picUrlList=new ArrayList<String>();
		for(MallProductPic pic:pics){
			picUrlList.add(pic.getUrl());
		}
		result.put("pics", picUrlList);
		if(format.getIsExtProperties()!=null&&format.getIsExtProperties().intValue()==1){
			List<MallFormatExt> formatExts= categoryQueryService.queryMallFormatExts(format.getId(),null);
			Map<String, Object> formatExtMap=new HashMap<String, Object>();
			for(MallFormatExt ext:formatExts){
				formatExtMap.put("id", ext.getId());
				formatExtMap.put("name", ext.getPropertyName());
				formatExtMap.put("identify", ext.getIdentify());
				formatExtMap.put("type", ext.getType());
			}
			result.put("exts", formatExts);
		}
		respone.setMessage("成功");
		respone.setResult(result);
		return JSON.toJSONString(respone);
	}
	
	/**
	 * 计算规格价格
	 * @author yaoweiguo
	 * @date 2016年7月20日
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/calculate",method=RequestMethod.POST)
	public String calculateFormatPrice(@RequestParam Long formatId,@RequestParam float area,@RequestParam float groundArea){
		Response response=new Response();
		try {
			response.setResult(erpPurchaseMaterialServce.calculatePrice(formatId, area, groundArea));
			
		} catch (Exception e) {
			response.setSuccess(Boolean.FALSE);
		}
		return JSON.toJSONString(response);
	}
}
