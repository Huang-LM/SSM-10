package com.icss.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class enterpriseController {

	@RequestMapping("enterpriseSignUp")
	@ResponseBody
	public String fune1() {
		
		
		
		return "ok";
	}
	@RequestMapping("enterpriseSignIn")
	@ResponseBody
	public String fune2() {
		
		
		
		return "ok";
	}
	
	
}
