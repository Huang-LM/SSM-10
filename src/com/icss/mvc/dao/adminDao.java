package com.icss.mvc.dao;

import com.icss.mvc.entity.manager_enrol;

public interface adminDao {

	/* 管理员注册 */
	public int adminSignup(manager_enrol maen);
	
	/* 管理员登录 */
	public String adminSignin(String mnname);
}
