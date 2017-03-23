package com.ibaixiong.mall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.ibaixiong.entity.User;
import com.ibaixiong.mall.exception.NotFindFormatProductException;
import com.ibaixiong.mall.exception.ProductFormatNotMatchException;
import com.ibaixiong.mall.exception.ProductOutException;
import com.ibaixiong.mall.model.MallCarItemExt;
import com.ibaixiong.mall.service.ErpPurchaseMaterialServce;
import com.ibaixiong.mall.service.MallCarItemService;
import com.ibaixiong.mall.util.Response;
import com.papabear.order.api.CarItemService;
import com.papabear.order.entity.MallCarItem;
import com.papabear.order.entity.MallCarItemExtend;
import com.papabear.order.entity.enums.HouseTagEnum;
import com.papabear.product.api.CategoryQueryService;
import com.papabear.product.entity.MallBasicCategoryModelFormat;
import com.papabear.product.entity.MallFormatExt;
import com.papabear.product.entity.MallProduct;

/**
 * Created by Administrator on 2015/8/3.
 */
@Controller
@RequestMapping("/u/car")
class CarItemController extends AbstractController {
	@Resource
	MallCarItemService mallCarItemService;
	@Resource
	CarItemService carItemService;
	@Resource
	ErpPurchaseMaterialServce erpPurchaseMaterialServce;
	@Resource
	CategoryQueryService categoryQueryService;
	/**
	 * 增加产品到购物车
	 */
	@RequestMapping(value = "/add")
	@ResponseBody
	public String add(@RequestParam("format") String format,@RequestParam("num") Float num,@RequestParam(value="tag",required=false)Integer tagCode,
			@RequestParam("product.id") long productId,HttpServletRequest request) {
		Response reponse = new Response();
		try {

			MallBasicCategoryModelFormat modelFormat = categoryQueryService.queryFormatByCombine(format.replace(",", "-"));
			
			MallProduct product=productQueryService.getProduct(productId);
			if(modelFormat==null||product==null){
				reponse.setMessage("没有找到该商品或该商品已下架");
				reponse.setSuccess(false);
				return JSON.toJSONString(reponse);
			}
			if(modelFormat.getcDisplay()!=1){
				reponse.setMessage("该商品规格暂不允许购买，请选择其他规格的商品");
				reponse.setSuccess(false);
				return JSON.toJSONString(reponse);
			}
			float price=0;
			if(modelFormat.getIsExtProperties() != null && modelFormat.getIsExtProperties().intValue() == 1){
				String length = request.getParameter("length");
				String width = request.getParameter("width");
				if(StringUtils.isBlank(length)||StringUtils.isBlank(width)){
					reponse.setMessage("发热墙纸长、宽、高任意参数不能为空");
					reponse.setSuccess(false);
					return JSON.toJSONString(reponse);
				}
				
				if(Float.valueOf(length) <= 0||Float.valueOf(width) <=0){
					reponse.setMessage("发热墙纸长、宽、高任意参数必须大于0");
					reponse.setSuccess(false);
					return JSON.toJSONString(reponse);
				}
				price=erpPurchaseMaterialServce.calculatePrice(modelFormat.getId(), num, Float.valueOf(length)*Float.valueOf(width));
				
			}else{
				price=modelFormat.getPrice()*num;
			}
//			Long carItemId=carItemService.add(getUser().getId(), modelFormat.getId(), num, productId);
			Long carItemId=carItemService.add(getUser().getId(), modelFormat.getId(), num, productId, product.getFeature(), product.getTitle(), tagCode, HouseTagEnum.getTagName(tagCode), price);
			// 判断是否发热墙纸
			if (modelFormat.getIsExtProperties() != null && modelFormat.getIsExtProperties().intValue() == 1) {
				String length = request.getParameter("length");
				String width = request.getParameter("width");
				String height = request.getParameter("height");
				if(length==null||width==null||height==null){
					reponse.setMessage("发热墙纸长、宽、高任意参数不能为空");
					reponse.setSuccess(false);
					return JSON.toJSONString(reponse);
				}
				carItemService.addCarItemExtend(Float.valueOf(length), Float.valueOf(width), Float.valueOf(height), Float.valueOf(length)*Float.valueOf(width), carItemId, productId, modelFormat.getId(), getUser().getId(), null, null);
			}
			reponse.setMessage("成功添加至购物车");
			JSON.toJSONString(reponse);
		} catch (Exception e) {
			if (e instanceof NotFindFormatProductException) {
				reponse.setMessage("没有找到该商品或该商品已下架");
				reponse.setSuccess(false);
			} else if (e instanceof ProductOutException) {
				reponse.setMessage("没有找到该商品或该商品已下架");
				reponse.setSuccess(false);
			} else if (e instanceof ProductFormatNotMatchException) {
				reponse.setMessage("该商品信息有误");
				reponse.setSuccess(false);
			} else {
				reponse.setMessage("添加商品至购物车失败");
				reponse.setSuccess(false);
				e.printStackTrace();
			}
		}
		return JSON.toJSONString(reponse);
	}

	/**
	 * 从购物车删除某个商品
	 * 
	 * @param productModelId
	 * @param user
	 */
	@RequestMapping("/remove")
	@ResponseBody
	public String remove(@RequestParam("carId") Long carId) {
		Response response = new Response();
		response.setMessage("操作成功");
		try {
			carItemService.delete(getUser().getId(),carId);
		} catch (Exception e) {
			e.printStackTrace();
			response.setSuccess(Boolean.FALSE);
			response.setMessage("操作失败");
		}
		return JSON.toJSONString(response);
	}

	/**
	 * 更改购物车某个商品的购买数量
	 * @param carId   购物车ID
	 * @param num	      数量
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	String update(@RequestParam("carId") Long carId /* 这里面只有两个属性有值：id，num */,
			@RequestParam("num") Float num) {
		Response response = new Response();
		MallCarItem mallCarItem=carItemService.getMallCarItem(getUser().getId(), carId);
		if(mallCarItem==null){
			response.setMessage("有点小顽皮哦！");
			response.setSuccess(Boolean.FALSE);
			return JSON.toJSONString(response);
		}
		MallBasicCategoryModelFormat format=categoryQueryService.getCategoryModelFormat(mallCarItem.getProductModelFormatId());
		if(format==null){
			response.setMessage("很遗憾，没有找到该规格相关信息");
			response.setSuccess(Boolean.FALSE);
			return JSON.toJSONString(response);
		}
		//判断该规格是否是扩展属性
		Float price=0f;
		if(format.getIsExtProperties()!=null&&format.getIsExtProperties().intValue()==1){
			MallCarItemExtend extend=carItemService.getCarItemExtend(getUser().getId(), carId);
			float groundArea=extend.getLength()*extend.getWidth();
			price=erpPurchaseMaterialServce.calculatePrice(mallCarItem.getProductModelFormatId(), num, groundArea);
		}else{
			price=format.getPrice()*num;
		}
		MallCarItem carItem = new MallCarItem();
		carItem.setId(carId);
		carItem.setNum(num);
		carItem.setUserId(getUser().getId());
		carItem.setTotalPrice(price);
		int flag = carItemService.update(carItem);
		if (flag == 0) {
			response.setMessage("数量不能小于1");
			response.setSuccess(Boolean.FALSE);
		} else if (flag == -1) {
			response.setMessage("亲，库存不足了");
			response.setSuccess(Boolean.FALSE);
		} else {
			response.setMessage("更新成功");
			response.setSuccess(Boolean.TRUE);
		}
		response.setResult(price);
		return JSON.toJSONString(response);
	}

	/**
	 * 购物车列表
	 * @param user
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/list")
	String list(@ModelAttribute("user") User user, ModelMap modelMap,HttpServletRequest request) {
		List<MallCarItemExt> carItemListRet = mallCarItemService.getList(user);
		for(MallCarItemExt car : carItemListRet){
			MallBasicCategoryModelFormat format = categoryQueryService.getCategoryModelFormat(car.getCarItem().getProductModelFormatId());
			//判断是否有扩展属性
			Float price = 0f;
			if(format.getIsExtProperties()!=null && format.getIsExtProperties().intValue()==1){
				MallCarItemExtend extend = carItemService.getCarItemExtend(user.getId(), car.getCarItem().getId());
				float groundArea = extend.getLength()*extend.getWidth();
				price = erpPurchaseMaterialServce.calculatePrice(car.getCarItem().getProductModelFormatId(),car.getCarItem().getNum(),groundArea);
			}else{
				price = format.getPrice()*car.getCarItem().getNum();
			}
			car.getCarItem().setTotalPrice(price);
		}
		modelMap.addAttribute("carItemList", carItemListRet);
		return "car/list";
	}

}
