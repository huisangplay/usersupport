package com.comac.usersupport_web.login;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

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

@Configuration
@ConfigurationProperties(prefix = "comac.login.filter")
public class LoginConfig {

	private boolean enable = false;
	private Authentication authentication;
	private Validation validation;

	public Authentication getAuthentication() {
		return authentication;
	}

	public void setAuthentication(Authentication authentication) {
		this.authentication = authentication;
	}

	public Validation getValidation() {
		return validation;
	}

	public void setValidation(Validation validation) {
		this.validation = validation;
	}

	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
	}

	// IscSSOAuthenticationFilter
	public static class Authentication {
		private String serverLoginUrl;
		private String serverName;
		private String serverLogoutUrl;

		public String getServerLoginUrl() {
			return serverLoginUrl;
		}

		public void setServerLoginUrl(String serverLoginUrl) {
			this.serverLoginUrl = serverLoginUrl;
		}

		public String getServerName() {
			return serverName;
		}

		public void setServerName(String serverName) {
			this.serverName = serverName;
		}

		public String getServerLogoutUrl() {
			return serverLogoutUrl;
		}

		public void setServerLogoutUrl(String serverLogoutUrl) {
			this.serverLogoutUrl = serverLogoutUrl;
		}
	}

	// validation
	public static class Validation {
		private String serverUrlPrefix;
		private String serverName;

		public String getServerUrlPrefix() {
			return serverUrlPrefix;
		}

		public void setServerUrlPrefix(String serverUrlPrefix) {
			this.serverUrlPrefix = serverUrlPrefix;
		}

		public String getServerName() {
			return serverName;
		}

		public void setServerName(String serverName) {
			this.serverName = serverName;
		}
	}
}
