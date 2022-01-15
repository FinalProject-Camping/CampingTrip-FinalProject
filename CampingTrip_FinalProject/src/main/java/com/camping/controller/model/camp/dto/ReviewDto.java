package com.camping.controller.model.camp.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ReviewDto {
	private int reviewno;
	private int campno;
	private String writer;
	private String title;
	private String content;
	private double service;
	private double cost;
	private double cleanliness;
	private double location;
	private double total;
	private String thumbnail;
	private Date create_date;
	
	public ReviewDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ReviewDto(int reviewno, int campno, String writer, String title, String content, double service, double cost,
			double cleanliness, double location, double total, String thumbnail, Date create_date) {
		super();
		this.reviewno = reviewno;
		this.campno = campno;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.service = service;
		this.cost = cost;
		this.cleanliness = cleanliness;
		this.location = location;
		this.total = total;
		this.thumbnail = thumbnail;
		this.create_date = create_date;
	}
	
	public int getReviewno() {
		return reviewno;
	}
	public void setReviewno(int reviewno) {
		this.reviewno = reviewno;
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
	public double getService() {
		return service;
	}
	public void setService(double service) {
		this.service = service;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public double getCleanliness() {
		return cleanliness;
	}
	public void setCleanliness(double cleanliness) {
		this.cleanliness = cleanliness;
	}
	public double getLocation() {
		return location;
	}
	public void setLocation(double location) {
		this.location = location;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
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
	@Override
	public String toString() {
		return "ReviewDto [reviewno=" + reviewno + ", campno=" + campno + ", writer=" + writer + ", title=" + title
				+ ", content=" + content + ", service=" + service + ", cost=" + cost + ", cleanliness=" + cleanliness
				+ ", location=" + location + ", total=" + total + ", thumbnail=" + thumbnail + ", create_date="
				+ create_date + "]";
	}
	
}
