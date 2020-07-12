package com.icss.mvc.dao;

import java.util.List;

import com.icss.mvc.entity.business;
import com.icss.mvc.entity.jobhunter;
import com.icss.mvc.entity.jobhunter_enrol;
import com.icss.mvc.entity.position;

public interface jobhunterDao {
//	注册
	public int jobEnrol(jobhunter_enrol jobenrol);
//	登录 
	public String jobLogin(String jbusername);
//	获取用户名
	public String getJobname(String jbusername);
//	展示公司列表
	public List<position> findList(Integer start, Integer count);
//	展示职业搜索结果
	public List<position> findSearch(String bsposition);
//	添加求职简历
	public int insertJob(jobhunter job);
//	查找公司信息
	public List<business> findbsView(String bsname);
//	查看进度
	public String findInfo(String jbname);
}