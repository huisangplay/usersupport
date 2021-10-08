/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : cdb-6w9m1r54.cd.tencentcdb.com:10052
 Source Schema         : usersupport

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 21/09/2021 03:45:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for e_dict
-- ----------------------------
DROP TABLE IF EXISTS `e_dict`;
CREATE TABLE `e_dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKf5wwh5osfukkeebw7h2yb4kmp`(`code`) USING BTREE,
  INDEX `FKi8lurtplfsktg01y6uevop5yp`(`create_user_id`) USING BTREE,
  INDEX `FKhxpr89ae0g4rd9xpfgcdjf0sa`(`update_user_id`) USING BTREE,
  CONSTRAINT `FKhxpr89ae0g4rd9xpfgcdjf0sa` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKi8lurtplfsktg01y6uevop5yp` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_dict
-- ----------------------------

-- ----------------------------
-- Table structure for e_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `e_dict_item`;
CREATE TABLE `e_dict_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `erupt_dict_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKl0kiq8otpn3fvtlvarebt8xkh`(`code`, `erupt_dict_id`) USING BTREE,
  INDEX `FKij9x8hwy16dra7d49h483lu2u`(`create_user_id`) USING BTREE,
  INDEX `FKmlg0pjfxwih4i6r0g0iilh1lu`(`update_user_id`) USING BTREE,
  INDEX `FKrrbi2dt94rjd8sjt830m3w0a`(`erupt_dict_id`) USING BTREE,
  CONSTRAINT `FKij9x8hwy16dra7d49h483lu2u` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKmlg0pjfxwih4i6r0g0iilh1lu` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKrrbi2dt94rjd8sjt830m3w0a` FOREIGN KEY (`erupt_dict_id`) REFERENCES `e_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_dict_item
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_login_log
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_login_log`;
CREATE TABLE `e_upms_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `device_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `login_time` datetime NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `system_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `erupt_user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKjqnr9oel32kajm6bpvqwomv6m`(`erupt_user_id`) USING BTREE,
  CONSTRAINT `FKjqnr9oel32kajm6bpvqwomv6m` FOREIGN KEY (`erupt_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_login_log
-- ----------------------------
INSERT INTO `e_upms_login_log` VALUES (1, 'Chrome 9 93', 'Computer', '192.168.124.10', '2021-09-18 21:18:55', '0|0|0|内网IP|内网IP', 'Windows 10', '6bPZT4ix1KCltTmk', 1);
INSERT INTO `e_upms_login_log` VALUES (2, 'Chrome 9 93', 'Computer', '192.168.124.10', '2021-09-20 17:59:34', '0|0|0|内网IP|内网IP', 'Windows 10', '7Sgf4RICCH5vjfAX', 1);
INSERT INTO `e_upms_login_log` VALUES (3, 'Chrome 9 93', 'Computer', '192.168.124.10', '2021-09-20 18:09:48', '0|0|0|内网IP|内网IP', 'Windows 10', 'CpmVHlu6IdJ1YIyZ', 1);
INSERT INTO `e_upms_login_log` VALUES (4, 'Chrome 9 93', 'Computer', '192.168.124.10', '2021-09-20 18:10:57', '0|0|0|内网IP|内网IP', 'Windows 10', 'ugmzsgetiIa4ukQJ', 1);
INSERT INTO `e_upms_login_log` VALUES (5, 'Chrome 9 93', 'Computer', '192.168.124.10', '2021-09-20 18:12:56', '0|0|0|内网IP|内网IP', 'Windows 10', 'H9YUtmEFNW00C7pW', 1);
INSERT INTO `e_upms_login_log` VALUES (6, 'Chrome 9 93', 'Computer', '192.168.124.10', '2021-09-20 18:13:45', '0|0|0|内网IP|内网IP', 'Windows 10', 'ne2pQZbV0JGFy5Wb', 1);
INSERT INTO `e_upms_login_log` VALUES (7, 'Chrome 9 93', 'Computer', '192.168.124.10', '2021-09-20 18:14:57', '0|0|0|内网IP|内网IP', 'Windows 10', 'm35opY1Dv1RV9mCn', 1);
INSERT INTO `e_upms_login_log` VALUES (8, 'Chrome 9 93', 'Computer', '192.168.124.10', '2021-09-20 18:17:08', '0|0|0|内网IP|内网IP', 'Windows 10', 'EoNvvmt0wKMT0vNc', 1);
INSERT INTO `e_upms_login_log` VALUES (9, 'Chrome 9 93', 'Computer', '192.168.124.10', '2021-09-20 18:23:01', '0|0|0|内网IP|内网IP', 'Windows 10', 'UKvPaZoX5vHqESQH', 1);

-- ----------------------------
-- Table structure for e_upms_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_menu`;
CREATE TABLE `e_upms_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `power_off` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `parent_menu_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK95xpkppt33d2bka0g2d7rgwqt`(`code`) USING BTREE,
  INDEX `FK4p5siq6l1rf9y47bosayghcsv`(`create_user_id`) USING BTREE,
  INDEX `FKtm66wffkyyluinneyva8kd2bc`(`update_user_id`) USING BTREE,
  INDEX `FK5mkgea183mm02v7ic1pdwxy5s`(`parent_menu_id`) USING BTREE,
  CONSTRAINT `FK4p5siq6l1rf9y47bosayghcsv` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK5mkgea183mm02v7ic1pdwxy5s` FOREIGN KEY (`parent_menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKtm66wffkyyluinneyva8kd2bc` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_menu
-- ----------------------------
INSERT INTO `e_upms_menu` VALUES (1, '2021-09-18 21:18:03', NULL, '$manager', 'fa fa-cogs', '系统管理', NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (2, '2021-09-18 21:18:04', NULL, 'EruptMenu', 'fa fa-list-ul', '菜单维护', NULL, NULL, 10, 1, 'tree', 'EruptMenu', NULL, NULL, 1);
INSERT INTO `e_upms_menu` VALUES (3, '2021-09-18 21:18:04', NULL, 'EruptRole', NULL, '角色维护', NULL, NULL, 20, 1, 'table', 'EruptRole', NULL, NULL, 1);
INSERT INTO `e_upms_menu` VALUES (4, '2021-09-18 21:18:04', NULL, 'EruptOrg', 'fa fa-users', '组织维护', NULL, NULL, 30, 1, 'tree', 'EruptOrg', NULL, NULL, 1);
INSERT INTO `e_upms_menu` VALUES (5, '2021-09-18 21:18:04', NULL, 'EruptPost', 'fa fa-id-card', '岗位维护', NULL, NULL, 35, 1, 'table', 'EruptPost', NULL, NULL, 1);
INSERT INTO `e_upms_menu` VALUES (6, '2021-09-18 21:18:04', NULL, 'EruptUser', 'fa fa-user', '用户维护', NULL, NULL, 40, 1, 'table', 'EruptUser', NULL, NULL, 1);
INSERT INTO `e_upms_menu` VALUES (7, '2021-09-18 21:18:04', NULL, 'EruptDict', NULL, '字典维护', NULL, NULL, 50, 1, 'table', 'EruptDict', NULL, NULL, 1);
INSERT INTO `e_upms_menu` VALUES (8, '2021-09-18 21:18:04', NULL, 'EruptDictItem', NULL, '字典项', NULL, NULL, 10, 2, 'table', 'EruptDictItem', NULL, NULL, 7);
INSERT INTO `e_upms_menu` VALUES (9, '2021-09-18 21:18:04', NULL, 'EruptLoginLog', NULL, '登录日志', NULL, NULL, 60, 1, 'table', 'EruptLoginLog', NULL, NULL, 1);
INSERT INTO `e_upms_menu` VALUES (10, '2021-09-18 21:18:04', NULL, 'EruptOperateLog', NULL, '操作日志', NULL, NULL, 70, 1, 'table', 'EruptOperateLog', NULL, NULL, 1);
INSERT INTO `e_upms_menu` VALUES (12, '2021-09-20 18:14:44', NULL, 'Salary', NULL, '薪资数据维护', NULL, NULL, 80, 1, 'table', 'Salary', 1, NULL, 1);

-- ----------------------------
-- Table structure for e_upms_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_operate_log`;
CREATE TABLE `e_upms_operate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `error_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `req_addr` varchar(2083) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `req_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `req_param` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `total_time` bigint(20) NULL DEFAULT NULL,
  `erupt_user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK27xepkxthq9snq3yk6k7iad33`(`erupt_user_id`) USING BTREE,
  CONSTRAINT `FK27xepkxthq9snq3yk6k7iad33` FOREIGN KEY (`erupt_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_operate_log
-- ----------------------------
INSERT INTO `e_upms_operate_log` VALUES (1, '新增 | 菜单配置', '2021-09-20 17:59:45', NULL, '192.168.124.10', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"status\":\"1\",\"sort\":80}', b'1', 223, 1);
INSERT INTO `e_upms_operate_log` VALUES (2, '新增 | 菜单配置', '2021-09-20 18:09:23', 'org.springframework.transaction.CannotCreateTransactionException: Could not open JPA EntityManager for transaction; nested exception is org.hibernate.exception.JDBCConnectionException: Unable to acquire JDBC Connection\r\n	at org.springframework.orm.jpa.JpaTransactionManager.doBegin(JpaTransactionManager.java:467)\r\n	at org.springframework.transaction.support.AbstractPlatformTransactionManager.startTransaction(AbstractPlatformTransactionManager.java:400)\r\n	at org.springframework.transaction.support.AbstractPlatformTransactionManager.getTransaction(AbstractPlatformTransactionManager.java:373)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.createTransactionIfNecessary(TransactionAspectSupport.java:595)\r\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:382)\r\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:750)\r\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:692)\r\n	at xyz.erupt.core.controller.EruptModifyController$$EnhancerBySpringCGLIB$$6257de0.addEruptData(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:197)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:141)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:106)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1064)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:963)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:681)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:764)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\r\n	at xyz.erupt.security.interceptor.HttpServletRequestFilter.doFilter(HttpServletRequestFilter.java:42)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:197)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:542)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:357)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:382)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\r\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:893)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1726)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: org.hibernate.exception.JDBCConnectionException: Unable to acquire JDBC Connection\r\n	at org.hibernate.exception.internal.SQLExceptionTypeDelegate.convert(SQLExceptionTypeDelegate.java:48)\r\n	at org.hibernate.exception.internal.StandardSQLExceptionConverter.convert(StandardSQLExceptionConverter.java:42)\r\n	at org.hibernate.engine.jdbc.spi.SqlExceptionHelper.convert(SqlExceptionHelper.java:113)\r\n	at org.hibernate.engine.jdbc.spi.SqlExceptionHelper.convert(SqlExceptionHelper.java:99)\r\n	at org.hibernate.resource.jdbc.internal.LogicalConnectionManagedImpl.acquireConnectionIfNeeded(LogicalConnectionManagedImpl.java:111)\r\n	at org.hibernate.resource.jdbc.internal.LogicalConnectionManagedImpl.getPhysicalConnection(LogicalConnectionManagedImpl.java:138)\r\n	at org.hibernate.resource.jdbc.internal.LogicalConnectionManagedImpl.getConnectionForTransactionManagement(LogicalConnectionManagedImpl.java:276)\r\n	at org.hibernate.resource.jdbc.internal.LogicalConnectionManagedImpl.begin(LogicalConnectionManagedImpl.java:284)\r\n	at org.hibernate.resource.transaction.backend.jdbc.internal.JdbcResourceLocalTransactionCoordinatorImpl$TransactionDriverControlImpl.begin(JdbcResourceLocalTransactionCoordinatorImpl.java:246)\r\n	at org.hibernate.engine.transaction.internal.TransactionImpl.begin(TransactionImpl.java:83)\r\n	at org.springframework.orm.jpa.vendor.HibernateJpaDialect.beginTransaction(HibernateJpaDialect.java:164)\r\n	at org.springframework.orm.jpa.JpaTransactionManager.doBegin(JpaTransactionManager.java:421)\r\n	... 62 more\r\nCaused by: java.sql.SQLTransientConnectionException: HikariPool-1 - Connection is not available, request timed out after 30014ms.\r\n	at com.zaxxer.hikari.pool.HikariPool.createTimeoutException(HikariPool.java:696)\r\n	at com.zaxxer.hikari.pool.HikariPool.getConnection(HikariPool.java:197)\r\n	at com.zaxxer.hikari.pool.HikariPool.getConnection(HikariPool.java:162)\r\n	at com.zaxxer.hikari.HikariDataSource.getConnection(HikariDataSource.java:128)\r\n	at org.hibernate.engine.jdbc.connections.internal.DatasourceConnectionProviderImpl.getConnection(DatasourceConnectionProviderImpl.java:122)\r\n	at org.hibernate.internal.NonContextualJdbcConnectionAccess.obtainConnection(NonContextualJdbcConnectionAccess.java:38)\r\n	at org.hibernate.resource.jdbc.internal.LogicalConnectionManagedImpl.acquireConnectionIfNeeded(LogicalConnectionManagedImpl.java:108)\r\n	... 69 more\r\nCaused by: java.sql.SQLNonTransientConnectionException: No operations allowed after connection closed.\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:110)\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:97)\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:89)\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:63)\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:73)\r\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:73)\r\n	at com.mysql.cj.jdbc.ConnectionImpl.setNetworkTimeout(ConnectionImpl.java:2480)\r\n	at com.zaxxer.hikari.pool.PoolBase.setNetworkTimeout(PoolBase.java:566)\r\n	at com.zaxxer.hikari.pool.PoolBase.isConnectionAlive(PoolBase.java:173)\r\n	at com.zaxxer.hikari.pool.HikariPool.getConnection(HikariPool.java:186)\r\n	... 74 more\r\nCaused by: com.mysql.cj.exceptions.ConnectionIsClosedException: No operations allowed after connection closed.\r\n	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)\r\n	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)\r\n	at java.lang.reflect.Constructor.newInstance(Constructor.java:423)\r\n	at com.mysql.cj.exceptions.ExceptionFactory.createException(ExceptionFactory.java:61)\r\n	at com.mysql.cj.exceptions.ExceptionFactory.createException(ExceptionFactory.java:105)\r\n	at com.mysql.cj.exceptions.ExceptionFactory.createException(ExceptionFactory.java:151)\r\n	at com.mysql.cj.NativeSession.checkClosed(NativeSession.java:758)\r\n	at com.mysql.cj.jdbc.ConnectionImpl.checkClosed(ConnectionImpl.java:568)\r\n	at com.mysql.cj.jdbc.ConnectionImpl.setNetworkTimeout(ConnectionImpl.java:2476)\r\n	... 77 more\r\n', '192.168.124.10', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"code\":\"$manager\",\"name\":\"模块管理\",\"status\":\"1\",\"sort\":80,\"icon\":\"fa fa-cogs\"}', b'0', 50124, 1);
INSERT INTO `e_upms_operate_log` VALUES (3, '新增 | 菜单配置', '2021-09-20 18:09:27', NULL, '192.168.124.10', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"code\":\"$manager\",\"name\":\"模块管理\",\"status\":\"1\",\"sort\":80,\"icon\":\"fa fa-cogs\"}', b'1', 361, 1);
INSERT INTO `e_upms_operate_log` VALUES (4, '修改 | 用户', '2021-09-20 18:10:23', NULL, '192.168.124.10', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/EruptUser', 'PUT', '{\"account\":\"erupt\",\"name\":\"erupt\",\"status\":true,\"isMd5\":false,\"id\":1}', b'1', 1085, 1);
INSERT INTO `e_upms_operate_log` VALUES (5, '新增 | 菜单配置', '2021-09-20 18:14:45', NULL, '192.168.124.10', '0|0|0|内网IP|内网IP', 'http://localhost:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"code\":\"Salary\",\"name\":\"薪资数据维护\",\"status\":\"1\",\"type\":\"table\",\"value\":\"Salary\",\"sort\":80,\"parentMenu\":{\"id\":\"1\",\"name\":\"系统管理\"}}', b'1', 783, 1);

-- ----------------------------
-- Table structure for e_upms_org
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_org`;
CREATE TABLE `e_upms_org`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `parent_org_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKtj7222kjnkt7pv9kfn9g8ck4h`(`parent_org_id`) USING BTREE,
  CONSTRAINT `FKtj7222kjnkt7pv9kfn9g8ck4h` FOREIGN KEY (`parent_org_id`) REFERENCES `e_upms_org` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_org
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_post
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_post`;
CREATE TABLE `e_upms_post`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `weight` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKltq5h3n5cyyk5nxtjhg9lhidg`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_post
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_role
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_role`;
CREATE TABLE `e_upms_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `power_off` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKjgxkp7mr4183tcwosrbqpsl3a`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_role
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_role_menu`;
CREATE TABLE `e_upms_role_menu`  (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `FKr6bl403chgwjnb6jk0uqqd9x8`(`menu_id`) USING BTREE,
  CONSTRAINT `FKgsdnakqsme4htxkiapwmf6tbi` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKr6bl403chgwjnb6jk0uqqd9x8` FOREIGN KEY (`menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_user
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_user`;
CREATE TABLE `e_upms_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_admin` bit(1) NULL DEFAULT NULL,
  `is_md5` bit(1) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `white_ip` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `erupt_org_id` bigint(20) NULL DEFAULT NULL,
  `erupt_post_id` bigint(20) NULL DEFAULT NULL,
  `create_user_id` bigint(20) NULL DEFAULT NULL,
  `update_user_id` bigint(20) NULL DEFAULT NULL,
  `erupt_menu_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK812t22yn0295dkkvx5gjgahax`(`account`) USING BTREE,
  INDEX `FK1re8jv3614mkk2wfxscvgvmnm`(`erupt_org_id`) USING BTREE,
  INDEX `FK53cice19aydjcuykpv847ocdv`(`erupt_post_id`) USING BTREE,
  INDEX `FKdvwfw4x66ahh1tavd69cnx4i0`(`create_user_id`) USING BTREE,
  INDEX `FKct3f9stm4eti10401f7rbh5ey`(`update_user_id`) USING BTREE,
  INDEX `FKga0jd7sahnn1tv14mq4dy5kba`(`erupt_menu_id`) USING BTREE,
  CONSTRAINT `FK1re8jv3614mkk2wfxscvgvmnm` FOREIGN KEY (`erupt_org_id`) REFERENCES `e_upms_org` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK53cice19aydjcuykpv847ocdv` FOREIGN KEY (`erupt_post_id`) REFERENCES `e_upms_post` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKct3f9stm4eti10401f7rbh5ey` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKdvwfw4x66ahh1tavd69cnx4i0` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKga0jd7sahnn1tv14mq4dy5kba` FOREIGN KEY (`erupt_menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_user
-- ----------------------------
INSERT INTO `e_upms_user` VALUES (1, 'erupt', '2021-09-18 21:18:03', NULL, 'erupt', NULL, b'1', b'1', '610d44f73b7709169e8e06ca4ac5af8e', NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for e_upms_user_role
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_user_role`;
CREATE TABLE `e_upms_user_role`  (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `user_id`) USING BTREE,
  INDEX `FKes2ylim5w3ej690ss84sb956x`(`user_id`) USING BTREE,
  CONSTRAINT `FK3h4lekfh26f5f8b7by3ejges6` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKes2ylim5w3ej690ss84sb956x` FOREIGN KEY (`user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of e_upms_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `after_tax_deduction` double NOT NULL,
  `age_salary` double NOT NULL,
  `back_pay` double NOT NULL,
  `communication_subsidy` double NOT NULL,
  `endowment_insurance` double NOT NULL,
  `enumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `housing_provident_fund` double NOT NULL,
  `individual_income_tax` double NOT NULL,
  `medical_insurance` double NOT NULL,
  `month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `one_child_bonus` double NOT NULL,
  `performance_salary_cash` double NOT NULL,
  `performance_salary_total` double NOT NULL,
  `post_salary` double NOT NULL,
  `pre_tax_deduction` double NOT NULL,
  `real_salary` double NOT NULL,
  `supplementary_pension` double NOT NULL,
  `supplementary_provident_fund` double NOT NULL,
  `total_pay_amount` double NOT NULL,
  `unemployment_insurance` double NOT NULL,
  `union_dues` double NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES (1, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2019-9', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (2, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2019-10', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (3, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2019-11', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (4, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2019-12', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (5, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2020-1', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (6, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2020-2', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (7, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2020-4', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (8, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2020-5', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (9, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2020-6', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (10, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2020-7', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (11, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2020-9', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (12, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2020-10', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (13, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2020-11', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (14, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2020-12', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (15, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2021-1', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (16, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2021-2', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (17, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2021-3', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (18, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2021-4', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (19, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2021-5', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (20, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2021-6', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (21, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2021-7', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (22, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2021-8', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (23, 0, 10, 0, 150, 524, '500958', 459, 25.56, 131, '2021-9', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (24, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2019-9', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (25, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2019-10', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (26, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2019-11', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (27, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2019-12', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (28, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2020-1', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (29, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2020-2', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (30, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2020-3', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (31, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2020-4', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (32, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2020-5', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (33, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2020-6', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (34, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2020-7', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (35, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2020-9', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (36, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2020-10', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (37, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2020-11', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (38, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2020-12', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (39, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2021-1', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (40, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2021-2', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (41, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2021-3', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (42, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2021-4', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (43, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2021-5', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (44, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2021-6', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (45, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2021-7', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (46, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2021-8', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (47, 0, 10, 0, 150, 524, '500959', 459, 25.56, 131, '2021-9', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (1, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2019-9', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (2, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2019-10', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (3, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2019-11', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (4, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2019-12', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (5, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-1', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (6, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-2', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (7, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-4', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (8, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-5', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (9, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-6', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (10, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-7', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (11, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-9', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (12, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-10', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (13, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-11', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (14, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-12', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (15, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2021-1', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (16, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2021-2', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (17, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2021-3', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (18, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2021-4', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (19, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2021-5', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (20, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2021-6', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (21, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2021-7', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (22, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2021-8', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (23, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2021-9', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (24, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2019-9', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (25, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2019-10', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (26, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2019-11', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (27, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2019-12', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (28, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-1', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (29, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-2', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (30, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-3', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (31, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-4', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (32, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-5', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (33, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-6', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (34, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-7', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (35, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-9', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (36, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-10', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (37, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-11', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (38, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-12', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (39, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2021-1', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (40, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2021-2', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (41, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2021-3', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (42, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2021-4', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (43, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2021-5', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (44, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2021-6', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (45, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2021-7', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (46, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2021-8', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (47, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2021-9', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (48, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2019-9', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (49, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2019-10', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (50, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2019-11', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (51, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2019-12', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (52, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-1', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (53, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-2', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (54, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-4', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (55, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-5', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (56, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-6', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (57, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-7', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (58, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-9', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (59, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-10', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (60, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-11', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (61, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2020-12', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (62, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2021-1', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (63, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2021-2', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (64, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2021-3', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (65, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2021-4', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (66, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2021-5', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (67, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2021-6', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (68, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2021-7', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (69, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2021-8', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (70, 0, 10, 0, 150, 524, '500750', 459, 25.56, 131, '2021-9', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (71, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2019-9', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (72, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2019-10', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (73, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2019-11', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (74, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2019-12', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (75, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-1', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (76, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-2', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (77, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-3', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (78, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-4', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (79, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-5', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (80, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-6', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (81, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-7', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (82, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-9', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (83, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-10', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (84, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-11', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (85, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2020-12', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (86, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2021-1', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (87, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2021-2', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (88, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2021-3', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (89, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2021-4', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (90, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2021-5', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (91, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2021-6', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (92, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2021-7', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (93, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2021-8', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
INSERT INTO `salary` VALUES (94, 0, 10, 0, 150, 524, '500751', 459, 25.56, 131, '2021-9', 0, 0, 0, 5500, 0, 4148.64, 0, 328, 5660, 32.8, 10);
-- ----------------------------
-- Table structure for web_user
-- ----------------------------
DROP TABLE IF EXISTS `web_user`;
CREATE TABLE `web_user`  (
  `enumber` bigint(20) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `erupt_org_id` bigint(20) NULL DEFAULT NULL,
  `erupt_post_id` bigint(20) NULL DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`enumber`) USING BTREE,
  INDEX `FK1oq8n5lmu30cmha2wraayfakv`(`erupt_org_id`) USING BTREE,
  INDEX `FKdgt6ue1bvusfiu27abmrpxnl8`(`erupt_post_id`) USING BTREE,
  CONSTRAINT `FK1oq8n5lmu30cmha2wraayfakv` FOREIGN KEY (`erupt_org_id`) REFERENCES `e_upms_org` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKdgt6ue1bvusfiu27abmrpxnl8` FOREIGN KEY (`erupt_post_id`) REFERENCES `e_upms_post` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
