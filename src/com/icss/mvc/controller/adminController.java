package com.icss.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icss.mvc.dao.EnterpriseDao;
import com.icss.mvc.dao.adminDao;

@Controller
public class adminController {
	@Autowired
	private adminDao admdao;
	
	public String adminname;
	
	/* 管理员登录 */
	@RequestMapping("adminSignIn")
	@ResponseBody
	public String funa1(String mnname,String mnpsw) {
		System.out.println("Admin Sign In---------------");
		adminname = mnname;
		String psw=admdao.adminSignin(mnname);
		if(mnpsw.equals(psw)) {
			return "success";
		}
		else {
			return "fail";
		}
	}
}
