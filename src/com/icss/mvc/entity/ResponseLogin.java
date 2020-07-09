package com.icss.mvc.entity;

public class ResponseLogin {
	private Integer code;
	private String msg="";
	private String name;
	
	public ResponseLogin() {}

	public ResponseLogin(Integer code,String msg,String name) {
		this.code = code;
		this.msg = msg;
		this.name = name;
	}
	
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	

}
