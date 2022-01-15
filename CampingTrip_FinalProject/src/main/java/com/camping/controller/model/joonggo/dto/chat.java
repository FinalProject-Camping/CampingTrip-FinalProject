package com.camping.controller.model.joonggo.dto;

import java.util.Date;

public class chat {
	private int roomseq;
	private int chatseq;
	private String sender;
	private String content;
	private Date senddate;
	
	public chat() {
		super();
	}

	public chat(int roomseq, int chatseq, String sender, String content, Date senddate) {
		super();
		this.roomseq = roomseq;
		this.chatseq = chatseq;
		this.sender = sender;
		this.content = content;
		this.senddate = senddate;
	}

	public int getRoomseq() {
		return roomseq;
	}

	public void setRoomseq(int roomseq) {
		this.roomseq = roomseq;
	}

	public int getChatseq() {
		return chatseq;
	}

	public void setChatseq(int chatseq) {
		this.chatseq = chatseq;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getSenddate() {
		return senddate;
	}

	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}

	
	
}
