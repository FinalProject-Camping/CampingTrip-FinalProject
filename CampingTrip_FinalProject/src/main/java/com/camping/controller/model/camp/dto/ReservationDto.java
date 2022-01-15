package com.camping.controller.model.camp.dto;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ReservationDto {
	
	private int reservno;
	private int campno;
	private int roomno;
	private String userid;
	private String user_name;
	private String user_contact;
	private int guest_number;	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date check_in;	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date check_out;
	private String status;
	private Date create_date;
	
	
	// 쿼리로 join할 dto(마이페이지 캠핑 예약 정보)
	private RoomDto myRoomdto;
	private CampDto myCampDto;
	
	
	public ReservationDto() {
		super();
		// TODO Auto-generated constructor stub
	}	
	
	

	// myRoomdto, myCampDto 추가
	public ReservationDto(int reservno, int campno, int roomno, String userid, String user_name, String user_contact,
			int guest_number, Date check_in, Date check_out, String status, Date create_date, RoomDto myRoomdto,
			CampDto myCampDto) {
		super();
		this.reservno = reservno;
		this.campno = campno;
		this.roomno = roomno;
		this.userid = userid;
		this.user_name = user_name;
		this.user_contact = user_contact;
		this.guest_number = guest_number;
		this.check_in = check_in;
		this.check_out = check_out;
		this.status = status;
		this.create_date = create_date;
		this.myRoomdto = myRoomdto;
		this.myCampDto = myCampDto;
	}

	
	// myRoomdto, myCampDto 추가
	public RoomDto getMyRoomdto() {
		return myRoomdto;
	}
	public void setMyRoomdto(RoomDto myRoomdto) {
		this.myRoomdto = myRoomdto;
	}

	public CampDto getMyCampDto() {
		return myCampDto;
	}
	public void setMyCampDto(CampDto myCampDto) {
		this.myCampDto = myCampDto;
	}

	
	


	public int getCampno() {
		return campno;
	}
	public void setCampno(int campno) {
		this.campno = campno;	}

	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getReservno() {
		return reservno;
	}
	public void setReservno(int reservno) {
		this.reservno = reservno;
	}
	public int getRoomno() {
		return roomno;
	}
	public void setRoomno(int roomno) {
		this.roomno = roomno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getGuest_number() {
		return guest_number;
	}
	public void setGuest_number(int guest_number) {
		this.guest_number = guest_number;
	}
	public Date getCheck_in() {
		return check_in;
	}
	public void setCheck_in(Date check_in) {
		this.check_in = check_in;
	}
	public Date getCheck_out() {
		return check_out;
	}
	public void setCheck_out(Date check_out) {
		this.check_out = check_out;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_contact() {
		return user_contact;
	}
	public void setUser_contact(String user_contact) {
		this.user_contact = user_contact;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public String checkin_tostr() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		return simpleDateFormat.format(check_in);
	}
	public String checkout_tostr() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		//날짜 하루 더하기
		Date time= check_out;
		Calendar cal = Calendar.getInstance();
		cal.setTime(time);
		cal.add(Calendar.DATE, 1);
		
		return simpleDateFormat.format(cal.getTime());
	}
	public String date_tostr() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		return simpleDateFormat.format(create_date);
	}

	
	

	// myRoomdto, myCampDto 추가
	@Override
	public String toString() {
		return "ReservationDto [reservno=" + reservno + ", campno=" + campno + ", roomno=" + roomno + ", userid="
				+ userid + ", user_name=" + user_name + ", user_contact=" + user_contact + ", guest_number="
				+ guest_number + ", check_in=" + check_in + ", check_out=" + check_out + ", status=" + status
				+ ", create_date=" + create_date + ", myRoomdto=" + myRoomdto + ", myCampDto=" + myCampDto + "]";
	}

	
}
