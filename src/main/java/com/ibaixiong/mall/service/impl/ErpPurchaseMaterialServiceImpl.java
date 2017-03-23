/**
 * ibaixiong.com Inc.
 * Copyright (c) 2015-2016 All Rights Reserved.
 */
package com.ibaixiong.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibaixiong.entity.ErpPurchaseMaterial;
import com.ibaixiong.mall.core.CalculateFactory;
import com.ibaixiong.mall.dao.ErpPurchaseMaterialDao;
import com.ibaixiong.mall.model.MaterialDisplayEnum;
import com.ibaixiong.mall.service.ErpPurchaseMaterialServce;
import com.papabear.commons.redis.RedisObjectUtils;

/**
 * 
 * @author yaoweiguo
 * @email 280435353@qq.com
 * @date 2016年7月20日
 * @since 1.0.0
 */
@Service
public class ErpPurchaseMaterialServiceImpl implements ErpPurchaseMaterialServce {

	@Resource
	ErpPurchaseMaterialDao purchaseMaterialDao;
	@Resource
	RedisObjectUtils redisObjectUtils;

	@Resource
	CalculateFactory calculateFactory;

	@Override
	public float calculatePrice(Long formatId, float wallArea,float groundArea) {

		float price=0;
		List<ErpPurchaseMaterial> list= redisObjectUtils.getMaterials(formatId.toString(),MaterialDisplayEnum.C.getDisplay());
		if(list==null||list.size()==0){
			list = purchaseMaterialDao.queryPurchaseMaterials(formatId);
			redisObjectUtils.saveOrUpdateMaterialS(formatId.toString(),MaterialDisplayEnum.C.getDisplay(), list);
		}

		for (ErpPurchaseMaterial pm : list) {
			price+=pm.getPrice()*calculateModel(pm.getCalculateModel().intValue(), wallArea, groundArea, pm.getCoefficient());
		}
		return price;
	}

	public float calculateModel(int model, float wallArea, float groundArea, float coefficient) {

		if (model == 1) {
			return calculateFactory.getWallPaperArea(wallArea, coefficient);
		} else if (model == 2) {
			return calculateFactory.getHotwallPaperArea(groundArea);
		} else if (model == 3) {
			return calculateFactory.getYellowWallpaperGlueArea(groundArea, coefficient);
		} else if (model == 4) {
			return calculateFactory.getWhiteWallpaperGlueArea(wallArea);
		} else if (model == 5) {
			return calculateFactory.getMicrocontrollersNumber(groundArea);
		} else if (model == 6) {
			return calculateFactory.getTJonLine(groundArea);
		}else if (model == 7) {
			return calculateFactory.getQuickConnector(groundArea);
		}else if (model == 8) {
			return calculateFactory.getOtherMountingsNumber();
		}
		return 1f;
	}

}
