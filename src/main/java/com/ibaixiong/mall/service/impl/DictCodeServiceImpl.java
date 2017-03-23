package com.ibaixiong.mall.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibaixiong.mall.dao.DictCodeDao;
import com.ibaixiong.mall.model.DictCode;
import com.ibaixiong.mall.model.DictTypeEnum;
import com.ibaixiong.mall.service.DictCodeService;
import com.papabear.commons.redis.RedisObjectUtils;

@Service
public class DictCodeServiceImpl implements DictCodeService {

	@Resource
	private DictCodeDao codeDao;
	@Resource
	RedisObjectUtils redisObjectUtils;
	
	@Override
	public List<DictCode> queryDictCodeList(DictTypeEnum dictType, Byte type) {
		Map<String, Object> map=new HashMap<String, Object>();
		List<DictCode> value=redisObjectUtils.getDictCode(dictType.getDictType()+type);
		if(value==null||value.size()==0){
			map.put("dictType", dictType.getDictType());
			map.put("type", type);
			map.put("isDisplay", true);
			value= codeDao.queryDictCodeList(map);
			redisObjectUtils.saveOrUpdateDictCode(dictType.getDictType()+type, value);
		}
		return value;
	}

	@Override
	public List<DictCode> queryDictCodeList(Byte type) {

		return queryDictCodeList(null, type);
	}

	@Override
	public List<DictCode> queryDictCodeList() {

		return queryDictCodeList(null, null);
	}

	@Override
	public List<DictCode> queryDictCodeList(DictTypeEnum dictType) {

		return queryDictCodeList(dictType, null);
	}

	@Override
	public DictCode getByDictTypeAndValue(String dictType, String dictTypeValue) {
		
		return codeDao.getByDictTypeAndValue(dictType, dictTypeValue);
	}
	
}
