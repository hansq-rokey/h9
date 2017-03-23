package com.ibaixiong.mall.service;

import java.util.List;

import com.ibaixiong.entity.ErpBom;
import com.papabear.order.entity.MallCarItem;

public interface ErpBomService {

	List<ErpBom> getListByOrderNumber(String orderNumber);
	
	/**
	 * 目前只有在发热墙布下才有计算清单，
	 * 虚拟获取bom清单列表
	 * 
	 * @param formatId
	 * @param wallArea
	 * @param groundArea
	 * @return
	 */
	List<ErpBom> virtualList(Long formatId,float wallArea,float groundArea);
	
	/**
	 * 购物车中
	 * @param formatId
	 * @param wallArea
	 * @param groundArea
	 * @return
	 */
	List<ErpBom> virtualCatList(List<MallCarItem> carItems);
}
