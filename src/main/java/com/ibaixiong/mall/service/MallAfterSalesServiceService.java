package com.ibaixiong.mall.service;

import com.ibaixiong.entity.User;
import com.ibaixiong.mall.model.MallAfterSalesServiceExt;
import com.papabear.commons.entity.Pager;

public interface MallAfterSalesServiceService {    
    /**
     * 获取售后服务列表
     * @param user
     * @param pageNo
     * @param pageSize
     * @return
     */
    Pager<MallAfterSalesServiceExt> queryMallAfterSalesServices(User user,Byte serviceType, int pageNo, int pageSize);
}
