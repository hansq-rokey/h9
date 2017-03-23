package com.ibaixiong.mall.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibaixiong.entity.User;
import com.ibaixiong.mall.model.MallAfterSalesServiceExt;
import com.ibaixiong.mall.model.MallAfterSalesServiceItemExt;
import com.ibaixiong.mall.service.MallAfterSalesServiceService;
import com.papabear.commons.entity.Pager;
import com.papabear.order.api.AfterSaleService;
import com.papabear.order.entity.MallAfterSalesService;
import com.papabear.order.entity.MallAfterSalesServiceItem;
import com.papabear.product.api.CategoryQueryService;
import com.papabear.product.api.ProductQueryService;

@Service
public class MallAfterSalesServiceServiceImpl implements MallAfterSalesServiceService {
	@Resource
	private AfterSaleService afterSaleService;
	@Resource
	private ProductQueryService productQueryService;
	@Resource
	private CategoryQueryService categoryQueryService;

	@Override
	public Pager<MallAfterSalesServiceExt> queryMallAfterSalesServices(User user, Byte serviceType, int pageNo, int pageSize) {
		Pager<MallAfterSalesService> pager = afterSaleService.queryAfterSalesServiceByServiceType(user.getId(),
				serviceType, pageNo, pageSize);
		Pager<MallAfterSalesServiceExt> pagerService=new Pager<MallAfterSalesServiceExt>(pager.getTotal(),pager.getPageNumber(),pager.getPageSize());
		List<MallAfterSalesServiceExt> list=new ArrayList<MallAfterSalesServiceExt>();
		for(MallAfterSalesService service:pager.getList()){
			MallAfterSalesServiceExt serviceExt=new MallAfterSalesServiceExt();
			serviceExt.setAfterSalesService(service);
			
			List<MallAfterSalesServiceItem> itemList=afterSaleService.queryAfterSalesServiceItems(service.getId());
			List<MallAfterSalesServiceItemExt> serviceItemList=new ArrayList<MallAfterSalesServiceItemExt>();
			for(MallAfterSalesServiceItem item:itemList){
				MallAfterSalesServiceItemExt itemExt=new MallAfterSalesServiceItemExt();
				itemExt.setServiceItem(item);
				Map<String, Object>map=new HashMap<String, Object>();
				map.put("productId", item.getProductId());
				map.put("formatId", item.getProductModelFormatId());
				itemExt.setPics(productQueryService.queryProductPicByFormatId(map));
				itemExt.setFormat(categoryQueryService.getCategoryModelFormat(item.getProductModelFormatId()));
				serviceItemList.add(itemExt);
			}
			serviceExt.setAfterSalesServiceItems(serviceItemList);
			list.add(serviceExt);
		}
		pagerService.setList(list);
		return pagerService;
	}

}
