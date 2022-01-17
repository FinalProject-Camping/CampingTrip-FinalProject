package com.camping.controller.model.joonggo.dto;

import java.util.Date;

public class chatroom {
	private int roomseq;
	private int joonggoseq;
	private String title;
	private String imglist;
	private String userid;
	private String writer;
	private String writer_fix;
	private Date createdate;
	public chatroom() {
		super();
		// TODO Auto-generated constructor stub
	}
	public chatroom(int roomseq, int joonggoseq, String title, String imglist, String userid, String writer,
			Date createdate) {
		super();
		this.roomseq = roomseq;
		this.joonggoseq = joonggoseq;
		this.title = title;
		this.imglist = imglist;
		this.userid = userid;
		this.writer = writer;
		this.createdate = createdate;
	}
	public int getRoomseq() {
		return roomseq;
	}
	public void setRoomseq(int roomseq) {
		this.roomseq = roomseq;
	}
	public int getJoonggoseq() {
		return joonggoseq;
	}
	public void setJoonggoseq(int joonggoseq) {
		this.joonggoseq = joonggoseq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImglist() {
		return imglist;
	}
	public void setImglist(String imglist) {
		this.imglist = imglist;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public String getWriter_fix() {
		return writer_fix;
	}
	public void setWriter_fix(String writer_fix) {
		this.writer_fix = writer_fix;
	}
	
	

}
