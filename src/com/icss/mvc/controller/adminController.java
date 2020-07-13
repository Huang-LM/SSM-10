package com.icss.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icss.mvc.dao.adminDao;
import com.icss.mvc.entity.Grid;
import com.icss.mvc.entity.business;
import com.icss.mvc.entity.business_enrol;
import com.icss.mvc.entity.jobhunter;
import com.icss.mvc.entity.manager_enrol;

@Controller
public class adminController {
	@Autowired
	private adminDao dao;
	
	public String adminname;
	
	/* 管理员登录 */
	@RequestMapping("adminSignIn")
	@ResponseBody
	public String funa1(String mnname,String mnpsw) {
		System.out.println("Admin Sign In---------------");
		adminname = mnname;
		String psw=dao.adminSignin(mnname);
		if(mnpsw.equals(psw)) {
			return "success";
		}
		else {
			return "fail";
		}
	}
	/* 管理员注册 */
	@RequestMapping("adminSignUp")
	@ResponseBody
	public String fune1(String mnname,String mnpsw) {
		System.out.println("Admin Sign Up---------------");
		int a=dao.adminSignup(mnname,mnpsw);
		return "success";
	}
	
	
	@RequestMapping("showBusiness")
	@ResponseBody
	public Grid funa3(ModelMap mp) throws Exception {
		System.out.println("show business-----------------------------------------");
		List<business> slist = dao.findBusinessAll();
		return new Grid(0,"ok",slist.size(),slist);
	}
	
	@RequestMapping("addBusiness")
	public String funa4(String bsname,String bspname,String bsid,String bsclass,String bsculture,String bsintr,String bsablt) throws Exception {
		System.out.println("add business-----------------------------------------");
		int r = dao.insertBusiness(bsname,bspname,bsid,bsclass,bsculture,bsintr,bsablt);
		return"backgroundLogin.jsp";
	}		
	@RequestMapping("delBusiness")
	@ResponseBody
	public String funa5(String bsid) throws Exception {
		System.out.println("del business-----------------------------------------");
		int s = dao.delBusiness(bsid);
		if(s==1) {
			  return "success";
		  }
		  else {
			  return "fail";
		  }
	}
	
	
	@RequestMapping("showjb")
	@ResponseBody
	public Grid funa6(ModelMap mp) throws Exception {
		System.out.println("show -----------------------------------------");
		List<jobhunter> slist = dao.findjbhunterAll();
		return new Grid(0,"ok",slist.size(),slist);
	}
	
	@RequestMapping("addjbhunter")
	public String funa7(String jbname,String jbsex,Integer jbage,String jbid ,String jbusername ,String jbpnmb ,String jbcompany ,String jbjob,String jbablt, String interstatus) throws Exception {
		System.out.println("add business-----------------------------------------");
		int r = dao.insertjobhunter(jbname,jbsex,jbage, jbid ,jbusername , jbpnmb , jbcompany , jbjob, jbablt,  interstatus );
		return"backgroundLogin.jsp";
	}		
	@RequestMapping("deljbhunter")
	@ResponseBody
	public String funa8(String jbid) throws Exception {
		System.out.println("del business-----------------------------------------");
		int s = dao.deljbhunter(jbid);
		if(s==1) {
			  return "success";
		  }
		  else {
			  return "fail";
		  }
	}
	
	@RequestMapping("updatejbhunter")
	@ResponseBody
	public String funa9(String jbname,String jbsex,Integer jbage,String jbid ,String jbusername ,String jbpnmb ,String jbcompany ,String jbjob,String jbablt, String interstatus) throws Exception {
		System.out.println("update-----------------------------------------");
		int a = dao.updatejbhunter(jbname,jbsex,jbage, jbid ,jbusername , jbpnmb , jbcompany , jbjob, jbablt,  interstatus );
		if(a==1) {
			  return "success";
		  }
		  else {
			  return "fail";
		  }
	}
	@RequestMapping("editjobhunter")
	@ResponseBody
	public String funa10(ModelMap mp) throws Exception {
		System.out.println("show business-----------------------------------------");
		List<jobhunter> slist = dao.findjbhunterByid();
		return "updatejobhunter.jsp";
	}

	/* 招聘记录查询 */
	@RequestMapping("inquireRecords")
	@ResponseBody
	public Grid funa11(ModelMap mp) throws Exception {
		System.out.println("show business-----------------------------------------");
		List<jobhunter> slist = dao.findRecords();
		return new Grid(0,"ok",slist.size(),slist);
	}

	/* 修改行业类别 */
	@RequestMapping("updateclass")
	@ResponseBody
	public String funa12(String bsname,String bsclass) throws Exception {
		System.out.println("Update Class-----------------------------------------");
		int a = dao.updateClass(bsclass,bsname);
		if(a==1) {
			  return "success";
		  }
		  else {
			  return "fail";
		  }
	}
}
