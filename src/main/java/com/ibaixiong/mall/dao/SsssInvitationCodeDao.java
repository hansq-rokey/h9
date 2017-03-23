package com.ibaixiong.mall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ibaixiong.entity.SsssInvitationCode;

public interface SsssInvitationCodeDao {
	int deleteByPrimaryKey(Long id);

	int insert(SsssInvitationCode record);

	int insertSelective(SsssInvitationCode record);

	SsssInvitationCode selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(SsssInvitationCode record);

	int updateByPrimaryKey(SsssInvitationCode record);

	/**
	 * 
	 * @param map
	 * @return
	 */
	List<SsssInvitationCode> queryInviteCodeByMobileAndProductId(Map<String, Object> map);

	/**
	 * 
	 * @param productId
	 *            产品ID
	 * @param status
	 *            状态
	 * @param id
	 *            邀请码ID
	 * @param phone
	 *            手机号码
	 * @return
	 */
	SsssInvitationCode getInviteCodeByMobileAndProductId(@Param("productId") Long productId, @Param("status") Byte status, @Param("id") Long id,
			@Param("phone") String phone);
	
	SsssInvitationCode getSsssInvitationCode(Map<String, Object> map);
	/**
	 * 根据订单编码查询列表
	 * @author zhaolei
	 * @date 2016年1月22日
	 * @param orderNumber
	 * @return
	 */
	List<SsssInvitationCode> getListByOrderNumber(@Param("orderNumber") String orderNumber);
	
	List<SsssInvitationCode> queryInviteCodeByPhone(String phone);
}
