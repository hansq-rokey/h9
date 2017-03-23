package com.ibaixiong.mall.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ibaixiong.entity.SsssCityMerchant;
import com.ibaixiong.entity.SsssInfo;
import com.ibaixiong.entity.SsssInvitationCode;
import com.ibaixiong.entity.SsssOrder;
import com.ibaixiong.mall.dao.MallPayCmbChinaDao;
import com.ibaixiong.mall.dao.SsssCityMerchantDao;
import com.ibaixiong.mall.dao.SsssInfoDao;
import com.ibaixiong.mall.dao.SsssInvitationCodeDao;
import com.ibaixiong.mall.dao.SsssOrderDao;
import com.ibaixiong.mall.exception.PayException;
import com.ibaixiong.mall.service.PayNotifyService;
import com.papabear.order.api.DepositService;
import com.papabear.order.api.OrderService;
import com.papabear.order.entity.MallFrontMoney;
import com.papabear.order.entity.MallOrder;
import com.papabear.order.entity.OrderConstant.OrderStatus;
import com.papabear.pay.api.PayService;
import com.papabear.pay.entity.OrderPayCmbChina;
import com.papabear.pay.entity.PayChannel;

@Service
class PayNotifyServiceImpl extends AbstractServiceImpl implements PayNotifyService {
	@Resource
	MallPayCmbChinaDao mallPayCmbChinaDao;
//	@Resource
//	SsssOrderDao ssssOrderDao;
//	@Resource
//	SsssInfoDao ssssInfoDao;
//	@Resource
//	SsssCityMerchantDao ssssCityMerchantDao;
//	@Resource
//	SsssInvitationCodeDao ssssInvitationCodeDao;
	@Resource
	PayService payService;
	@Resource
	private OrderService orderService;
	@Resource
	private DepositService depositService;

	@Transactional
	@Override
	public void payNotifyWxPay(String orderNumber, String thirdNumber, String ip, Float totalFee, PayChannel payChannel, Map<String, Object> map) {
		MallOrder order = checkOrderFee(orderNumber, totalFee);
		// 支付成功状态码
		orderService.updateOrderStatus(OrderStatus.PAID.getStatus(), orderNumber);
		// 修改支付变化表
		payService.notifyOrderPayWxpay(orderNumber, thirdNumber, totalFee, payChannel, map);
		// 添加支付记录
		orderService.addOrderHistory(orderNumber, order.getUserId(), ip, OrderStatus.PAID.getStatus(), (byte) 1);
//		insert4S(orderNumber);
	}

	@Override
	public void payNotifyAlipay(Map<String, String> params, PayChannel payChannel, String ip) {
		String orderNumber = params.get("out_trade_no");
		float totalFee = Float.valueOf(params.get("total_fee"));
		MallOrder order = checkOrderFee(orderNumber, totalFee);
		// 支付成功状态码
		orderService.updateOrderStatus(OrderStatus.PAID.getStatus(), orderNumber);
		// 修改支付变化表
		payService.notifyOrderPayAlipay(orderNumber, params.get("trade_no"), totalFee, payChannel, params);
		// 添加支付记录
		orderService.addOrderHistory(orderNumber, order.getUserId(), ip, OrderStatus.PAID.getStatus(), (byte) 1);
//		insert4S(orderNumber);
	}

	@Override
	public boolean payNotifyCmbChina(String orderNumber, String ip, OrderPayCmbChina payCmbChina) {
		MallOrder order = checkOrderFee(orderNumber, payCmbChina.getAmount());
		// 支付成功状态码
		orderService.updateOrderStatus(OrderStatus.PAID.getStatus(), orderNumber);
		// 修改支付变化表
		payService.notifyOrderPayCmbChina(orderNumber, payCmbChina.getBankPayNumber(), payCmbChina.getAmount(), payCmbChina);
		// 添加支付记录
		orderService.addOrderHistory(orderNumber, order.getUserId(), ip, OrderStatus.PAID.getStatus(), (byte) 1);
//		insert4S(orderNumber);
		return true;
	}

	
	
	/**************************************定金回调业务处理**********************************/
	
	@Transactional
	@Override
	public void payDepositNotifyWxPay(String orderNumber, String thirdNumber, String ip, Float totalFee, PayChannel payChannel, Map<String, Object> map) {
		MallFrontMoney order = checkDepositFee(orderNumber, totalFee);
		// 支付成功状态码
		depositService.updateDepositStatus(orderNumber,OrderStatus.PAID.getStatus());
		// 修改支付变化表
//		payService.notifyOrderPayWxpay(orderNumber, thirdNumber, totalFee, payChannel, map);
		// 添加支付记录
//		orderService.addOrderHistory(orderNumber, order.getUserId(), ip, OrderStatus.PAID.getStatus(), (byte) 1);
//		insert4S(orderNumber);
	}

	@Override
	public void payDepositNotifyAlipay(Map<String, String> params, PayChannel payChannel, String ip) {
		String orderNumber = params.get("out_trade_no");
		float totalFee = Float.valueOf(params.get("total_fee"));
		MallFrontMoney order = checkDepositFee(orderNumber, totalFee);
		// 支付成功状态码
		depositService.updateDepositStatus(orderNumber, OrderStatus.PAID.getStatus());
		// 修改支付变化表
//		payService.notifyOrderPayAlipay(orderNumber, params.get("trade_no"), totalFee, payChannel, params);
		// 添加支付记录
//		orderService.addOrderHistory(orderNumber, order.getUserId(), ip, OrderStatus.PAID.getStatus(), (byte) 1);
//		insert4S(orderNumber);
	}

	@Override
	public boolean payDepositNotifyCmbChina(String orderNumber, String ip, OrderPayCmbChina payCmbChina) {
		MallFrontMoney order = checkDepositFee(orderNumber, payCmbChina.getAmount());
		// 支付成功状态码
		depositService.updateDepositStatus(orderNumber, OrderStatus.PAID.getStatus());
		// 修改支付变化表
//		payService.notifyOrderPayCmbChina(orderNumber, payCmbChina.getBankPayNumber(), payCmbChina.getAmount(), payCmbChina);
		// 添加支付记录
//		orderService.addOrderHistory(orderNumber, order.getUserId(), ip, OrderStatus.PAID.getStatus(), (byte) 1);
//		insert4S(orderNumber);
		return true;
	}

	
	
	
	
	/**
	 * 校验订单金额和订单状态
	 * 
	 * @param orderNumber
	 * @param totalFee
	 * @return
	 */
	private MallOrder checkOrderFee(String orderNumber, float totalFee) {
		MallOrder order = orderService.getMallOrder(orderNumber);
		if (order == null) {
			throw new PayException("找不到该订单");
		}
		if (order.getShouldPayMoney().floatValue() != totalFee) {
			logger.info("订单金额不符:-----db:" + order.getDiscountPrice() + "-----notify:" + totalFee);
			throw new PayException("订单金额不符");
		}
		return order;
	}
	
	/**
	 * 定金支付校验
	 * @author yaoweiguo
	 * @date 2016年7月25日
	 * @param depositNumber
	 * @param totalFee
	 * @return
	 */
	private MallFrontMoney checkDepositFee(String depositNumber, float totalFee) {
		MallFrontMoney  deposit = depositService.getDeposit(depositNumber);
		if (deposit == null) {
			throw new PayException("找不到该定金单子");
		}
		if (deposit.getFrontMoney().floatValue() != totalFee) {
			logger.info("定金金额不符:-----db:" + deposit.getFrontMoney() + "-----notify:" + totalFee);
			throw new PayException("定金金额不符");
		}
		return deposit;
	}

//	// 调用插入看是否是4S订单
//	private void insert4S(String orderNumber) {
//		List<SsssOrder> list = ssssOrderDao.getOrderByNumber(orderNumber);
//		if (list != null && list.size() > 0) {
//			// 计算插入冻结金额中
//			for (SsssOrder ssssOrder : list) {
//				Long ssssId = ssssOrder.getSsssId();
//				if (ssssId != null && ssssId.intValue() > 0) {
//					// 说明是4s店返利
//					SsssInfo ssssInfo = ssssInfoDao.selectByPrimaryKey(ssssId);
//					ssssInfo.setFreezedMoney(ssssInfo.getFreezedMoney() + ssssOrder.getProfit());
//					ssssInfoDao.updateByPrimaryKeySelective(ssssInfo);
//				}
//				Long merchantId = ssssOrder.getMerchantId();
//				if (merchantId != null && merchantId.intValue() > 0) {
//					// 说明是代理返利
//					SsssCityMerchant ssssCityMerchant = ssssCityMerchantDao.selectByPrimaryKey(merchantId);
//					ssssCityMerchant.setFreezedMoney(ssssCityMerchant.getFreezedMoney() + ssssOrder.getProfit());
//					ssssCityMerchantDao.updateByPrimaryKeySelective(ssssCityMerchant);
//				}
//				// ssssOrder.setStatus(OrderStatusEnum.PAID.getCode());
//				// ssssOrderDao.updateByPrimaryKeySelective(ssssOrder);
//			}
//		}
//		// 修改邀请码字段值
//		List<SsssInvitationCode> listCode = ssssInvitationCodeDao.getListByOrderNumber(orderNumber);
//		if (listCode != null && listCode.size() > 0) {
//			for (SsssInvitationCode ssssInvitationCode : listCode) {
//				// 付款成功修改单据状态
//				if (ssssInvitationCode.getStatus().intValue() == 2) {
//					ssssInvitationCode.setStatus((byte) 3);
//					ssssInvitationCodeDao.updateByPrimaryKeySelective(ssssInvitationCode);
//				}
//			}
//		}
//	}
}
