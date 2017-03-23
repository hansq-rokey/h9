/*
 * baixiong.com Inc.
 * Copyright (c) 1999-2001 All Rights Reserved.
 */
package com.ibaixiong.mall.model;


/**
 * 
 * @author yaoweiguo
 * @Email  yaoweiguo@ibaixiong.com
 * @Description TODO
 * @date 2015年7月17日
 *
 */
public class PropertyConfig {

	private String emailHost;

	private String emailPort;

	private String emailUsername;

	private String emailPassword;
	
	
	//手机验证码发送配置
	private String sOpenUrl;
	private String sDataUrl;
	//接口账号
	private String account;
	//接口秘钥
	private String authkey;
	//通道组编号
	private int cgid;
	//签名编号
	private int csid;
			
			
	public String getEmailHost() {
		return emailHost;
	}

	public String getEmailPort() {
		return emailPort;
	}

	public String getEmailUsername() {
		return emailUsername;
	}

	public String getEmailPassword() {
		return emailPassword;
	}

	public void setEmailHost(String emailHost) {
		this.emailHost = emailHost;
	}

	public void setEmailPort(String emailPort) {
		this.emailPort = emailPort;
	}

	public void setEmailUsername(String emailUsername) {
		this.emailUsername = emailUsername;
	}

	public void setEmailPassword(String emailPassword) {
		this.emailPassword = emailPassword;
	}

	public String getsOpenUrl() {
		return sOpenUrl;
	}

	public void setsOpenUrl(String sOpenUrl) {
		this.sOpenUrl = sOpenUrl;
	}

	public String getsDataUrl() {
		return sDataUrl;
	}

	public void setsDataUrl(String sDataUrl) {
		this.sDataUrl = sDataUrl;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getAuthkey() {
		return authkey;
	}

	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}

	public int getCgid() {
		return cgid;
	}

	public void setCgid(int cgid) {
		this.cgid = cgid;
	}

	public int getCsid() {
		return csid;
	}

	public void setCsid(int csid) {
		this.csid = csid;
	}

}
