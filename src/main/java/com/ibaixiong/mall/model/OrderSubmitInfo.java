package com.ibaixiong.mall.model;

/**
 * 下订单提交信息bean baixiong.com Inc. Copyright (c) 1999-2001 All Rights Reserved.
 * 
 * @author yaoweiguo
 * @Email yaoweiguo@ibaixiong.com
 * @Description 
 * @date 2015年11月27日
 *
 */
public class OrderSubmitInfo {

	private Long 	formatId;//规格ID，必填
	private Float num;//购买数量，大于等于1
	private String 	remark;//描述
	private Long 	addressId;//收件人ID，必填
	private String 	deliverValue;//发货时间值，参考字典表
	private String deliverTimeName;//发货时间具体时间值
	private Integer isCustomMade;//是否私人地址，默认0
	private Long 	picId;//私人订制用户上传图片返回ID
	private String inviteCodes;//邀请码ID，以,号隔开
	private Long inviteCodeId;//邀请码ID
	private float length;//发热墙纸长度
	private float width;//发热墙纸宽度
	private float height;//发热墙纸高度
	private Integer tag;//标签值，主要用于主卧、次卧等标签
	
	
	public Long getFormatId() {
		return formatId;
	}
	public void setFormatId(Long formatId) {
		this.formatId = formatId;
	}
	public Float getNum() {
		return num;
	}
	public void setNum(Float num) {
		this.num = num;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Long getAddressId() {
		return addressId;
	}
	public void setAddressId(Long addressId) {
		this.addressId = addressId;
	}
	public String getDeliverValue() {
		return deliverValue;
	}
	public void setDeliverValue(String deliverValue) {
		this.deliverValue = deliverValue;
	}
	public Integer getIsCustomMade() {
		return isCustomMade;
	}
	public void setIsCustomMade(Integer isCustomMade) {
		this.isCustomMade = isCustomMade;
	}
	public Long getPicId() {
		return picId;
	}
	public void setPicId(Long picId) {
		this.picId = picId;
	}
	public String getDeliverTimeName() {
		return deliverTimeName;
	}
	public void setDeliverTimeName(String deliverTimeName) {
		this.deliverTimeName = deliverTimeName;
	}
	public String getInviteCodes() {
		return inviteCodes;
	}
	public void setInviteCodes(String inviteCodes) {
		this.inviteCodes = inviteCodes;
	}
	public Long getInviteCodeId() {
		return inviteCodeId;
	}
	public void setInviteCodeId(Long inviteCodeId) {
		this.inviteCodeId = inviteCodeId;
	}
	public float getLength() {
		return length;
	}
	public void setLength(float length) {
		this.length = length;
	}
	public float getWidth() {
		return width;
	}
	public void setWidth(float width) {
		this.width = width;
	}
	public float getHeight() {
		return height;
	}
	public void setHeight(float height) {
		this.height = height;
	}
	public Integer getTag() {
		return tag;
	}
	public void setTag(Integer tag) {
		this.tag = tag;
	}
	
	
}
