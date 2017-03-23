package com.ibaixiong.mall.dao;

import java.util.List;

import com.ibaixiong.entity.SsssInvitationCodeProduct;

public interface SsssInvitationCodeProductDao {	
	List<SsssInvitationCodeProduct> selectByInvitationCodeId(Long invitationCodeId);

}