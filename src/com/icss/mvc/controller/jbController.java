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
import com.icss.mvc.dao.jbhunterDao;
import com.icss.mvc.entity.Grid;
import com.icss.mvc.entity.jobhunter;

@Controller
public class jbController {
	@RequestMapping("showjb")
	@ResponseBody
	public Grid funJ(ModelMap mp) throws Exception {
		System.out.println("show -----------------------------------------");
		InputStream ins = Resources.getResourceAsStream("mybatis-cfg1.xml");
		SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(ins);
		SqlSession sqlSession = sf.openSession();
		jbhunterDao dao=sqlSession.getMapper(jbhunterDao.class);
		List<jobhunter> slist = dao.findjbhunterAll();
		return new Grid(0,"ok",slist.size(),slist);
	}
	
	@RequestMapping("addjbhunter")
	public String fun(String jbname,String jbsex,Integer jbage,String jbid ,String jbusername ,String jbpnmb ,String jbcompany ,String jbjob,String jbablt, String interstatus) throws Exception {
		System.out.println("add business-----------------------------------------");
		InputStream ins = Resources.getResourceAsStream("mybatis-cfg1.xml");
		SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(ins);
		SqlSession sqlSession = sf.openSession();
		jbhunterDao dao=sqlSession.getMapper(jbhunterDao.class);
		int r = dao.insertjobhunter(jbname,jbsex,jbage, jbid ,jbusername , jbpnmb , jbcompany , jbjob, jbablt,  interstatus );
		sqlSession.commit();
		return"backgroundLogin.jsp";
	}		
	@RequestMapping("deljbhunter")
	@ResponseBody
	public String fun2(String jbid) throws Exception {
		System.out.println("del business-----------------------------------------");
		InputStream ins = Resources.getResourceAsStream("mybatis-cfg1.xml");
		SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(ins);
		SqlSession sqlSession = sf.openSession();
		jbhunterDao dao=sqlSession.getMapper(jbhunterDao.class);
		int s = dao.deljbhunter(jbid);
		sqlSession.commit();
		if(s==1) {
			  return "success";
		  }
		  else {
			  return "fail";
		  }
	}
	
	@RequestMapping("updatejbhunter")
	@ResponseBody
	public String fun3(String jbname,String jbsex,Integer jbage,String jbid ,String jbusername ,String jbpnmb ,String jbcompany ,String jbjob,String jbablt, String interstatus) throws Exception {
		System.out.println("update-----------------------------------------");
		InputStream ins = Resources.getResourceAsStream("mybatis-cfg1.xml");
		SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(ins);
		SqlSession sqlSession = sf.openSession();
		jbhunterDao dao=sqlSession.getMapper(jbhunterDao.class);
		int a = dao.updatejbhunter(jbname,jbsex,jbage, jbid ,jbusername , jbpnmb , jbcompany , jbjob, jbablt,  interstatus );
		sqlSession.commit();
		if(a==1) {
			  return "success";
		  }
		  else {
			  return "fail";
		  }
	}
	@RequestMapping("editjobhunter")
	@ResponseBody
	public String fun4(ModelMap mp) throws Exception {
		System.out.println("show business-----------------------------------------");
		InputStream ins = Resources.getResourceAsStream("mybatis-cfg1.xml");
		SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(ins);
		SqlSession sqlSession = sf.openSession();
		jbhunterDao dao=sqlSession.getMapper(jbhunterDao.class);
		List<jobhunter> slist = dao.findjbhunterByid();
		return "updatejobhunter.jsp";
	}
}
