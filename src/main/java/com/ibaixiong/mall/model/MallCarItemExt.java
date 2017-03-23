package com.ibaixiong.mall.model;

import java.io.Serializable;
import java.util.List;

import com.ibaixiong.entity.SsssInvitationCode;
import com.papabear.order.entity.MallCarItem;
import com.papabear.order.entity.MallCarItemExtend;
import com.papabear.product.entity.MallBasicCategoryModelFormat;
import com.papabear.product.entity.MallProduct;

public class MallCarItemExt implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4648150423411150838L;
	private MallCarItem carItem;
	//查询用，与数据库没有关联
    private MallBasicCategoryModelFormat format;
    //查询用，与数据库没有关联，
	private MallProduct product;
	//数据库没有关联，购物车每个item的邀请码集合
	private List<SsssInvitationCode> invitationCodes;
	
	private MallCarItemExtend carItemExtend;
	
	//邀请码ID，购物车下单时使用
	private Long inviteCodeId;
	
    private Long productModelFormatId;
    
	public MallCarItem getCarItem() {
		return carItem;
	}
	public void setCarItem(MallCarItem carItem) {
		this.carItem = carItem;
	}
	public MallBasicCategoryModelFormat getFormat() {
		return format;
	}
	public void setFormat(MallBasicCategoryModelFormat format) {
		this.format = format;
	}
	public MallProduct getProduct() {
		return product;
	}
	public void setProduct(MallProduct product) {
		this.product = product;
	}
	public List<SsssInvitationCode> getInvitationCodes() {
		return invitationCodes;
	}
	public void setInvitationCodes(List<SsssInvitationCode> invitationCodes) {
		this.invitationCodes = invitationCodes;
	}
	public Long getInviteCodeId() {
		return inviteCodeId;
	}
	public void setInviteCodeId(Long inviteCodeId) {
		this.inviteCodeId = inviteCodeId;
	}
	public Long getProductModelFormatId() {
		return productModelFormatId;
	}
	public void setProductModelFormatId(Long productModelFormatId) {
		this.productModelFormatId = productModelFormatId;
	}
	public MallCarItemExtend getCarItemExtend() {
		return carItemExtend;
	}
	public void setCarItemExtend(MallCarItemExtend carItemExtend) {
		this.carItemExtend = carItemExtend;
	}
}
