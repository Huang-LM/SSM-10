package com.icss.mvc.controller;

import java.io.InputStream;
import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icss.mvc.dao.MybatisUtil;
import com.icss.mvc.dao.businessDao;
import com.icss.mvc.entity.Grid;
import com.icss.mvc.entity.business;
import com.icss.mvc.entity.jobhunter;

@Controller
public class businessController {
	@RequestMapping("showBusiness")
	@ResponseBody
	public Grid funJ(ModelMap mp) throws Exception {
		System.out.println("show business-----------------------------------------");
		InputStream ins = Resources.getResourceAsStream("mybatis-cfg1.xml");
		SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(ins);
		SqlSession sqlSession = sf.openSession();
		businessDao dao=sqlSession.getMapper(businessDao.class);
		List<business> slist = dao.findBusinessAll();
		return new Grid(0,"ok",slist.size(),slist);
	}
	
	@RequestMapping("addBusiness")
	public String fun(String bsname,String bspname,String bsid,String bsclass,String bsculture,String bsintr,String bsablt) throws Exception {
		System.out.println("add business-----------------------------------------");
		InputStream ins = Resources.getResourceAsStream("mybatis-cfg1.xml");
		SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(ins);
		SqlSession sqlSession = sf.openSession();
		businessDao dao=sqlSession.getMapper(businessDao.class);
		int r = dao.insertBusiness(bsname,bspname,bsid,bsclass,bsculture,bsintr,bsablt);
		sqlSession.commit();
		return"backgroundLogin.jsp";
	}		
	@RequestMapping("delBusiness")
	@ResponseBody
	public String fun2(String bsid) throws Exception {
		System.out.println("del business-----------------------------------------");
		InputStream ins = Resources.getResourceAsStream("mybatis-cfg1.xml");
		SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(ins);
		SqlSession sqlSession = sf.openSession();
		businessDao dao=sqlSession.getMapper(businessDao.class);
		int s = dao.delBusiness(bsid);
		sqlSession.commit();
		if(s==1) {
			  return "success";
		  }
		  else {
			  return "fail";
		  }
	}
}