package com.camping.controller.model.joonggo.dto;

import java.util.Date;

public class heart {
	private Date heartdate;
	private String heartid;
	private int joonggoseq;
	
	
	
	public heart() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public heart(Date heartdate, String heartid, int joonggoseq) {
		super();
		this.heartdate = heartdate;
		this.heartid = heartid;
		this.joonggoseq = joonggoseq;
	}



	public Date getHeartdate() {
		return heartdate;
	}
	public void setHeartdate(Date heartdate) {
		this.heartdate = heartdate;
	}
	public String getHeartid() {
		return heartid;
	}
	public void setHeartid(String heartid) {
		this.heartid = heartid;
	}
	public int getJoonggoseq() {
		return joonggoseq;
	}
	public void setJoonggoseq(int joonggoseq) {
		this.joonggoseq = joonggoseq;
	}
	
	

}
