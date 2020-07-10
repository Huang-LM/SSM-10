package com.icss.mvc.dao;

import java.util.List;

import com.icss.mvc.entity.business;
import com.icss.mvc.entity.business_enrol;
import com.icss.mvc.entity.jobhunter;
import com.icss.mvc.entity.position;

public interface EnterpriseDao {
	
	/* 企业注册 */
	public int enterpriseSignup(business_enrol buen);
	
	/* 企业登录 */
	public String enterpriseSignin(String bsname);
	
	/* 企业基本信息 */
	public List<business> findEntInfor(String bsname);
	
	/* 企业招聘信息 */
	public List<position> entFindPosition(String bsname, Integer start, Integer count);

	/* 企业招聘信息总数 */
	public int entFindPositionCount(String bsname);
	
	/* 修改企业基本信息 */
	public int updEntInfor(business bus);
	
	/* 发布招聘信息 */
	public int entJobPosting(position pos);
	
	/* 管理招聘信息 */
	public int delRecrInfor(String bsname, String bsposition);

	/* 查看应聘者 */
	public List<jobhunter> findJobHunter(String bsname);

	/* 应聘者数量 */
	public int findJobHunterCount(String bsname);

	/* 应聘者基本信息 */
	public List<jobhunter> showJobHunter(String jbid);

	/* 应聘者简历 */
	public jobhunter showResume(String ibid);
	
	
}