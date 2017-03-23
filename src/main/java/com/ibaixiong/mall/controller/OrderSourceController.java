package com.ibaixiong.mall.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.ibaixiong.core.utils.IpUtil;
import com.ibaixiong.entity.StaffRegion;
import com.ibaixiong.entity.User;
import com.ibaixiong.entity.util.DictTypeEnum;
import com.ibaixiong.mall.exception.LowStocksException;
import com.ibaixiong.mall.exception.NotFindFormatProductException;
import com.ibaixiong.mall.exception.NotFindProductException;
import com.ibaixiong.mall.model.DictCode;
import com.ibaixiong.mall.model.OrderSubmitInfo;
import com.ibaixiong.mall.service.DictCodeService;
import com.ibaixiong.mall.service.ErpPurchaseMaterialServce;
import com.ibaixiong.mall.service.MallOrderService;
import com.ibaixiong.mall.service.StaffRegionService;
import com.ibaixiong.mall.util.Response;
import com.papabear.order.entity.MallOrder;
import com.papabear.order.entity.MallOrderRevicerInformation;
import com.papabear.product.entity.MallBasicCategoryModelFormat;
import com.papabear.product.entity.MallProduct;

@Controller
@RequestMapping("/orderSource")
public class OrderSourceController extends AbstractController{
	@Resource
	private DictCodeService codeService;
	@Resource
	private StaffRegionService staffRegionService;
	@Resource
	private ErpPurchaseMaterialServce erpPurchaseMaterialServce;
	@Resource
	private MallOrderService mallOrderService;
	/**
	 * 活动详情页下单
	 * @param countyId
	 * @param mobilePhone
	 * @param name
	 * @param address
	 * @param num
	 * @param combine
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/save")
	public String confirm(
			@RequestParam(value="formatId",required = false)Long formatId,
			@RequestParam(value="productId",required = false)Long productId,
			@RequestParam(value="countyId",required = false)Long countyId,
			@RequestParam(value="mobilePhone",required = false) String mobilePhone,
			@RequestParam(value="name",required = false)String name,
			@RequestParam(value="address",required = false)String address,
			@RequestParam(value="num",required = false) Float num,
			@RequestParam(value="typeValue",required = false) String typeValue,
			//属性值组合
			@RequestParam(value="price")float price,
			@RequestParam(value="remark")String remark,
			HttpServletRequest request){
		Response response = new Response();
		MallProduct product = productQueryService.getProduct(productId);
		try {
			if(product.getcDisplay()==null || product.getcDisplay().intValue()==0){
				return "您暂时不能查看该商品详细信息！";
			}
			User user = getUser();
			if(user==null){
				user = new User();
				user.setId(88888888l);
				user.setNickName("货到付款");
			}
			DictCode dictCode = codeService.getByDictTypeAndValue(DictTypeEnum.SOURCE_STATUS.getDictType(), typeValue);
			if(dictCode==null){
				typeValue="1";
			}
			Byte value= Byte.parseByte(typeValue);
			remark = "[货到付款]"+remark;
			MallBasicCategoryModelFormat format = categoryQueryService.getCategoryModelFormat(formatId);
			if(format==null || format.getId().intValue()==0){
				return "没有找到该型号";
			}
			if(format.getStock()<num.intValue()){
				return "库存不足";
			}

			MallOrder order = mallOrderService.createSingleOrderSource(
					user, format, remark, num, IpUtil.getIpAddr(request), 
					value, address, countyId, name, mobilePhone, price, 
					null,null,null,null,null);
			if(order!=null){
				response.setSuccess(true);
				response.setMessage("成功购买产品，稍后会有客服和您联系");
				response.setResult(order);
			}
		} catch (Exception e) {
			response.setMessage("添加商品至购物车失败");
			response.setSuccess(false);
			e.printStackTrace();
		}
		
		return JSON.toJSONString(response);
	}
}
