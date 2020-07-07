package com.icss.mvc.dao;

import java.util.List;

import com.icss.mvc.entity.business;
import com.icss.mvc.entity.business_enrol;
import com.icss.mvc.entity.position;

public interface EnterpriseDao {
	/* 企业注册 */
	public int enterpriseSignup(business_enrol buen);
	/* 企业登录 */
	public String enterpriseSignin(String bsname);
	/* 企业基本信息 */
	public List<business> findEntInfor(String bsname);
	/* 企业招聘信息 */
	public List<position> entFindPosition(String bsname);
	/* 修改企业基本信息 */
	public int updEntInfor(business bus);
	
}