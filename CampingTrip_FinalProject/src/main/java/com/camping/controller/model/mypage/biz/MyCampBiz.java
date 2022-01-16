package com.camping.controller.model.mypage.biz;

import java.util.List;

import com.camping.controller.model.camp.dto.CampDto;
import com.camping.controller.model.camp.dto.ReservationDto;
import com.camping.controller.model.camp.dto.RoomDto;
import com.camping.controller.model.event.dto.eventDto;
import com.camping.controller.model.joonggo.dto.joonggo;
import com.camping.controller.model.joonggo.dto.report;
import com.camping.controller.model.member.dto.MemberDto;


public interface MyCampBiz {
	
	/* admin */
	public List<CampDto> campList();
	public List<MemberDto> memberList();
	public int memberDelete(int myno);
	public List<report> reportList();
	public report reportSelectOne(int reportseq);
	public int myCampDelete(int campno);
	
	
	/* manager */
	public List<RoomDto> campInfoList();
	public RoomDto selectOne(int roomno);
	public int update(RoomDto dto);
	
	public List<ReservationDto> reservList();
	public int reservUpdate(ReservationDto dto);
	public int reservCancel(ReservationDto dto);
	public List<ReservationDto> reservFinish();
	public List<ReservationDto> myreservCancel();
	
	
	/* member */
	public List<joonggo> likeList();
	public List<MemberDto> myPointList();
}
