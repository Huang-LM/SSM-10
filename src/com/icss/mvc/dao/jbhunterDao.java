package com.icss.mvc.dao;

import java.sql.Timestamp;
import java.util.List;

import com.icss.mvc.entity.business;
import com.icss.mvc.entity.jobhunter;

public interface jbhunterDao {
	/* 企业信息展示 */	
	public List<jobhunter> findjbhunterAll();
	/* 企业信息添加 */
	public int insertjobhunter
	( String jbname,String jbsex,Integer jbage,String jbid ,String jbusername ,String jbpnmb ,String jbcompany ,String jbjob,String jbablt, String interstatus);
	/* 企业信息删除 */
	public int deljbhunter(String jbid);
	/* 企业信息更改 */
	public int updatejbhunter
	(String jbname,String jbsex,Integer jbage,String jbid ,String jbusername ,String jbpnmb ,String jbcompany ,String jbjob,String jbablt, String interstatus);
	
	public List<jobhunter> findjbhunterByid();
}
