package com.camping.controller.model.event.dto;

import java.util.Date;

import com.camping.controller.model.member.dto.MemberDto;

public class eventDto {
	private int pointSeq;
	private String pointId;
	private String pointDetail;
	private String pointGetDate;
	private int getPoint;
	private int totalPoint;
	private int usePoint;
	
	
	// 쿼리로 join할 dto(마이페이지 포인트내역)
	private MemberDto myMemberDto;
	
	public eventDto() {
		super();
	}
	
	public eventDto(int pointSeq, String pointId, String pointDetail, String pointGetDate, int getPoint, int totalPoint,
			int usePoint) {
  
		super();
		this.pointSeq = pointSeq;
		this.pointId = pointId;
		this.pointDetail = pointDetail;
		this.pointGetDate = pointGetDate;
		this.getPoint = getPoint;
		this.totalPoint = totalPoint;
		this.usePoint = usePoint;
		this.myMemberDto = myMemberDto;
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
	public String getPointGetDate() {
		return pointGetDate;
	}
	public void setPointGetDate(String pointGetDate) {
		this.pointGetDate = pointGetDate;
	}
	public int getGetPoint() {
		return getPoint;
	}
	public void setGetPoint(int getPoint) {
		this.getPoint = getPoint;
	}
	public int getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}
	public int getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}

	public MemberDto getMyMemberDto() {
		return myMemberDto;
	}

	public void setMyMemberDto(MemberDto myMemberDto) {
		this.myMemberDto = myMemberDto;
	}
	
	
	
}