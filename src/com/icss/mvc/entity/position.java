package com.icss.mvc.entity;

import org.apache.solr.client.solrj.beans.Field;

public class position {
	@Field
	private String bsname;
	@Field
	private String bsclass;
	@Field
	private String bsposition;
	@Field
	private String bspay;
	public String getBsname() {
		return bsname;
	}
	public void setBsname(String bsname) {
		this.bsname = bsname;
	}
	public String getBsclass() {
		return bsclass;
	}
	public void setBsclass(String bsclass) {
		this.bsclass = bsclass;
	}
	public String getBsposition() {
		return bsposition;
	}
	public void setBsposition(String bsposition) {
		this.bsposition = bsposition;
	}
	public String getBspay() {
		return bspay;
	}
	public void setBspay(String bspay) {
		this.bspay = bspay;
	}
	
}
