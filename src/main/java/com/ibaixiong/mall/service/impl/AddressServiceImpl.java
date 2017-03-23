package com.ibaixiong.mall.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ibaixiong.entity.MallAddress;
import com.ibaixiong.entity.User;
import com.ibaixiong.mall.service.AddressService;

/**
 * Created by lijihuai on 2015/8/24.
 */
@Service
class AddressServiceImpl extends AbstractServiceImpl implements AddressService {

	@Override
	public Long add(MallAddress address) {
		addressDao.insertSelective(address);
		return address.getId();
	}

	@Override
	public int update(MallAddress address) {
		return addressDao.updateByPrimaryKeySelective(address);
	}

	@Override
	public int remove(MallAddress address) {
		return addressDao.deleteByPrimaryKey(address.getId());
	}
	
	@Override
	public int setDefUpdate(MallAddress address) {
		//先更新所有的地址不为选中状态
		addressDao.setNotDefUpdate(address);
		if(address.getIsDefault().intValue()==1){
			addressDao.setDefUpdate(address);
		}
		return 0;
	}
	@Override
	public List<MallAddress> getList(User user) {
		return addressDao.queryAddressList(user.getId(), (byte)1);
	}
}
