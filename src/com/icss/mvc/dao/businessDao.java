package com.icss.mvc.dao;

import java.sql.Timestamp;
import java.util.List;

import com.icss.mvc.entity.business;
import com.icss.mvc.entity.jobhunter;

public interface businessDao {
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
}

