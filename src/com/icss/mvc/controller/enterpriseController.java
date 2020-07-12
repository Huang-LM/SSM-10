package com.icss.mvc.controller;

import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icss.mvc.dao.EnterpriseDao;
import com.icss.mvc.entity.Grid;
import com.icss.mvc.entity.business;
import com.icss.mvc.entity.business_enrol;
import com.icss.mvc.entity.jobhunter;
import com.icss.mvc.entity.position;

@Controller
public class enterpriseController {
	@Autowired
	private EnterpriseDao entdao;
	@Autowired
	private HttpSolrClient client;
	
	public String entname;
	public String id;
	public String job;
	public String status;
	
	/* 企业注册 */
	@RequestMapping("enterpriseSignUp")
	@ResponseBody
	public String fune1(business_enrol buen) {
		System.out.println("Enterprise Sign Up---------------");
		int a=entdao.enterpriseSignup(buen);
		return "success";
	}
	
	/* 企业登录 */
	@RequestMapping("enterpriseSignIn")
	@ResponseBody
	public String fune2(String bsname,String bspsw) {
		System.out.println("Enterprise Sign In---------------");
		entname = bsname;
		String psw=entdao.enterpriseSignin(bsname);
		if(bspsw.equals(psw)) {
			return "success";
		}
		else {
			return "fail";
		}
	}
	
	/* 企业基本信息 */
	/*@RequestMapping("findEntInfor")
	@ResponseBody
	public Grid fune3(ModelMap mp) {
	  	  System.out.println("Find Enterprise Information---------------"+name);
		  List<business> bus = entdao.findEntInfor(entname);
		  return new Grid(0,"ok",8,bus);
	}*/
	@RequestMapping("findEntInfor")
	@ResponseBody
	public List<business> fune4() {
	  	  System.out.println("Find Enterprise Information---------------");
		  List<business> bus = entdao.findEntInfor(entname);
		  return bus;
	}
	
	/* 企业招聘信息 */
	@RequestMapping("entFindPosition")
	@ResponseBody
	public Grid fune5(Integer page, Integer limit) {
	  	  System.out.println("Enterprise Find Position---------------");
		  List<position> pos = entdao.entFindPosition(entname, (page-1)*limit, limit);
		  int c = entdao.entFindPositionCount(entname);
		  return new Grid(0,"ok",c,pos);
	}
	
	/* 修改企业基本信息 */
	@RequestMapping("updEntInfor")
	@ResponseBody
	public String fune6(business bus) {
	  	  System.out.println("Update Enterprise Information---------------");
		  int a = entdao.updEntInfor(bus);
		  if(a==1) {
			  return "success";
		  }
		  else {
			  return "fail";
		  }
	}

	/* 修改企业基本信息表单赋值 */
	@RequestMapping("altEntInfor") 
	public String fun5(ModelMap mp) {
		System.out.println("Auto Fill---------------"); 
		business bus = entdao.autoFill(entname); 
		mp.addAttribute("bus",bus);
		return "forward:jsp/enterprise/alterEnterpriseInfor.jsp";
	}
	
	/* 发布招聘信息 */
	@RequestMapping("entJobPosting")
	@ResponseBody
	public String fune7(position pos) {
	  	  System.out.println("Enterprise Job Posting---------------");
		  int a = entdao.entJobPosting(pos);
		  if(a==1) {
			  return "success";
		  }
		  else {
			  return "fail";
		  }
	}
	
	/* 管理招聘信息 */
	@RequestMapping("delRecrInfor")
	@ResponseBody
	public String fune8(String bsposition) {
	  	  System.out.println("Delete Recruit Information---------------");
		  int a = entdao.delRecrInfor(entname, bsposition);
		  if(a==1) {
			  return "success";
		  }
		  else {
			  return "fail";
		  }
	}

	/* 查看应聘者 */
	@RequestMapping("findJobHunter")
	@ResponseBody
	public Grid fune9() {
	  	  System.out.println("Find Job Hunter---------------");
		  List<jobhunter> jh = entdao.findJobHunter(entname);
		  int c = entdao.findJobHunterCount(entname);
		  return new Grid(0,"ok",c,jh);
	}

	/* 获取应聘者身份证号 */
	@RequestMapping("acquireId")
	@ResponseBody
	public String fune10(String jbid, String jbjob, String interstatus) {
	  	  System.out.println("Acquire ID---------------");
	  	  id = jbid;
	  	  job = jbjob;
	  	  status = interstatus;
		  return "success";
	}

	/* 应聘者基本信息 */
	@RequestMapping("showJobHunter")
	@ResponseBody
	public List<jobhunter> fune11() {
	  	  System.out.println("Show Job Hunter---------------");
		  List<jobhunter> jh = entdao.showJobHunter(id);
		  return jh;
	}

	/* 应聘者简历 */
	@RequestMapping("showResume")
	public void fune12(HttpServletResponse response) throws Exception {
		System.out.println("Show Resume---------------");
		jobhunter jhp = entdao.showResume(id);
		response.setContentType("image/jpeg");
		ServletOutputStream out = response.getOutputStream();
		out.write(jhp.getJbphoto());
		out.flush();
		out.close();
	}
 
	/* 预约面试 */
	@RequestMapping("orderInterview")
	public String fune13() {
	  	  System.out.println("Order Interview---------------");
		  entdao.orderInterview(id, entname, job);
		  return "jsp/enterprise/entJobHunter";
	}

	/* 面试成功 */
	@RequestMapping("interviewSuccess")
	public String fune14() {
	  	  System.out.println("Interview Success---------------");
		  entdao.interviewSuccess(id, entname, job);
		  return "jsp/enterprise/entJobHunter";
	}

	/* 面试失败 */
	@RequestMapping("interviewFail")
	public String fune15() {
	  	  System.out.println("Interview Fail---------------");
		  entdao.interviewFail(id, entname, job);
		  return "jsp/enterprise/entJobHunter";
	}

	/* 查看面试状态 */
	@RequestMapping("findInterviewStatus")
	public String fune16(ModelMap mp) {
	  	  System.out.println("Find Interview Status---------------");
	  	  //status = entdao.findInterStatus(id, entname, job);
	  	  mp.addAttribute("status",status);
		  return "forward:jsp/enterprise/showJobHunter.jsp";
	}
	
	@RequestMapping("searchJobhunterSolr")
	@ResponseBody
	public List<jobhunter> fun17(String jbablt) throws Exception {
		 System.out.println("Search Jobhunter Solr---------------");
		 SolrQuery query=new SolrQuery();
		 query.set("q","jbablt:"+jbablt);
		 QueryResponse res = client.query(query);
		 List<jobhunter> jlist=res.getBeans(jobhunter.class);
		 return jlist;
	}
	
	@RequestMapping("findAllJobHunter")
	@ResponseBody
	public Grid fune18() {
	  	  System.out.println("Find All Job Hunter---------------");
		  List<jobhunter> alljh = entdao.findAllJobHunter();
		  int c = entdao.findAllJobHunterCount();
		  return new Grid(0,"ok",c,alljh);
	}
	

	
}