package com.ibaixiong.mall.service;

import javax.servlet.http.HttpServletRequest;

public interface VerificationCodeService {
	/**
	 * 发送验证码
	 * @param account   用户名
	 * @param request
	 * @return
	 */
	 int send(String account, HttpServletRequest request);
	
	/**
	 * 验证码是否相同
	 * @param name 手机号码或邮箱
	 * @param code 验证码
	 * @return -1:没有找到相应记录  
	 * 			-2：验证码为空
	 * 			-3：验证码时间超过1小时
	 * 			-4:验证码输入有误
	 */
	int compareCode(String name, String code);
	
}
