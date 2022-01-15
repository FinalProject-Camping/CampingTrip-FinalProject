package com.camping.controller.model.camp.dto;

import java.util.Date;

public class RoomDto {

	private int roomno;
	private int campno;
	private String room_name;
	private String room_price;
	private String guest_number;
	private String room_content;
	private String thumbnail;
	
	// 쿼리로 join할 dto(마이페이지 캠핑지 정보)
	private CampDto myCampDto;
	

	public RoomDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	// myCampDto 추가
	public RoomDto(int roomno, int campno, String room_name, String room_price, String guest_number,
			String room_content, String thumbnail, CampDto myCampDto) {
		super();
		this.roomno = roomno;
		this.campno = campno;
		this.room_name = room_name;
		this.room_price = room_price;
		this.guest_number = guest_number;
		this.room_content = room_content;
		this.thumbnail = thumbnail;
		this.myCampDto = myCampDto;
	}

	
	
	// myCampDto 추가
	public CampDto getMyCampDto() {
		return myCampDto;
	}
	public void setMyCampDto(CampDto myCampDto) {
		this.myCampDto = myCampDto;
	}


	
	
	
	
	
	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public String getRoom_content() {
		return room_content;
	}

	public void setRoom_content(String room_content) {
		this.room_content = room_content;
	}

	public int getRoomno() {
		return roomno;
	}

	public void setRoomno(int roomno) {
		this.roomno = roomno;
	}

	public int getCampno() {
		return campno;
	}

	public void setCampno(int campno) {
		this.campno = campno;
	}

	public String getRoom_price() {
		return room_price;
	}

	public void setRoom_price(String room_price) {
		this.room_price = room_price;
	}

	public String getGuest_number() {
		return guest_number;
	}

	public void setGuest_number(String guest_number) {
		this.guest_number = guest_number;
	}
	
	public String price_tostr() {
		int tmp = Integer.parseInt(room_price);
		String format = String.format("%,d", tmp);
		return format;
	}
}
