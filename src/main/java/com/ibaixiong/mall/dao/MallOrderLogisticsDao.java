package com.ibaixiong.mall.dao;

import com.ibaixiong.entity.MallOrderLogistics;

public interface MallOrderLogisticsDao extends AbstractEntityDao{

	
    int deleteByPrimaryKey(Long id);

    int insert(MallOrderLogistics record);

    int insertSelective(MallOrderLogistics record);

    MallOrderLogistics selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(MallOrderLogistics record);

    int updateByPrimaryKey(MallOrderLogistics record);
	
	/**
	 * 根据订单号查询信息
	 * @param orderNumber
	 * @return
	 */
	MallOrderLogistics  getMallOrderLogisticsByOrderNumber(String orderNumber);
}
