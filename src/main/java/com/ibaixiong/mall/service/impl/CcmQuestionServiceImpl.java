package com.ibaixiong.mall.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibaixiong.entity.CcmQuestion;
import com.ibaixiong.mall.dao.CcmQuestionDao;
import com.ibaixiong.mall.service.CcmQuestionService;

@Service
class CcmQuestionServiceImpl extends AbstractServiceImpl implements CcmQuestionService{
	@Resource
	private CcmQuestionDao ccmQuestionDao;
	@Override
	public int save(CcmQuestion question) {
		question.setCreateDateTime(new Date());
		question.setStatus((byte)1);
		question.setRate((byte)0);
		question.setCcTime(new Date());
		question.setProcessStatus((byte)1);
		return ccmQuestionDao.insertSelective(question);
	}
	
}
