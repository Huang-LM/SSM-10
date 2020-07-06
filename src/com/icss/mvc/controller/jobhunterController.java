package com.icss.mvc.controller;

import java.io.InputStream;
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
//	展示公司列表
	@RequestMapping("showBsjson")
	@ResponseBody
	public Grid fun3(@RequestParam("page") Integer page, @RequestParam("limit") Integer size, Grid Grid) throws Exception {
		System.out.println("showBsjson------------");
		List<position> jlist = dao.findList();
		System.out.println(page+size);
		return new Grid(0,"ok",jlist.size(),jlist);
	}
//	展示搜索结果
	@RequestMapping("showSearch")
	public String fun4(ModelMap mp ,String bsposition) throws Exception {
		System.out.println("showSearch------------");
		List<position> slist = dao.findSearch(bsposition);
		mp.addAttribute("sList", slist);
		return "forword:jobSerch.jsp";
	}
	
}
