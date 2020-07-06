package com.icss.mvc.dao;

import com.icss.mvc.entity.jobhunter_enrol;

public interface jobhunterDao {
	/* 注册 */
	public int jobEnrol(jobhunter_enrol jobenrol);
	/* 登录 */
	public String jobLogin(String jbusername);
	
}
