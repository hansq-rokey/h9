package com.ibaixiong.mall.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.ibaixiong.constant.Constant;
import com.ibaixiong.core.utils.ResponseResult;
import com.ibaixiong.entity.MallAddress;
import com.ibaixiong.entity.User;

/**
 * Created by lijihuai on 2015/8/24.
 */
@Controller
@RequestMapping("/u/address")
class AddressController extends AbstractController {
	@ResponseBody
	@RequestMapping("/add")
	String add(@ModelAttribute("address") MallAddress address,
			@RequestParam("regional") String regional,
			@RequestParam("regionalName") String regionalName) {
		User user = getUser();
		address.setUserId(user.getId());// -----------------------
		String[] regIds = regional.split("-");
		address.setProvinceCode(regIds[0]);// -----------
		address.setCityCode(regIds[1]);
		address.setDistrictCode(regIds[2]);
		String[] regNames = regionalName.split("-");
		address.setProvinceName(regNames[0]);
		address.setCityName(regNames[1]);
		address.setDistrictName(regNames[2]);
		address.setCreateDateTime(new Date());
		address.setStatus(Constant.Status.NORMAL.getStatus());
		address.setIsDefault((byte) 0);// 非默认地址
		Long id = addressService.add(address);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);// 设置当前添加的地址ID
		return JSON.toJSONString(ResponseResult.result(0, null, map));
	}

	@RequestMapping("/remove")
	@ResponseBody
	String remove(@ModelAttribute("address") MallAddress address) {
		User user = getUser();
		address.setUserId(user.getId());
		addressService.remove(address);
		return JSON.toJSONString(ResponseResult.result(0, null));
	}

	@RequestMapping("/update")
	@ResponseBody
	String update(@ModelAttribute("address") MallAddress address,
			@RequestParam("regional") String regional,
			@RequestParam("regionalName") String regionalName) {
		User user = getUser();
		address.setUserId(user.getId());// --------------
		String[] regIds = regional.split("-");
		address.setProvinceCode(regIds[0]);
		address.setCityCode(regIds[1]);
		address.setDistrictCode(regIds[2]);
		String[] regNames = regionalName.split("-");
		address.setProvinceName(regNames[0]);
		address.setCityName(regNames[1]);
		address.setDistrictName(regNames[2]);
		addressService.update(address);
		return JSON.toJSONString(ResponseResult.result(0, null));
	}

	@RequestMapping("/list")
	String list(ModelMap modelMap) {
		User user = getUser();
		modelMap.addAttribute("addressList", addressService.getList(user));
		return "user/addressList";
	}

	/**
	 * 设置默认地址
	 * 
	 * @author zhaolei
	 * @date 2015年9月18日
	 * @param address
	 * @param regional
	 * @param regionalName
	 * @param response
	 * @return
	 */
	@RequestMapping("/setdef")
	@ResponseBody
	String setDef(@ModelAttribute("address") MallAddress address) {
		User user = getUser();
		address.setUserId(user.getId());// --------------
		// 将所有的地址的记录先更新为不默认选中
		addressService.setDefUpdate(address);
		return JSON.toJSONString(ResponseResult.result(0, null));
	}
}
