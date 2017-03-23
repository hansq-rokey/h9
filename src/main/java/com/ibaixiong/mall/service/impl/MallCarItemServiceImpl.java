package com.ibaixiong.mall.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibaixiong.entity.User;
import com.ibaixiong.mall.model.MallCarItemExt;
import com.ibaixiong.mall.service.MallCarItemService;
import com.papabear.order.api.CarItemService;
import com.papabear.order.entity.MallCarItem;
import com.papabear.order.entity.MallCarItemExtend;
import com.papabear.product.api.CategoryQueryService;
import com.papabear.product.api.ProductQueryService;
import com.papabear.product.entity.MallBasicCategoryModelFormat;
import com.papabear.product.entity.MallProductPic;

/**
 * Created by Administrator on 2015/8/5.
 */
@Service
class MallCarItemServiceImpl implements MallCarItemService {
	@Resource
	private CarItemService carItemService;
	@Resource
	private ProductQueryService productQueryService;
	
	@Resource
	private CategoryQueryService categoryQueryService;
	
	@Override
	public int delete(Long userId, Long carId) {
		
		return carItemService.delete(userId, carId);
	}
	@Override
	public int update(User user, com.papabear.order.entity.MallCarItem carItem) {
		
        return carItemService.update(carItem);
	}

	@Override
	public List<MallCarItem> list(Long userId) {
		List<MallCarItem> list=carItemService.queryCarItemsByUserId(userId);
		return list;
	}

//    @Override
//    public void add(User user, long formatId, int num,long productId) {
//    	carItemService.add(user.getId(), formatId, num, productId);
//    }
	@Override
	public List<MallCarItem> confirm(User user, String carItemIdList,String carItemNumList) {

		List<MallCarItem> carItemList = carItemService.confirm(user.getId(), carItemIdList, carItemNumList);
		return carItemList;
	}
	@Override
	public List<MallCarItemExt> getList(User user) {
		List<MallCarItem> carItemList = carItemService.queryCarItemsByUserId(user.getId());
		List<MallCarItemExt> carItemListRet = new ArrayList<MallCarItemExt>();
		for(MallCarItem car:carItemList){
			MallCarItemExt ext = new MallCarItemExt();
			Map<String, Object>map=new HashMap<String, Object>();
			map.put("productId", car.getProductId());
			map.put("formatId", car.getProductModelFormatId());
			List<MallProductPic> pics=productQueryService.queryProductPicByFormatId(map);
			//查询设置format
			MallBasicCategoryModelFormat format = categoryQueryService.getCategoryModelFormat(car.getProductModelFormatId());
			ext.setFormat(format);
			if(ext.getFormat()!=null)
				ext.getFormat().setPics(pics);
			ext.setCarItem(car);
			if(format.getIsExtProperties()!=null&&format.getIsExtProperties().intValue()==1){
				MallCarItemExtend extend= carItemService.getCarItemExtend(user.getId(), car.getId());
				ext.setCarItemExtend(extend);
			}
			carItemListRet.add(ext);
		}
		return carItemListRet;
	}
}
