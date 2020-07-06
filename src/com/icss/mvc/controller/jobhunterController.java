package com.icss.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icss.mvc.dao.jobhunterDao;
import com.icss.mvc.entity.jobhunter_enrol;

@Controller
public class jobhunterController {
	@Autowired
	private jobhunterDao dao;
	
	/* 企业注册 */
	@RequestMapping("jobEnrol")
	@ResponseBody
	public String fune1(jobhunter_enrol jobenrol) {
		System.out.println("job Enrol----------");
		int j=dao.jobEnrol(jobenrol);
		return "success";
	}
	/* 企业登录 */
	@RequestMapping("jobLogin")
	@ResponseBody
	public String fune2(String jbname,String jbpsw) {
		System.out.println("job Login----------");
		String psw=dao.jobLogin(jbname);
		if(jbpsw.equals(psw)) {
			return "success";
		}
		else {
			return "fail";
		}
	}
	
}
