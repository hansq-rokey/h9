package com.ibaixiong.mall.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.ibaixiong.entity.SsssInvitationCode;
import com.ibaixiong.entity.User;
import com.ibaixiong.mall.dao.SsssInvitationCodeDao;
import com.ibaixiong.mall.service.SsssInvitationCodeService;

/**
 * 邀请码
 * @author yaoweiguo
 * @Email  yaoweiguo@ibaixiong.com
 * @Description TODO
 * @date 2015年12月29日
 *
 */
@Service
public class SsssInvitationCodeServiceImpl implements SsssInvitationCodeService {

	@Resource
	private SsssInvitationCodeDao invitationCodeDao;
	
	@Override
	public List<SsssInvitationCode> queryInviteCodeByMobileAndProductId(String phone, List<Long> idList) {
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("phone", phone);
		map.put("ids", idList);
		return invitationCodeDao.queryInviteCodeByMobileAndProductId(map);
	}

	@Override
	public List<SsssInvitationCode> queryInviteCodeByPhone(User user, int pageNo, int pageSize) {
		PageHelper.startPage(pageNo, pageSize, "status asc,valid_time desc");
		return invitationCodeDao.queryInviteCodeByPhone(user.getPhone());
	}

}
