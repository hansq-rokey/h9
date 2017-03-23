package com.ibaixiong.mall.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.URIException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.ibaixiong.entity.MallOrderLogistics;
import com.ibaixiong.mall.dao.MallOrderLogisticsDao;
import com.ibaixiong.mall.service.MallOrderLogisticsService;

@Service
class MallOrderLogisticsServiceImpl implements MallOrderLogisticsService {
	@Resource
	private MallOrderLogisticsDao mallOrderLogisticsDao;
	final String companyCode = "HZBXKJ";
	final String appkey = "1d2b09d2e4b9ca2a082d59724fb553b0";
	// final String
	// trackDPorderUrl="http://58.40.17.67/dop/order/traceOrder.action";//追踪物流订单
	final String trackDPorderUrl = "http://api.deppon.com/dop/order/traceOrder.action";// 追踪物流订单

	@Override
	public String queryLogisticsTraceByOrderNumber(String orderNumber) {
		MallOrderLogistics logistics = mallOrderLogisticsDao
				.getMallOrderLogisticsByOrderNumber(orderNumber);

		Map<String, Object> map = new HashMap<String, Object>();
		if (logistics == null) {

			map.put("code", "0");
			map.put("message", "没有找到物流信息");
			return JSON.toJSONString(map);
		}
		return this.doGet("http://appserver.ibaixiong.com/mall/order/logistics.html?logisticsId="
						+ logistics.getId());
	}

	/**
	 * 执行一个HTTP GET请求，返回请求响应的HTML
	 *
	 * @param url
	 *            请求的URL地址
	 * @param queryString
	 *            请求的查询参数,可以为null
	 * @param charset
	 *            字符集
	 * @return 返回请求响应的HTML
	 */
	public String doGet(String url) {
		StringBuffer response = new StringBuffer();
		HttpClient client = new HttpClient();
		HttpMethod method = new GetMethod(url);
		try {
			// if (StringUtils.isNotBlank(queryString))
			// 对get请求参数做了http请求默认编码，好像没有任何问题，汉字编码后，就成为%式样的字符串
			// method.setQueryString(URIUtil.encodeQuery(queryString));
			client.executeMethod(method);
			if (method.getStatusCode() == HttpStatus.SC_OK) {
				BufferedReader reader = new BufferedReader(
						new InputStreamReader(method.getResponseBodyAsStream(),
								"UTF-8"));
				String line;
				StringBuffer sb = new StringBuffer();
				while ((line = reader.readLine()) != null) {
					sb.append(line);
				}
				reader.close();
				return sb.toString();
			}
		} catch (URIException e) {

		} catch (IOException e) {

		} finally {
			method.releaseConnection();
		}
		return response.toString();
	}
	@Override
	public MallOrderLogistics getMallOrderLogistics(String orderNumber) {
		return mallOrderLogisticsDao.getMallOrderLogisticsByOrderNumber(orderNumber);
	}
}
