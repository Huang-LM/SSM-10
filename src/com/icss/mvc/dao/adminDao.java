package com.icss.mvc.dao;

import java.util.List;

import com.icss.mvc.entity.business;
import com.icss.mvc.entity.jobhunter;
import com.icss.mvc.entity.manager_enrol;

public interface adminDao {

	/* 管理员注册 */
	public int adminSignup(String mnname,String mnpsw);
	
	/* 管理员登录 */
	public String adminSignin(String mnname);
	
	/* 求职者信息展示 */	
	public List<jobhunter> findjbhunterAll();
	/* 求职者信息添加 */
	public int insertjobhunter
	( String jbname,String jbsex,Integer jbage,String jbid ,String jbusername ,String jbpnmb ,String jbcompany ,String jbjob,String jbablt, String interstatus);
	/* 求职者信息删除 */
	public int deljbhunter(String jbid);
	/* 求职者信息更改 */
	public int updatejbhunter
	(String jbname,String jbsex,Integer jbage,String jbid ,String jbusername ,String jbpnmb ,String jbcompany ,String jbjob,String jbablt, String interstatus);
	
	public List<jobhunter> findjbhunterByid();
	
	/* 企业信息展示 */	
	public List<business> findBusinessAll();
	/* 企业信息添加 */
	public int insertBusiness
	(String bsname,String bspname,String bsid,String bsclass,String bsculture,String bsintr,String bsablt);
	/* 企业信息删除 */
	public int delBusiness(String bsid);
	/* 企业信息更改 */
	public int updateBusiness
	(String bsid,String bsname,String bspname,String bsclass,String bsculture,String bsintr,String bsablt);
	
	public List<business> findBusinessByid();

	/* 招聘记录查询 */
	public List<jobhunter> findRecords();
	
	/* 修改行业类别 */
	public int updateClass(String bsclass, String bsname);
}
