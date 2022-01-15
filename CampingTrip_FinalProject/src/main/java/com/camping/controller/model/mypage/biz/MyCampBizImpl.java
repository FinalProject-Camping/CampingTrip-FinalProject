package com.camping.controller.model.mypage.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.controller.model.camp.dto.CampDto;
import com.camping.controller.model.camp.dto.ReservationDto;
import com.camping.controller.model.camp.dto.RoomDto;
import com.camping.controller.model.event.dto.eventDto;
import com.camping.controller.model.joonggo.dto.joonggo;
import com.camping.controller.model.joonggo.dto.report;
import com.camping.controller.model.member.dto.MemberDto;
import com.camping.controller.model.mypage.dao.MyCampDao;


@Service
public class MyCampBizImpl implements MyCampBiz {
	
	@Autowired
	private MyCampDao dao;

	@Override
	public List<CampDto> campList() {
		return dao.campList();
	}

	@Override
	public List<MemberDto> memberList() {
		return dao.memberList();
	}

	@Override
	public int memberDelete(int myno) {
		return dao.memberDelete(myno);
	}

	@Override
	public List<MemberDto> reportList() {
		return dao.reportList();
	}
	
	@Override
	public report reportSelectOne(int reportseq) {
		return dao.reportSelectOne(reportseq);
	}
	
	@Override
	public int myCampDelete(int campno) {
		return dao.myCampDelete(campno);
	}

	@Override
	public List<RoomDto> campInfoList() {
		return dao.campInfoList();
	}

	@Override
	public RoomDto selectOne(int roomno) {
		return dao.selectOne(roomno);
	}

	@Override
	public int update(RoomDto dto) {
		return dao.update(dto);
	}
	
	
	@Override
	public List<ReservationDto> reservList() {
		return dao.reservList();
	}

	@Override
	public int reservUpdate(ReservationDto dto) {
		return dao.reservUpdate(dto);
	}

	@Override
	public int reservCancel(ReservationDto dto) {
		return dao.reservCancel(dto);
	}

	@Override
	public List<ReservationDto> reservFinish() {
		return dao.reservFinish();
	}

	@Override
	public List<ReservationDto> myreservCancel() {
		return dao.myreservCancel();
	}

	@Override
	public List<joonggo> likeList() {
		return dao.likeList();
	}

	@Override
	public List<eventDto> myPointList() {
		return dao.myPointList();
	}


}
