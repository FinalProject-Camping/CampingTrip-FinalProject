package com.camping.controller.model.joonggo.dto;

import java.util.Date;

public class renew {
	private int renewseq;
	private Date renewdate;
	private int joonggoseq;
	
	public renew() {
		super();
		// TODO Auto-generated constructor stub
	}

	public renew(int renewseq, Date renewdate, int joonggoseq) {
		super();
		this.renewseq = renewseq;
		this.renewdate = renewdate;
		this.joonggoseq = joonggoseq;
	}

	public int getRenewseq() {
		return renewseq;
	}

	public void setRenewseq(int renewseq) {
		this.renewseq = renewseq;
	}

	public Date getRenewdate() {
		return renewdate;
	}

	public void setRenewdate(Date renewdate) {
		this.renewdate = renewdate;
	}

	public int getJoonggoseq() {
		return joonggoseq;
	}

	public void setJoonggoseq(int joonggoseq) {
		this.joonggoseq = joonggoseq;
	} 
	
	

}
