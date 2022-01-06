package com.camping.controller.model.camp.dto;

import java.util.Date;

public class CampDto {
	private int campno;
	private String writer;
	private String name;
	private String camp_type;
	private String address;
	private String address_detail;
	private String service;
	private String intro;
	private String rule;
	private String phone;
	private String email;
	private int view_count;
	private Date create_date;
	
	public CampDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public int getCampno() {
		return campno;
	}

	public void setCampno(int campno) {
		this.campno = campno;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	

	public CampDto(int campno, String writer, String name, String camp_type, String address, String address_detail,
			String service, String intro, String rule, String phone, String email, int view_count, Date create_date) {
		super();
		this.campno = campno;
		this.writer = writer;
		this.name = name;
		this.camp_type = camp_type;
		this.address = address;
		this.address_detail = address_detail;
		this.service = service;
		this.intro = intro;
		this.rule = rule;
		this.phone = phone;
		this.email = email;
		this.view_count = view_count;
		this.create_date = create_date;
	}



	public String getCamp_type() {
		return camp_type;
	}



	public void setCamp_type(String camp_type) {
		this.camp_type = camp_type;
	}



	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getRule() {
		return rule;
	}

	public void setRule(String rule) {
		this.rule = rule;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	
	
}
