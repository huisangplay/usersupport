package com.comac.usersupport_web.login;

import com.sgcc.isc.ualogin.client.filter.*;
import com.sgcc.isc.ualogin.client.listener.IscSingleSignOutHttpSessionListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * brief description
 * <p> Date             :2018/12/5 </p>
 * <p> Module           : </p>
 * <p> Description      : </p>
 * <p> Remark           : </p>
 *
 * @author zhouqi
 * @version 1.0
 */

@Component
@ConditionalOnBean(LoginConfig.class)
public class LoginFilter {

	@Autowired
	private LoginConfig loginConfig;

	private Logger logger = LoggerFactory.getLogger(LoginFilter.class);

	/**
	 * 用于单点登出session监听
	 *
	 * @return the servlet listener registration bean
	 */
	@Bean ServletListenerRegistrationBean<IscSingleSignOutHttpSessionListener> singleSignOutHttpSessionListener() {
		ServletListenerRegistrationBean<IscSingleSignOutHttpSessionListener> listener = new ServletListenerRegistrationBean<>();
		listener.setEnabled(loginConfig.isEnable());
		listener.setListener(new IscSingleSignOutHttpSessionListener());
		listener.setOrder(1);
		return listener;
	}

	/**
	 * 单点登出
	 *
	 * @return the filter registration bean
	 */
	@Bean FilterRegistrationBean signOutFilter() {
		FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();

		IscSingleSignOutFilter iscSingleSignOutFilter = new IscSingleSignOutFilter();
		filterRegistrationBean.setFilter(iscSingleSignOutFilter);

		filterRegistrationBean.setEnabled(loginConfig.isEnable());
		filterRegistrationBean.addUrlPatterns("/*");
		filterRegistrationBean.setOrder(3);
		return filterRegistrationBean;
	}

	/**
	 * CAS授权过滤器
	 * <pre>
	 *     当访问该系统时，如果用户未登录，会自动跳转到serverLoginUrl指定的地址
	 * </pre>
	 * @return the filter registration bean
	 */
	@Bean FilterRegistrationBean authenticationFilter() {
		FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();

		IscSSOAuthenticationFilter iscSSOAuthenticationFilter = new IscSSOAuthenticationFilter();
		filterRegistrationBean.setFilter(iscSSOAuthenticationFilter);

		filterRegistrationBean.setEnabled(loginConfig.isEnable());
		filterRegistrationBean.addUrlPatterns("/*");
		filterRegistrationBean.addInitParameter("serverLoginUrl", loginConfig.getAuthentication().getServerLoginUrl());
		filterRegistrationBean.addInitParameter("serverName", loginConfig.getAuthentication().getServerName());
		filterRegistrationBean.addInitParameter("specialLogin", "true");
		return filterRegistrationBean;
	}

	/**
	 * 负责对Ticket的校验工作
	 *
	 * @return the filter registration bean
	 */
	@Bean FilterRegistrationBean ticketValidationFilter() {
		FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
		IscSSO20ProxyReceivingTicketValidationFilter iscSSO20ProxyReceivingTicketValidationFilter = new IscSSO20ProxyReceivingTicketValidationFilter();
		filterRegistrationBean.setFilter(iscSSO20ProxyReceivingTicketValidationFilter);

		filterRegistrationBean.setEnabled(loginConfig.isEnable());
		filterRegistrationBean.addUrlPatterns("/*");
		filterRegistrationBean.addInitParameter("serverUrlPrefix", loginConfig.getValidation().getServerUrlPrefix());
		filterRegistrationBean.addInitParameter("serverName", loginConfig.getValidation().getServerName());
		filterRegistrationBean.setOrder(5);
		return filterRegistrationBean;
	}

	/**
	 * 该过滤器对HttpServletRequest请求包装， 可通过HttpServletRequest的getRemoteUser()方法获得登录用户的登录名
	 *
	 * @return the filter registration bean
	 */
	@Bean FilterRegistrationBean httpServletRequestWrapperFilter() {
		FilterRegistrationBean filterRegistration = new FilterRegistrationBean();
		filterRegistration.setFilter(new IscSSOHttpServletRequestWrapperFilter());

		filterRegistration.setEnabled(loginConfig.isEnable());
		filterRegistration.addUrlPatterns("/*");
		filterRegistration.setOrder(6);
		return filterRegistration;
	}

	/**
	 *      该过滤器使得可以通过org.jasig.cas.client.util.AssertionHolder来获取用户的登录名。
	 *      比如AssertionHolder.getAssertion().getPrincipal().getName()。
	 *      这个类把Assertion信息放在ThreadLocal变量中，这样应用程序不在web层也能够获取到当前登录信息
	 *
	 * @return the filter registration bean
	 */
	@Bean FilterRegistrationBean assertionThreadLocalFilter() {
		FilterRegistrationBean filterRegistration = new FilterRegistrationBean();
		filterRegistration.setFilter(new IsoSSOAssertionThreadLocalFilter());

		filterRegistration.setEnabled(loginConfig.isEnable());
		filterRegistration.addUrlPatterns("/*");
		filterRegistration.setOrder(7);
		return filterRegistration;
	}
}
