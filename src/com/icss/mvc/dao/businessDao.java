package com.icss.mvc.dao;

import java.sql.Timestamp;
import java.util.List;

import com.icss.mvc.entity.business;

public interface businessDao {
	public List<business> findBusinessAll();
	public int insertBusiness
	(String bsname,String bspname,String bsid,String bsclass,String bsculture,String bsintr,String bsablt);
}
