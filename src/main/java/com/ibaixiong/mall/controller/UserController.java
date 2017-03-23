package com.ibaixiong.mall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.ibaixiong.core.utils.Md5Util;
import com.ibaixiong.core.utils.ResponseResult;
import com.ibaixiong.entity.CcmQuestion;
import com.ibaixiong.entity.SsssCityMerchant;
import com.ibaixiong.entity.SsssInfo;
import com.ibaixiong.entity.User;
import com.ibaixiong.mall.service.CcmQuestionService;
import com.ibaixiong.mall.service.SsssCityMerchantService;
import com.ibaixiong.mall.service.SsssInfoService;
import com.ibaixiong.mall.service.VerificationCodeService;
import com.ibaixiong.mall.util.Response;

/**
 * Created by Administrator on 2015/7/27.
 */
@Controller
class UserController extends AbstractController {
	@Resource
	VerificationCodeService verificationCodeService;
	@Resource
	CcmQuestionService ccmQuestionService;
	@Resource
	SsssCityMerchantService ssssCityMerchantService;
	@Resource
	SsssInfoService ssssInfoService;

	@RequestMapping("/u/user/updatepwd")
	String toUpdatePwd(ModelMap modelMap, @ModelAttribute("user") User user) {
		modelMap.addAttribute("user", userService.get(user.getId()));
		return "user/updatePwd";
	}

	@RequestMapping("/u/user/account")
	String account(ModelMap modelMap, @ModelAttribute("user") User user) {
		modelMap.addAttribute("user", userService.get(user.getId()));
		return "user/account";
	}

	@ResponseBody
	@RequestMapping("/u/user/binder")
	public String binderAccount(@ModelAttribute("user") User user, @RequestParam(value = "newPwd", required = false) String newPwd,
			@RequestParam(value = "verCode", required = false) String verCode) {
		int code = 0;
		String msg = null;
		// 绑定账号相关
		String account = "";
		if (StringUtils.isNotBlank(user.getPhone())) {
			account = user.getPhone();
		}
		if (StringUtils.isNotBlank(user.getEmail())) {
			account = user.getEmail();
		}
		int flag = verificationCodeService.compareCode(account, verCode);
		if (flag != 1) {
			code = 10;// 验证码出错
		} else {
			userService.update(user);
		}
		return JSON.toJSONString(ResponseResult.result(code, msg));

	}

	@RequestMapping("/u/user/update")
	String update(@ModelAttribute("user") User user, @RequestParam(value = "newPwd", required = false) String newPwd, HttpServletResponse response,
			ModelMap modelMap) {
		//新判断密码长度
		if(StringUtils.isBlank(newPwd)||newPwd.length()>16||newPwd.length()<6){
			modelMap.addAttribute("flag", "pwderror");
			modelMap.addAttribute("user", userService.get(user.getId()));
			return "user/updatePwd";
		}
		// 说明是密码发生修改操作
		User oldUser = userService.get(user.getId());// 当前登陆用户ID
		String md5pwd = Md5Util.encode(Md5Util.encode(user.getUserPwd() + oldUser.getSalt()));
		if (oldUser.getUserPwd().equals(md5pwd)) {
			User newUser = new User();
			newUser.setUserPwd(Md5Util.encode(Md5Util.encode(newPwd + oldUser.getSalt())));
			newUser.setId(user.getId());
			userService.update(newUser);
			Subject subject = SecurityUtils.getSubject();
			if (subject.isAuthenticated()) {
				subject.logout();
			}
			return "redirect:http://login.ibaixiong.com/logout?service=http://login.ibaixiong.com/login";
		}
		modelMap.addAttribute("flag", "error");
		modelMap.addAttribute("user", userService.get(user.getId()));
		return "user/updatePwd";
	}

	@ResponseBody
	@RequestMapping("/u/user/sendVer")
	String sendVer(@ModelAttribute("user") User user, HttpServletRequest request, HttpServletResponse response) {
		int code = 0;
		String msg = null;
		// 发送验证码
		// 手机发送种类
		String account = "";
		if (StringUtils.isNotBlank(user.getPhone())) {
			account = user.getPhone();
		}
		if (StringUtils.isNotBlank(user.getEmail())) {
			account = user.getEmail();
		}
		verificationCodeService.send(account, request);
		return JSON.toJSONString(ResponseResult.result(code, msg));
	}

	/**
	 * 问题反馈
	 * 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/u/user/question")
	public String questionSubmit(@ModelAttribute("question") CcmQuestion question) {

		question.setUserId(getUser().getId());
		int code = 0;
		String msg = null;
		try {
			int flag = ccmQuestionService.save(question);
			if (flag > 0) {
				code = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return JSON.toJSONString(ResponseResult.result(code, msg));
	}

	@ResponseBody
	@RequestMapping("/u/user/info")
	public String getUserInfo(HttpServletRequest request) {
		boolean loginstatus = false;
		String name = null;
		Response response = new Response();
		User user = getUser();
		Map<String, Object> map = new HashMap<String, Object>();
		if (user != null) {
			loginstatus = true;
			if (user.getNickName() != null && StringUtils.isNotBlank(user.getNickName())) {
				name = user.getNickName();
			} else {
				name = user.getBxNum();
			}
			// 查询代理商，4s店的角色
			List<String> names = userService.queryRoleNames(user.getId());
			if (names != null && names.size() > 0) {
				String s = names.toString();
				if (s.indexOf("4s店") > -1) {
					// 在去验证4s信息表中是否有记录存在
					SsssInfo ssssinfo = ssssInfoService.getByUserId(user.getId());
					if (ssssinfo != null) {
						map.put("ssssTag", 1);
					}
				}
				if (s.indexOf("代理商") > -1) {
					SsssCityMerchant ssssCityMerchant = ssssCityMerchantService.getByUserId(user.getId());
					if (ssssCityMerchant != null) {
						map.put("merchantTag", 1);
					}
				}
			}
		}
		map.put("loginstatus", loginstatus);
		map.put("name", name);
		response.setMessage("success");
		response.setResult(map);
		String jsonpCallback = request.getParameter("jsonpCallback");// ajax客户端请求参数
		return jsonpCallback + "(" + JSON.toJSONString(response) + ")";

	}
}
