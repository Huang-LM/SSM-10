package com.icss.mvc.entity;

public class ResponseCode {
	private Integer code=0;
	private String msg="";
//	private byte[] jbphoto;
	
//	public byte[] getJbphoto() {
//		return jbphoto;
//	}
//
//	public void setJbphoto(byte[] jbphoto) {
//		this.jbphoto = jbphoto;
//	}

	public ResponseCode() {}

	public ResponseCode(Integer code,String msg) {
		this.code = code;
		this.msg = msg;
//		this.jbphoto=jbphoto;
	}
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
}
