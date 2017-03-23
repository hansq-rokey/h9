package com.ibaixiong.mall.service;

import com.ibaixiong.entity.SsssCityMerchant;

public interface SsssCityMerchantService {
	SsssCityMerchant getByUserId(Long userId);
	void insert(SsssCityMerchant merchant);
	void update(SsssCityMerchant merchant);
}
