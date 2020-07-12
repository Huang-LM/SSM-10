package com.icss.mvc.entity;

import org.apache.solr.client.solrj.beans.Field;

public class jobhunter {
	@Field
	private String jbname;
	@Field
	private String jbsex;
	@Field
	private Integer jbage;
	private byte[] jbphoto;
	private String jbid;
    private String jbusername;
    private String jbpnmb;
    @Field
    private String jbcompany;
    @Field
    private String jbjob;
    @Field
    private String jbablt;
    private String interstatus;
	public String getInterstatus() {
		return interstatus;
	}
	public void setInterstatus(String interstatus) {
		this.interstatus = interstatus;
	}
	public String getJbname() {
		return jbname;
	}
	public void setJbname(String jbname) {
		this.jbname = jbname;
	}
	public String getJbsex() {
		return jbsex;
	}
	public void setJbsex(String jbsex) {
		this.jbsex = jbsex;
	}
	public Integer getJbage() {
		return jbage;
	}
	public void setJbage(Integer jbage) {
		this.jbage = jbage;
	}
	public byte[] getJbphoto() {
		return jbphoto;
	}
	public void setJbphoto(byte[] jbphoto) {
		this.jbphoto = jbphoto;
	}
	public String getJbid() {
		return jbid;
	}
	public void setJbid(String jbid) {
		this.jbid = jbid;
	}
	public String getJbusername() {
		return jbusername;
	}
	public void setJbusername(String jbusername) {
		this.jbusername = jbusername;
	}
	public String getJbpnmb() {
		return jbpnmb;
	}
	public void setJbpnmb(String jbpnmb) {
		this.jbpnmb = jbpnmb;
	}
	public String getJbcompany() {
		return jbcompany;
	}
	public void setJbcompany(String jbcompany) {
		this.jbcompany = jbcompany;
	}
	public String getJbjob() {
		return jbjob;
	}
	public void setJbjob(String jbjob) {
		this.jbjob = jbjob;
	}
	public String getJbablt() {
		return jbablt;
	}
	public void setJbablt(String jbablt) {
		this.jbablt = jbablt;
	}
    
}
