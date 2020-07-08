package com.icss.mvc.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.icss.mvc.dao.jobhunterDao;
import com.icss.mvc.entity.Grid;
import com.icss.mvc.entity.ResponseCode;
import com.icss.mvc.entity.jobhunter;
import com.icss.mvc.entity.jobhunter_enrol;
import com.icss.mvc.entity.position;

@Controller
public class jobhunterController {
	@Autowired
	private jobhunterDao dao;
	
//	注册
	@RequestMapping("jobEnrol")
	@ResponseBody
	public String fun1(jobhunter_enrol jobenrol) {
		System.out.println("job Enrol----------");
		int j=dao.jobEnrol(jobenrol);
		return "success";
	}
//	登录
	@RequestMapping("jobLogin")
	@ResponseBody
	public String fun2(String jbusername,String jbpsw) {
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
//	前往应聘页
	@RequestMapping("jobSub")
	public String fun5(ModelMap mp, String bsname,String bsposition) {
		System.out.println("jobSub-----"+bsposition+" | " + bsname);
		mp.addAttribute("bsname", bsname);
		mp.addAttribute("bsposition", bsposition);
		return "forward:jsp/jobhunter/jobSubmit.jsp";
	}
//	添加求职简历
	@RequestMapping("addJobhunter")
	@ResponseBody
	public ResponseCode fun6(jobhunter job) throws Exception {
		System.out.println("submit----------------------------"+job.getJbname());
		dao.insertJob(job);
		return new ResponseCode(0, "success");
	}
//	图片上传
	@RequestMapping("uppic")
	@ResponseBody
	public ResponseCode fun7(@RequestParam("file") MultipartFile pic,HttpServletRequest request) throws Exception {
		System.out.println("upper1----------------------------"+pic.getOriginalFilename());
		String path = request.getServletContext().getRealPath("/upload");
		String fileName="file"+System.currentTimeMillis()+".jpg";
		File saveFile=new File(path+"/"+fileName);
		pic.transferTo(saveFile);
//		byte[] jobphoto = pic.getBytes();
		return new ResponseCode(0, fileName);
	}
}
