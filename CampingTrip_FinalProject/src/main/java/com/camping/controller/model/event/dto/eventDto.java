package com.camping.controller.model.event.dto;

import java.util.Date;

public class eventDto {
	private int pointSeq;
	private String pointId;
	private String pointDetail;
	private Date pointGetDate;
	private int getPoint;
	private int usePoint;
	private int totalPoint;
	private String pointImg;
	
	public eventDto() {
		super();
	}
	
	public eventDto(int pointSeq, String pointId, String pointDetail, Date pointGetDate, int getPoint, int usePoint,
			int totalPoint, String pointImg) {
		super();
		this.pointSeq = pointSeq;
		this.pointId = pointId;
		this.pointDetail = pointDetail;
		this.pointGetDate = pointGetDate;
		this.getPoint = getPoint;
		this.usePoint = usePoint;
		this.totalPoint = totalPoint;
		this.pointImg = pointImg;
	}
	
	public int getPointSeq() {
		return pointSeq;
	}

	public void setPointSeq(int pointSeq) {
		this.pointSeq = pointSeq;
	}

	public String getPointId() {
		return pointId;
	}

	public void setPointId(String pointId) {
		this.pointId = pointId;
	}

	public String getPointDetail() {
		return pointDetail;
	}

	public void setPointDetail(String pointDetail) {
		this.pointDetail = pointDetail;
	}

	public Date getPointGetDate() {
		return pointGetDate;
	}

	public void setPointGetDate(Date pointGetDate) {
		this.pointGetDate = pointGetDate;
	}

	public int getGetPoint() {
		return getPoint;
	}

	public void setGetPoint(int getPoint) {
		this.getPoint = getPoint;
	}

	public int getUsePoint() {
		return usePoint;
	}

	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}

	public int getTotalPoint() {
		return totalPoint;
	}

	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}
	
	public String getPointImg() {
		return pointImg;
	}

	public void setPointImg(String pointImg) {
		this.pointImg = pointImg;
	}
}