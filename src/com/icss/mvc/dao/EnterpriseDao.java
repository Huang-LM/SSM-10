package com.icss.mvc.dao;

import com.icss.mvc.entity.business_enrol;

public interface EnterpriseDao {
	/* 企业注册 */
	public int enterpriseSignup(business_enrol buen);
	/* 企业登录 */
	public String enterpriseSignin(String bsname);
	
}
