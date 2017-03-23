package com.ibaixiong.mall.service;

import java.util.List;

import com.ibaixiong.entity.SsssInvitationCode;
import com.ibaixiong.entity.User;

public interface SsssInvitationCodeService {

	/**
	 * 
	 * @param phone
	 * @param idList
	 * @return
	 */
	List<SsssInvitationCode> queryInviteCodeByMobileAndProductId(String phone,List<Long> idList);
	
	/**
	 * 根据手机号码查询邀请码订单
	 * @param user
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	List<SsssInvitationCode> queryInviteCodeByPhone(User user, int pageNo, int pageSize);
}
