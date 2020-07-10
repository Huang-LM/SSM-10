package com.icss.mvc.controller;

import java.io.File;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.icss.mvc.dao.EnterpriseDao;
import com.icss.mvc.dao.businessDao;
import com.icss.mvc.dao.jobhunterDao;
import com.icss.mvc.entity.Grid;
import com.icss.mvc.entity.ResponseCode;
import com.icss.mvc.entity.ResponseLogin;
import com.icss.mvc.entity.business;
import com.icss.mvc.entity.jobhunter;
import com.icss.mvc.entity.jobhunter_enrol;
import com.icss.mvc.entity.position;

@Controller
public class jobhunterController {
	@Autowired
	private jobhunterDao dao;
	private String entname;
	
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
	public ResponseLogin fun2(String jbusername,String jbpsw) {
		String psw=dao.jobLogin(jbusername);
		String name=dao.getJobname(jbusername);
		if(jbpsw.equals(psw)) {
			return new ResponseLogin(0,"success",name);
		}
		else {
			return new ResponseLogin(0,"fail",name);
		}
	}
//	展示公司列表
	@RequestMapping("showBsjson")
	@ResponseBody
	public Grid fun3(@RequestParam("page") Integer page, @RequestParam("limit") Integer limit, Grid Grid) throws Exception {
		System.out.println("showBsjson------------");
		List<position> jlist = dao.findList((page-1)*limit,limit);
		return new Grid(0,"ok",150,jlist);
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
//	前往公司详细页
	@RequestMapping("jobShow")
	public String fun6(ModelMap mp, String bsname) {
		System.out.println("jobShow-----"+bsname);
		mp.addAttribute("bsname", bsname);
		entname=bsname;
		return "forward:jsp/jobhunter/jobShow.jsp";
	}
//	查找公司信息
	@RequestMapping("jobShowView")
	@ResponseBody
	public List<business> fun61() {
		System.out.println("jobShow-----"+entname);
		List<business> slist = dao.findbsView(entname);
		return slist;
	}
//	添加求职简历
	@RequestMapping("addJobhunter")
	@ResponseBody
	public String fun7(jobhunter job) throws Exception {
		System.out.println("submit----------------------------"+job.getJbname());
		dao.insertJob(job);
		return "success";
	}
//	图片上传
	@RequestMapping("uppic")
	@ResponseBody
	public ResponseCode fun8(@RequestParam("file") MultipartFile pic,HttpServletRequest request) throws Exception {
		System.out.println("upper1----------------------------"+pic.getOriginalFilename());
		String path = request.getServletContext().getRealPath("/upload");
		String fileName="file"+System.currentTimeMillis()+".jpg";
		byte[] jobphoto = pic.getBytes();
		File saveFile=new File(path+"/"+fileName);
		pic.transferTo(saveFile);
		return new ResponseCode(0, jobphoto, fileName);
	}
//	后台求职者信息展示
	@RequestMapping("showJobhunter")
	@ResponseBody
	public Grid funJ(ModelMap mp) throws Exception {
		System.out.println("show -----------------------------------------");
		InputStream ins = Resources.getResourceAsStream("mybatis-cfg.xml");
		SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(ins);
		SqlSession sqlSession = sf.openSession();
		jobhunterDao dao=sqlSession.getMapper(jobhunterDao.class);
		List<jobhunter> slist = dao.findJobhunterAll();
		return new Grid(0,"ok",slist.size(),slist);
	}
	@RequestMapping("addJobhunter")
	public String fun(String jbname,String jbsex,Integer jbage,byte[] jbphoto,String jbid,String jbusername,String jbpnmb,String jbcompany,String jbjob,String jbablt) throws Exception {
		System.out.println("add -----------------------------------------");
		InputStream ins = Resources.getResourceAsStream("mybatis-cfg.xml");
		SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(ins);
		SqlSession sqlSession = sf.openSession();
		jobhunterDao dao=sqlSession.getMapper(jobhunterDao.class);
		int r = dao.insertJobhunter(jbname, jbsex, jbage, jbphoto, jbid, jbusername, jbpnmb,jbcompany, jbjob, jbablt);
		sqlSession.commit();
		return "redirect:businessMessage.jsp";
	}
}
