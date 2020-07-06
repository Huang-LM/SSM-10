package com.icss.mvc.dao;

import java.util.List;

import com.icss.mvc.entity.jobhunter_enrol;
import com.icss.mvc.entity.position;

public interface jobhunterDao {
//	注册
	public int jobEnrol(jobhunter_enrol jobenrol);
//	登录 
	public String jobLogin(String jbusername);
//	展示公司列表
	public List<position> findList();
//	展示搜索结果
	public List<position> findSearch(String bsposition);
	
}
