package com.deppon.dop.module.sdk.shared.util;

import java.io.IOException;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

/**
 * @description 德邦物流工具类
 * @author chenzehe
 * @email hljuczh@163.com
 * @create 2015年10月29日-下午7:29:41
 */
public class DepponUtils {
	public static String TRACKDPORDERURL = "http://api.deppon.com/dop/order/traceOrder.action";// 追踪物流订单
//	public static String TRACKDPORDERURL = "http://58.40.17.67/dop/order/traceOrder.action";// 追踪物流订单
	public static String COMPANYCODE = "HZBXKJ";
	public static String APPKEY = "1d2b09d2e4b9ca2a082d59724fb553b0";
	public static String SIGN = "HZBX";

	/**
	 * @Description 摘要验证加密方式,先MD5加密后Base64加密
	 * @param plainText
	 * @return String
	 */
	public static String getDigest(String plainText) {
		return Base64.encodeBase64String(DigestUtils.md5Hex(plainText).getBytes());
	}

	/**
	 * @Description 时间戳生成方式
	 * @return String
	 */
	public static String getTimestamp() {
		return String.valueOf(System.currentTimeMillis());
	}

	/**
	 * HTTP的RequestBody方式请求
	 */
	public static final String sendRequest(String url, NameValuePair[] paramsList, String encoding, int timeout) throws IOException {

		if (null == url || "".equals(url)) {
			throw new NullPointerException("url empty");
		}
		if (null == paramsList) {
			throw new NullPointerException("paramsList empty");
		}
		if (null == encoding || "".equals(encoding)) {
			encoding = "UTF-8";
		}
		if (timeout <= 0) {
			timeout = 5000;
		}
		// 设置PostMethod
		PostMethod postMethod = new PostMethod(url);
		postMethod.getParams().setContentCharset(encoding);
		postMethod.getParams().setHttpElementCharset(encoding);

		// 设置body
		postMethod.setRequestBody(paramsList);

		// http client 参数设置 连接超时 读取数据超时
		HttpClient httpClient = new HttpClient();
		httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(timeout);
		httpClient.getHttpConnectionManager().getParams().setSoTimeout(timeout);

		try {
			httpClient.executeMethod(postMethod);
			if (postMethod.getStatusCode() == HttpStatus.SC_OK) {
				return postMethod.getResponseBodyAsString();
			}
			throw new IllegalStateException("sendRequest remote error");
		} finally {
			postMethod.releaseConnection();
		}
	}
}
