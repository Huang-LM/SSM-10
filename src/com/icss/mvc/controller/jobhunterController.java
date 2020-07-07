package com.icss.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icss.mvc.dao.jobhunterDao;
import com.icss.mvc.entity.Grid;
import com.icss.mvc.entity.jobhunter_enrol;
import com.icss.mvc.entity.position;

@Controller
public class jobhunterController {
	@Autowired
	private jobhunterDao dao;
	
//	注册
	@RequestMapping("jobEnrol")
	@ResponseBody
	public String fune1(jobhunter_enrol jobenrol) {
		System.out.println("job Enrol----------");
		int j=dao.jobEnrol(jobenrol);
		return "success";
	}
//	登录
	@RequestMapping("jobLogin")
	@ResponseBody
	public String fune2(String jbusername,String jbpsw) {
		String psw=dao.jobLogin(jbusername);
		if(jbpsw.equals(psw)) {
			return "success";
		}
		else {
			return "fail";
		}
	}
//	展示公司列表
	@RequestMapping("showBsjson")
	@ResponseBody
	public Grid fun3(@RequestParam("page") Integer page, @RequestParam("limit") Integer size, Grid Grid) throws Exception {
		System.out.println("showBsjson------------");
		List<position> jlist = dao.findList();
		return new Grid(0,"ok",jlist.size(),jlist);
	}
//	展示职业搜索结果
	@RequestMapping("findSearch")
	@ResponseBody
	public Grid fun4(String bsposition, Grid Grid) throws Exception {
		System.out.println("showSearch-----"+bsposition);
		List<position> slist = dao.findSearch(bsposition);
		return new Grid(0,"ok",slist.size(),slist);
	}
	
}
