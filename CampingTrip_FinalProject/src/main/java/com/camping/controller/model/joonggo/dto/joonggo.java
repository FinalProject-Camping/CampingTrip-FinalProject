package com.camping.controller.model.joonggo.dto;

import java.util.Date;

public class joonggo {
	private int seq;
	private String id;
	private String phone;
	private String email;
	private Date regdate;
	private String title;
	private String content;
	private String category;
	private int price;
	private String place;
	private String tag;
	private String quality;
	private String delivery;
	private String agree;
	private String trade;
	private int hit;
	private int heart;
	private String imglist;
	
	public joonggo() {
		super();
	}

	public joonggo(int seq, String id, String phone, String email, Date regdate, String title, String content,
			String category, int price, String place, String tag, String quality, String delivery, String agree,
			String trade, int hit, int heart, String imglist) {
		super();
		this.seq = seq;
		this.id = id;
		this.phone = phone;
		this.email = email;
		this.regdate = regdate;
		this.title = title;
		this.content = content;
		this.category = category;
		this.price = price;
		this.place = place;
		this.tag = tag;
		this.quality = quality;
		this.delivery = delivery;
		this.agree = agree;
		this.trade = trade;
		this.hit = hit;
		this.heart = heart;
		this.imglist = imglist;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getQuality() {
		return quality;
	}

	public void setQuality(String quality) {
		this.quality = quality;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getAgree() {
		return agree;
	}

	public void setAgree(String agree) {
		this.agree = agree;
	}

	public String getTrade() {
		return trade;
	}

	public void setTrade(String trade) {
		this.trade = trade;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getHeart() {
		return heart;
	}

	public void setHeart(int heart) {
		this.heart = heart;
	}

	public String getImglist() {
		return imglist;
	}

	public void setImglist(String imglist) {
		this.imglist = imglist;
	}

	

	
	

	

}
