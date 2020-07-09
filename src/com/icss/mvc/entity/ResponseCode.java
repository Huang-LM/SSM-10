package com.icss.mvc.entity;

public class ResponseCode {
	private Integer code=0;
	private String photo="";
	private byte[] msg;
	
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public byte[] getMsg() {
		return msg;
	}

	public void setMsg(byte[] msg) {
		this.msg = msg;
	}

	public ResponseCode() {}

	public ResponseCode(Integer code,byte[] msg,String photo) {
		this.code = code;
		this.msg = msg;
		this.photo=photo;
	}
	

	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
}
