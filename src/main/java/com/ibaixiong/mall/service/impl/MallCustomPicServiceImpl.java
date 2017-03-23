package com.ibaixiong.mall.service.impl;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.aliyun.oss.ClientException;
import com.aliyun.oss.OSSException;
import com.ibaixiong.constant.InvalidEnum;
import com.ibaixiong.core.utils.ALiYunUtil;
import com.ibaixiong.entity.MallCustomPic;
import com.ibaixiong.entity.User;
import com.ibaixiong.mall.dao.MallCustomPicDao;
import com.ibaixiong.mall.service.MallCustomPicService;
import com.ibaixiong.mall.util.ImgCutUtil;
import com.ibaixiong.mall.util.Response;

@Service
class MallCustomPicServiceImpl extends AbstractServiceImpl implements MallCustomPicService {
	private Logger logger=LoggerFactory.getLogger(getClass());
	
	@Resource
	private MallCustomPicDao customPicDao;

	@Override
	public MallCustomPic upload(MultipartFile file, MallCustomPic pic, Long formatId) {
		pic.setCreateDateTime(new Date());
		pic.setInvalid(InvalidEnum.FALSE.getInvalidValue());
		pic.setModelFormatId(formatId);
		pic.setSize((int) file.getSize());
		pic.setStatus((byte) 1);
		pic.setUpdateTime(new Date());
		pic.setType((byte) 1);// 原图
		String original = file.getOriginalFilename();
		String picName = ALiYunUtil.MALL_PATH_START + ALiYunUtil.converUserIdTo4(pic.getUserId()) + ALiYunUtil.getCode();
		pic.setPicName(picName);
		String suffx = original.substring(original.lastIndexOf(".") + 1, original.length());
		pic.setPicSuffx(suffx.toLowerCase());
		String key = ALiYunUtil.MALL_PATH + ALiYunUtil.SEPARATOR + ALiYunUtil.createYearMonthPath() + ALiYunUtil.SEPARATOR + picName + "." + suffx;
		pic.setPath(key);
		try {
			ALiYunUtil.uploadFile(key, file);
			pic.setUrl(ALiYunUtil.IMAGE_URL + key);
		} catch (OSSException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		} catch (ClientException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		customPicDao.insert(pic);
		return pic;
	}

	@Override
	public MallCustomPic getmCustomPic(Long id) {

		return customPicDao.selectByPrimaryKey(id);
	}

	@Override
	public Response uploadCutImage(User user, Long id, int x, int y, int width, int height, int degree) throws IOException {
		Response respone = new Response();
		MallCustomPic oldPic = customPicDao.selectByPrimaryKey(id);
		if (oldPic == null || oldPic.getUserId().longValue() != user.getId().longValue()) {
			respone.setSuccess(Boolean.FALSE);
			respone.setMessage("不允许操作该图片");
			return respone;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		String suffx = oldPic.getPicSuffx();
		ByteArrayOutputStream out = null;

		InputStream inputStream = ALiYunUtil.downloadFile(ALiYunUtil.BUCKET_NAME, oldPic.getPath());
		// 图片旋转
		if (degree != 0) {
			BufferedImage image = ImageIO.read(inputStream);
			inputStream=ImgCutUtil.rotateImg(image, degree, null);
		}
		out = ImgCutUtil.cut(inputStream, x, y, width, height, suffx);
		logger.debug("x:"+x);
		logger.debug("y:"+y);
		logger.debug("w:"+width);
		logger.debug("h:"+height);
		InputStream input = new ByteArrayInputStream(out.toByteArray());
		String picName = oldPic.getPicName() + "-1";// 用户裁剪后的图片
		String key = ALiYunUtil.MALL_PATH + ALiYunUtil.SEPARATOR + ALiYunUtil.createYearMonthPath() + ALiYunUtil.SEPARATOR + picName + "." + suffx;

		ALiYunUtil.uploadFile(ALiYunUtil.BUCKET_NAME, key, input, out.size());

		MallCustomPic pic = customPicDao.getmalCustomPic(user.getId(), picName);
		if (pic == null) {
			pic = new MallCustomPic();
			pic.setPicName(picName);
			pic.setPicSuffx(suffx);
			pic.setUrl(ALiYunUtil.IMAGE_URL + key);
			pic.setPath(key);
			pic.setWidth(width);
			pic.setHeigth((float) height);
			pic.setUserId(user.getId());
			pic.setType((byte) 2);// 用户处理后的图片

			pic.setCreateDateTime(new Date());
			pic.setInvalid(InvalidEnum.FALSE.getInvalidValue());
			pic.setModelFormatId(oldPic.getModelFormatId());
			pic.setSize(out.size());
			pic.setStatus((byte) 1);
			pic.setUpdateTime(new Date());
			customPicDao.insert(pic);
		} else {
			pic.setUrl(ALiYunUtil.IMAGE_URL + key);
			pic.setUpdateTime(new Date());
			pic.setPath(key);
			pic.setWidth(width);
			pic.setHeigth((float) height);
			pic.setSize(out.size());
		}

		map.put("url", pic.getUrl());
		map.put("width", width);
		map.put("heigth", height);
		map.put("id", pic.getId());
		map.put("name", pic.getPicName());

		respone.setResult(map);
		respone.setMessage("成功");
		return respone;
	}

	@Override
	public int updateByPrimaryKeySelective(MallCustomPic mallCustomPic) {
		
		return customPicDao.updateByPrimaryKeySelective(mallCustomPic);
	}

	@Override
	public List<MallCustomPic> queryByOrderNumber(String orderNumber) {
		
		return customPicDao.queryByOrderNumber(orderNumber);
	}
}
