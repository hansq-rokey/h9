package com.ibaixiong.mall.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ibaixiong.entity.MallCustomPic;
import com.ibaixiong.entity.User;
import com.ibaixiong.mall.util.Response;

public interface MallCustomPicService {
	
	MallCustomPic upload(MultipartFile file,MallCustomPic pic,Long formatId);
	
	MallCustomPic getmCustomPic(Long id);
	
	Response uploadCutImage(User user,Long id,int x,int y,int width,int height,int degree) throws IOException;
	
	int updateByPrimaryKeySelective(MallCustomPic mallCustomPic);
	
	List<MallCustomPic> queryByOrderNumber(String orderNumber);
}
