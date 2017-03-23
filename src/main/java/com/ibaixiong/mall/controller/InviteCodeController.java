package com.ibaixiong.mall.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.ibaixiong.entity.SsssInvitationCode;
import com.ibaixiong.mall.service.SsssInvitationCodeService;
import com.ibaixiong.mall.util.Pager;
import com.papabear.product.entity.MallProduct;

@Controller
public class InviteCodeController extends AbstractController{

	@Resource
	private SsssInvitationCodeService invitationCodeService;
	
	@RequestMapping("/u/invite/list")
	public String list(@RequestParam(defaultValue="1",value="pn") Integer pageNo,ModelMap model){
		int pageSize=10;
		List<SsssInvitationCode> inviteCodes= invitationCodeService.queryInviteCodeByPhone(getUser(), pageNo, pageSize);
		Pager<SsssInvitationCode> pager = new Pager<SsssInvitationCode>(inviteCodes, pageNo, pageSize);
		model.addAttribute("codes", inviteCodes);
		model.addAttribute("pager", pager);
		model.addAttribute("url", "/u/invite/list.html?pn=");
		return "invitecode/list";
	}
	
	/** 查看邀请码**/
	@RequestMapping("/u/invite/getallowproduct")
	@ResponseBody
	public String getAllowProduct(ModelMap modelMap, HttpServletRequest request) {
		String productList = null;
		try {
			String id = request.getParameter("id");
			if (StringUtils.isNotBlank(id)) {
				String[] ids = id.split(",");
				List<Long> listProductIds = new ArrayList<Long>();
				for (int i = 0; i < ids.length; i++) {
					listProductIds.add(Long.valueOf(ids[i]));
				}
				List<MallProduct> listProduct = productQueryService.queryProductListByIds(listProductIds);
				productList = JSON.toJSONString(listProduct).toString();
			}
		} catch (Exception e) {
			return "{\"code\":-1}";
		}
		return productList;
	}
}
