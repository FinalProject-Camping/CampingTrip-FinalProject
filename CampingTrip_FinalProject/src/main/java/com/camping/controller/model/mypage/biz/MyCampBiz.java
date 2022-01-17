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
	public int memberDelete(int myno);
	public report reportSelectOne(int reportseq);
	public int myCampDelete(int campno);
	public int myPenalty(MemberDto dto);
	
	// 게시글 전체 목록 -> 검색옵션, 키워드 매개변수 추가
	public List<MemberDto> listAll(String searchOption, String keyword) throws Exception; // 회원검색
	
	public List<CampDto> camplistAll(String searchOption, String keyword) throws Exception;	// 캠핑지 검색
	
	public List<report> reportlistAll(String searchOption, String keyword) throws Exception;	// 신고내역 검색

	
	// 게시글 레코드 갯수 메서드 추가
	public int countAtricle(String searchOption, String keyword) throws Exception;
	
	public int campcountAtricle(String searchOption, String keyword) throws Exception;
	
	public int reportcountAtricle(String searchOption, String keyword) throws Exception;
	
	
	
	
	
	
	/* manager */
	public List<CampDto> campInfoList(String userId);	// 캠핑지 정보수정(판매자 캠핑지 리스트)
	public List<RoomDto> roomList(String userId);
	public RoomDto selectOne(int roomno);
	public int update(RoomDto dto);
	
	public List<ReservationDto> reservList(String userId);	/*메인화면*/
	public ReservationDto reservSelectOne(int reservno);	// reservdetail
	public int reservUpdate(ReservationDto dto);
	public int reservCancel(ReservationDto dto);
	public List<ReservationDto> reservFinish(String userId);
	public List<ReservationDto> myreservCancel(String userId);
	
	
	/* member */
	public List<joonggo> likelist(String userId);
	public List<eventDto> myPointList(String userId);
	public List<report> myReportList(String userId);
	public List<ReservationDto> myReservList(String userId);
	
	
	
}
