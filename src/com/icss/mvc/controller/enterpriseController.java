package com.icss.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icss.mvc.dao.EnterpriseDao;
import com.icss.mvc.entity.business_enrol;

@Controller
public class enterpriseController {
	@Autowired
	private EnterpriseDao entdao;
	
	/* 企业注册 */
	@RequestMapping("enterpriseSignUp")
	@ResponseBody
	public String fune1(business_enrol buen) {
		System.out.println("Enterprise Sign Up----------");
		int a=entdao.enterpriseSignup(buen);
		return "success";
	}
	/* 企业登录 */
	@RequestMapping("enterpriseSignIn")
	@ResponseBody
	public String fune2(ModelMap mp,String bsname,String bspsw) {
		System.out.println("Enterprise Sign In----------");
		String psw=entdao.enterpriseSignin(bsname);
		mp.addAttribute("name",bsname);
		if(bspsw.equals(psw)) {
			return "success";
		}
		else {
			return "fail";
		}
	}
	
	
}
