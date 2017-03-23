package com.ibaixiong.mall.realm;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cas.CasAuthenticationException;
import org.apache.shiro.cas.CasRealm;
import org.apache.shiro.cas.CasToken;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.util.StringUtils;
import org.jasig.cas.client.authentication.AttributePrincipal;
import org.jasig.cas.client.validation.Assertion;
import org.jasig.cas.client.validation.TicketValidationException;
import org.jasig.cas.client.validation.TicketValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.ibaixiong.entity.User;
import com.ibaixiong.mall.service.UserService;

public class MyCasRealm extends CasRealm {

	private static Logger log = LoggerFactory.getLogger(MyCasRealm.class);
	@Autowired
	private UserService userService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

		// // retrieve user information
		SimplePrincipalCollection principalCollection = (SimplePrincipalCollection) principals;
		List<Object> listPrincipals = principalCollection.asList();
		User user=(User) listPrincipals.get(0);
//		Map<String, String> attributes = (Map<String, String>) listPrincipals.get(0);
//		String userId = attributes.get("id");

		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		List<String> rolesList = userService.queryRoles(Long.valueOf(user.getId()));
		List<String> permissionsList = userService.queryPermissions(Long.valueOf(user.getId()));

		authorizationInfo.setRoles(new HashSet<String>(rolesList));

		authorizationInfo.setStringPermissions(new HashSet<String>(permissionsList));
		log.info("用户角色：" + Arrays.toString(rolesList.toArray()));
		log.info("用户权限：" + Arrays.toString(permissionsList.toArray()));
		return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		CasToken casToken = (CasToken) token;
		if (token == null) {
			return null;
		}

		String ticket = (String) casToken.getCredentials();
		if (!StringUtils.hasText(ticket)) {
			return null;
		}

		TicketValidator ticketValidator = ensureTicketValidator();

		try {
			// contact CAS server to validate service ticket
			Assertion casAssertion = ticketValidator.validate(ticket, getCasService());
			// get principal, user id and attributes
			AttributePrincipal casPrincipal = casAssertion.getPrincipal();
			String userId = casPrincipal.getName();
			log.debug("Validate ticket : {} in CAS server : {} to retrieve user : {}", new Object[] { ticket, getCasServerUrlPrefix(), userId });
			casToken.setUserId(userId);
			Map<String, Object> map = casAssertion.getPrincipal().getAttributes();

			User user = new User();
			//weixin登录
			Object openid=map.get("openid");
			if(openid!=null&&org.apache.commons.lang.StringUtils.isNotBlank(openid.toString())){//微信登录
				user.setId(Long.valueOf(map.get("id").toString()));
				user.setPhone(map.get("phone") == null ? null : map.get("phone").toString());
				user.setEmail(map.get("email") == null ? null : map.get("email").toString());
				user.setNickName(map.get("nickname") == null ? null : map.get("nickname").toString());
				user.setBxNum(map.get("bxNum") == null ? null : map.get("bxNum").toString());
				user.setType(map.get("type")==null?0:Byte.parseByte(map.get("type").toString()));
			}else{//账号密码登录
				user.setId(Long.valueOf(map.get("id").toString()));
				user.setPhone(map.get("phone") == null ? null : map.get("phone").toString());
				user.setEmail(map.get("email") == null ? null : map.get("email").toString());
				user.setNickName(map.get("nickName") == null ? null : map.get("nickName").toString());
				user.setBxNum(map.get("bxNum") == null ? null : map.get("bxNum").toString());
				user.setType(map.get("type")==null?0:Byte.parseByte(map.get("type").toString()));
				user.setUserName(userId);
			}
			log.debug("id :" + map.get("id"));

			Map<String, Object> attributes = casPrincipal.getAttributes();
			// refresh authentication token (user id + remember me)
			casToken.setUserId(userId);
			String rememberMeAttributeName = getRememberMeAttributeName();
			String rememberMeStringValue = (String) attributes.get(rememberMeAttributeName);
			boolean isRemembered = rememberMeStringValue != null && Boolean.parseBoolean(rememberMeStringValue);
			if (isRemembered) {
				casToken.setRememberMe(true);
			}
			// create simple authentication info
			// List<Object> principals = CollectionUtils.asList(userId,
			// attributes);
			// PrincipalCollection principalCollection = new
			// SimplePrincipalCollection(principals, getName());
			return new SimpleAuthenticationInfo(user, ticket, getName());
			// return new SimpleAuthenticationInfo(principalCollection, ticket);
		} catch (TicketValidationException e) {
			throw new CasAuthenticationException("Unable to validate ticket [" + ticket + "]", e);
		}
	}
}
