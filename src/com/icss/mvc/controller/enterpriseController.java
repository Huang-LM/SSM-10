package com.icss.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icss.mvc.dao.EnterpriseDao;
import com.icss.mvc.entity.business;
import com.icss.mvc.entity.business_enrol;
import com.icss.mvc.entity.jobhunter;
import com.icss.mvc.entity.position;

@Controller
public class enterpriseController {
	@Autowired
	private EnterpriseDao entdao;
	
	public String entname;
	public String id;
	
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
	public List<position> fune5() {
	  	  System.out.println("Enterprise Find Position---------------");
		  List<position> pos = entdao.entFindPosition(entname);
		  return pos;
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
	public List<jobhunter> fune9() {
	  	  System.out.println("Find Job Hunter---------------");
		  List<jobhunter> jh = entdao.findJobHunter(entname);
		  return jh;
	}

	/* 获取应聘者身份证号 */
	@RequestMapping("acquireId")
	@ResponseBody
	public String fune10(String jbid) {
	  	  System.out.println("Acquire ID---------------");
	  	  id = jbid;
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
	
	
	
}