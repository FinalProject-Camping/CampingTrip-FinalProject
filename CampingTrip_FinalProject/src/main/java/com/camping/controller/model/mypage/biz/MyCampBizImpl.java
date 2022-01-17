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
	public int memberDelete(int myno) {
		return dao.memberDelete(myno);
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
	public int myPenalty(MemberDto dto) {
		return dao.myPenalty(dto);
	}
	
	// 게시글 전체 목록 dao.listAll메서드 호출
	@Override
	public List<MemberDto> listAll(String searchOption, String keyword) throws Exception {
		return dao.listAll(searchOption, keyword);
	}
	
	@Override
	public List<CampDto> camplistAll(String searchOption, String keyword) throws Exception {
		return dao.camplistAll(searchOption, keyword);
	}
	
	@Override
	public List<report> reportlistAll(String searchOption, String keyword) throws Exception {
		return dao.reportlistAll(searchOption, keyword);
	}

	
	
	
	
	// 게시글 레코드 갯수 dao.countAtricle 메서드
	@Override
	public int countAtricle(String searchOption, String keyword) throws Exception {
		return dao.countAtricle(searchOption, keyword);
	}
	
	@Override
	public int campcountAtricle(String searchOption, String keyword) throws Exception {
		return dao.campcountAtricle(searchOption, keyword);
	}
	
	@Override
	public int reportcountAtricle(String searchOption, String keyword) throws Exception {
		return dao.reportcountAtricle(searchOption, keyword);
	}
	
	
	
	
	
	

	@Override
	public List<CampDto> campInfoList(String userId) {
		return dao.campInfoList(userId);
	}
	
	@Override
	public List<RoomDto> roomList(String userId) {
		return dao.roomList(userId);
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
	public List<ReservationDto> reservList(String userId) {
		return dao.reservList(userId);
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
	public List<ReservationDto> reservFinish(String userId) {
		return dao.reservFinish(userId);
	}

	@Override
	public List<ReservationDto> myreservCancel(String userId) {
		return dao.myreservCancel(userId);
	}


	@Override
	public List<eventDto> myPointList(String userId) {
		return dao.myPointList(userId);
	}


	@Override
	public List<joonggo> likelist(String userId) {
		return dao.likelist(userId);
	}

	@Override
	public List<report> myReportList(String userId) {
		return dao.myReportList(userId);
	}

	@Override
	public List<ReservationDto> myReservList(String userId) {
		return dao.myReservList(userId);
	}

	@Override
	public ReservationDto reservSelectOne(int reservno) {
		return dao.reservSelectOne(reservno);
	}



}
