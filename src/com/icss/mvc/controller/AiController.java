package com.icss.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icss.mvc.entity.jobhunter_enrol;
import com.icss.mvc.tool.ClientToken;
import com.icss.mvc.tool.FaceUtil;

@Controller
public class AiController {
    private String token="24.dd1e24840283658a12e0810e2fc9c1c3.2592000.1596678949.282335-21168213";
	@RequestMapping("showToken")
	@ResponseBody
	public String fun1() {
		System.out.println("----------");
		String ak="zWgAujs7LAGvHSIH0uVcPyOe";
		String sk="p6asqvcgwNvGp5N0zlyxwKxmI8hDnbc6";
		String token=ClientToken.getAuth(ak, sk);
		return token;
	}
	@RequestMapping("showDetect")
	@ResponseBody
	public String fun2() {
		System.out.println("----------");
		String result=FaceUtil.faceDetect(token);
		return result;
	}
}
