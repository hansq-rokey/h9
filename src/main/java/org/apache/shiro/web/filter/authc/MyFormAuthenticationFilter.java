package org.apache.shiro.web.filter.authc;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MyFormAuthenticationFilter extends FormAuthenticationFilter {

	private static final Logger log = LoggerFactory.getLogger(MyFormAuthenticationFilter.class);

	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
		if (isLoginRequest(request, response)) {
			if (isLoginSubmission(request, response)) {
				if (log.isTraceEnabled()) {
					log.trace("Login submission detected.  Attempting to execute login.");
				}
				return executeLogin(request, response);
			} else {
				if (log.isTraceEnabled()) {
					log.trace("Login page view.");
				}
				// allow them to see the login page ;)
				return true;
			}
		} else {
			if (log.isTraceEnabled()) {
				log.trace("Attempting to access a path which requires authentication.  Forwarding to the " + "Authentication url [" + getLoginUrl()
						+ "]");
			}
				
			saveRequestAndRedirectToLogin(request, response);
			
			return false;
		}
	}
	
	@Override
	protected void saveRequestAndRedirectToLogin(ServletRequest request, ServletResponse response) throws IOException {
		HttpServletRequest req = WebUtils.toHttp(request);
		String jsonpCallback = req.getParameter("jsonpCallback");// 客户端请求参数
		String uri=req.getRequestURI();
		if (uri.indexOf("/user/info")<0){
			saveRequest(request);
		}
        redirectToLogin(request, response);
	}
	
	@Override
	protected void redirectToLogin(ServletRequest request, ServletResponse response) throws IOException {
		
		String loginUrl = getLoginUrl();
		HttpServletRequest req = WebUtils.toHttp(request);
		String jsonpCallback = req.getParameter("jsonpCallback");// 客户端请求参数
		log.debug("jsonpCallback="+jsonpCallback);
		Map<String,String> queryParams=null;
		if (StringUtils.isNotBlank(jsonpCallback)){
			queryParams=new HashMap<String,String>();
			queryParams.put("jsonpCallback", jsonpCallback);
		}
		WebUtils.issueRedirect(request, response, loginUrl, queryParams);
	}
}
