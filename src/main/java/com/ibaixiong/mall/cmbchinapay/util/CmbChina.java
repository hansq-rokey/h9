package com.ibaixiong.mall.cmbchinapay.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @description
 * @author chenzehe
 * @email hljuczh@163.com
 * @create 2015年11月23日-下午4:43:23
 */
@Component
public class CmbChina {
	@Value("${cmbchina.paytype}")
	private String payType;

	@Value("${cmbchina.key}")
	private String key;

	@Value("${cmbchina.branchid}")
	private String branchId;

	@Value("${cmbchina.cono}")
	private String coNo;

	@Value("${cmbchina.merchanturl}")
	private String merchantUrl;

	@Value("${cmbchina.merchantreturl}")
	private String merchantRetUrl;

	@Value("${cmbchina.goodstype}")
	private String goodsType;

	@Value("${cmbchina.payurl}")
	private String payUrl;

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getBranchId() {
		return branchId;
	}

	public void setBranchId(String branchId) {
		this.branchId = branchId;
	}

	public String getCoNo() {
		return coNo;
	}

	public void setCoNo(String coNo) {
		this.coNo = coNo;
	}

	public String getMerchantUrl() {
		return merchantUrl;
	}

	public void setMerchantUrl(String merchantUrl) {
		this.merchantUrl = merchantUrl;
	}

	public String getMerchantRetUrl() {
		return merchantRetUrl;
	}

	public void setMerchantRetUrl(String merchantRetUrl) {
		this.merchantRetUrl = merchantRetUrl;
	}

	public String getGoodsType() {
		return goodsType;
	}

	public void setGoodsType(String goodsType) {
		this.goodsType = goodsType;
	}

	public String getPayUrl() {
		return payUrl;
	}

	public void setPayUrl(String payUrl) {
		this.payUrl = payUrl;
	}

}
