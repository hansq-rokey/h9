package com.ibaixiong.mall.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.ibaixiong.core.utils.AccountUtil;
import com.ibaixiong.core.web.RequestUtils;
import com.ibaixiong.entity.VerificationCode;
import com.ibaixiong.mall.model.PropertyConfig;
import com.ibaixiong.mall.service.VerificationCodeService;
import com.shcm.bean.SendResultBean;
import com.shcm.send.DataApi;
import com.shcm.send.OpenApi;
@Service
class VerificationCodeServiceImpl extends AbstractServiceImpl implements VerificationCodeService {
	private PropertyConfig propertyConfig;
	@Override
	public int send(String account, HttpServletRequest request) {
		int flag=AccountUtil.checkAccount(account);
		switch (flag) {
		case 1:
			this.sendMail(account, request);
			break;
		case 2:
			this.sendMobile(account, request);
			break;
		default:
			break;
		}
		return 1;
	}
	@Override
	public int compareCode(String name, String code) {
		// TODO Auto-generated method stub
		return 0;
	}
	private int sendMail(String email, HttpServletRequest request) {
		String code = this.randomNum();
		//Integer icode = Integer.parseInt(code);
		VerificationCode verificationCode = new VerificationCode();
		verificationCode.setCode(code);
		verificationCode.setCreateDateTime(new Date());
		verificationCode.setName(email);
		verificationCode.setRegisterIp(RequestUtils.getIpAddr(request));
		verificationCode.setStatus((byte) 1);
		verificationCode.setUpdateTime(new Date());
		verificationCode.setType((byte) 1);
		verificationCodeDao.insert(verificationCode);
		//boolean flag = mailUtil.send("test", "html", code, email, null, null);
		//System.out.println(flag);
		return 0;
	}
	private int sendMobile(String phone, HttpServletRequest request) {
		String code = this.randomNum();
		//Integer icode = Integer.parseInt(code);
		VerificationCode verificationCode = new VerificationCode();
		verificationCode.setCode(code);
		verificationCode.setCreateDateTime(new Date());
		verificationCode.setName(phone);
		verificationCode.setRegisterIp(RequestUtils.getIpAddr(request));
		verificationCode.setStatus((byte)1);
		verificationCode.setUpdateTime(new Date());
		verificationCode.setType((byte)2);
		verificationCodeDao.insert(verificationCode);
		List<SendResultBean> listItem = sendOnce(phone, "您的验证码是"+code);
		if (listItem != null) {
			for (SendResultBean t : listItem) {

				if (t.getResult() < 1) {
					System.out.println("send mobile is error!");
				}

				System.out.println("发送成功: 消息编号<" + t.getMsgId() + "> 总数<"
						+ t.getTotal() + "> 余额<" + t.getRemain() + ">");
			}
		}
		return 0;
	}
	private String randomNum() {
		String base = "123456789";//生成字符串从此序列中取 
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for(int i = 0;i < 4; i++) {
			int number = random.nextInt(base.length());
			sb.append(base.charAt(number));
		}
		return sb.toString();
		//Random random = new Random();
		//return String.valueOf(random.nextInt(9999));
	}
	public List<SendResultBean> sendOnce(String mobile, String content) {
		// 发送参数
		OpenApi.initialzeAccount(propertyConfig.getsOpenUrl(),
				propertyConfig.getAccount(), propertyConfig.getAuthkey(),
				propertyConfig.getCgid(), propertyConfig.getCsid());

		// 状态及回复参数
		DataApi.initialzeAccount(propertyConfig.getsDataUrl(),
				propertyConfig.getAccount(), propertyConfig.getAuthkey());
		// 发送短信
		List<SendResultBean> listItem = OpenApi.sendOnce(mobile, content, 0, 0,
				null);
		return listItem;
	}
}
