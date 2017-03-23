package com.ibaixiong.mall.dao;

import com.ibaixiong.entity.ErpLogisticsInformation;

public interface ErpLogisticsInformationDao {
    int deleteByPrimaryKey(Long id);

    int insert(ErpLogisticsInformation record);

    int insertSelective(ErpLogisticsInformation record);

    ErpLogisticsInformation selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ErpLogisticsInformation record);

    int updateByPrimaryKey(ErpLogisticsInformation record);
    
    /**
	 * 根据订单号查询信息
	 * @param logisticID
	 * @return
	 */
	ErpLogisticsInformation  getErpLogisticsInformationBylogisticID(String logisticID);
}