package com.ibaixiong.mall.service;

import com.ibaixiong.entity.SsssInfo;

public interface SsssInfoService {
	SsssInfo getByUserId(Long userId);

	int reduceMoney(Long ssssId, Float money);
}
