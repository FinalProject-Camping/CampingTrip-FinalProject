package com.camping.controller.model.camp.dto;

import java.text.SimpleDateFormat;
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
	private String phone="";
	private String email="";
	private String tags="";
	private int view_count;
	private double total_grade;
	private String lowest_price="0";
	private Date create_date;
	private String thumbnail;
	private String review_count;
	
	public String getReview_count() {
		return review_count;
	}


	public void setReview_count(String review_count) {
		this.review_count = review_count;
	}




	// 쿼리로 join할 dto(마이페이지 캠핑지 정보)
	private RoomDto myRoomdto;
	
	
	public CampDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public CampDto(int campno, String writer, String name, String camp_type, String address, String address_detail,
			String service, String intro, String rule, String phone, String email, String tags, int view_count,
			double total_grade, String lowest_price, Date create_date, String thumbnail, String review_count,
			RoomDto myRoomdto) {
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
		this.tags = tags;
		this.view_count = view_count;
		this.total_grade = total_grade;
		this.lowest_price = lowest_price;
		this.create_date = create_date;
		this.thumbnail = thumbnail;
		this.review_count = review_count;
		this.myRoomdto = myRoomdto;
	}


	// myRoomdto 추가
	public RoomDto getMyRoomdto() {
		return myRoomdto;
	}
	public void setMyRoomdto(RoomDto myRoomdto) {
		this.myRoomdto = myRoomdto;
	}
	
	
	

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
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
	public String date_tostr() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		return simpleDateFormat.format(create_date);
	}

	public String getTags() {
		return tags;
	}


	public void setTags(String tags) {
		this.tags = tags;
	}

	public double getTotal_grade() {
		return total_grade;
	}

	public void setTotal_grade(double total_grade) {
		this.total_grade = total_grade;
	}


	public String getLowest_price() {
		return lowest_price;
	}

	public void setLowest_price(String lowest_price) {
		this.lowest_price = lowest_price;
	}

	public String lowestprice_tostr() {
		int tmp = Integer.parseInt(lowest_price);
		String format = String.format("%,d", tmp);
		return format;
	}

	public String camptype_tostr() {
		String[] tmp = this.camp_type.split(",");
		String campType="";
		for(int i =0 ; i < tmp.length;i++) {
			if(tmp[i].equals("autocamping")) {
				if(campType.length()==0) {
					campType+="오토캠핑";
				} else {
					campType+=", 오토캠핑";
				}
			}else if(tmp[i].equals("glamping")) {
				if(campType.length()==0) {
					campType+="글램핑";
				} else {
					campType+=", 글램핑";
				}
			}else if(tmp[i].equals("caravan")) {
				if(campType.length()==0) {
					campType+="카라반";
				} else {
					campType+=", 카라반";
				}
			}else if(tmp[i].equals("pension")) {
				if(campType.length()==0) {
					campType+="펜션";
				} else {
					campType+=", 펜션";
				}
			}
		}
		return campType;
	}
	
	
	// myRoomdto 추가
	@Override
	public String toString() {
		return "CampDto [campno=" + campno + ", writer=" + writer + ", name=" + name + ", camp_type=" + camp_type
				+ ", address=" + address + ", address_detail=" + address_detail + ", service=" + service + ", intro="
				+ intro + ", rule=" + rule + ", phone=" + phone + ", email=" + email + ", tags=" + tags
				+ ", view_count=" + view_count + ", total_grade=" + total_grade + ", lowest_price=" + lowest_price
				+ ", create_date=" + create_date + ", thumbnail=" + thumbnail + ", myRoomdto=" + myRoomdto + "]";
	}
	
	
	
}
