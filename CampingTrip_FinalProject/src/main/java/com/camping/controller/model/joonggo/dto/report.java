package com.camping.controller.model.joonggo.dto;

import java.util.Date;

public class report {
	private int reportseq;
	private Date reportdate;
	private String reportid;
	private String reportcontent;
	private String filepath;
	private int joonggoseq;
	private String writer;
	private String status;
	private String adminid;
	private String admintext;
	
	public report() {
		super();
		// TODO Auto-generated constructor stub
	}

	public report(int reportseq, Date reportdate, String reportid, String reportcontent, String filepath, int joonggoseq,
			String writer, String status, String adminid, String admintext) {
		super();
		this.reportseq = reportseq;
		this.reportdate = reportdate;
		this.reportid = reportid;
		this.reportcontent = reportcontent;
		this.filepath = filepath;
		this.joonggoseq = joonggoseq;
		this.writer = writer;
		this.status = status;
		this.adminid = adminid;
		this.admintext = admintext;
	}

	public int getReportseq() {
		return reportseq;
	}

	public void setReportseq(int reportseq) {
		this.reportseq = reportseq;
	}

	public Date getReportdate() {
		return reportdate;
	}

	public void setReportdate(Date reportdate) {
		this.reportdate = reportdate;
	}

	public String getReportid() {
		return reportid;
	}

	public void setReportid(String reportid) {
		this.reportid = reportid;
	}

	public String getReportcontent() {
		return reportcontent;
	}

	public void setReportcontent(String reportcontent) {
		this.reportcontent = reportcontent;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public int getJoonggoseq() {
		return joonggoseq;
	}

	public void setJoonggoseq(int joonggoseq) {
		this.joonggoseq = joonggoseq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getAdmintext() {
		return admintext;
	}

	public void setAdmintext(String admintext) {
		this.admintext = admintext;
	}
	
	
}
