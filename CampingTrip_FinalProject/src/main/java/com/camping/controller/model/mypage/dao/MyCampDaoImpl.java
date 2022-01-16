package com.camping.controller.model.mypage.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.controller.model.camp.dto.CampDto;
import com.camping.controller.model.camp.dto.ReservationDto;
import com.camping.controller.model.camp.dto.RoomDto;
import com.camping.controller.model.event.dto.eventDto;
import com.camping.controller.model.joonggo.dto.joonggo;
import com.camping.controller.model.joonggo.dto.report;
import com.camping.controller.model.member.dto.MemberDto;



@Repository
public class MyCampDaoImpl implements MyCampDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CampDto> campList() {
		List<CampDto> list = new ArrayList<CampDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "campList");
		} catch (Exception e) {
			System.out.println("[error] : camp list");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<MemberDto> memberList() {
		List<MemberDto> list = new ArrayList<MemberDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"memberList");
		} catch (Exception e) {
			System.out.println("[error] : member list");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int memberDelete(int myno) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"memberDelete", myno);
		} catch (Exception e) {
			System.out.println("[error] : delete");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<report> reportList() {
		List<report> list = new ArrayList<report>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"reportList");
		} catch (Exception e) {
			System.out.println("[error] : report list");
			e.printStackTrace();
		}
		
		return list;

	}
	
	
	@Override
	public report reportSelectOne(int reportseq) {
		report dto = null;

		try {
			dto = sqlSession.selectOne(NAMESPACE + "reportSelectOne", reportseq);
		} catch (Exception e) {
			System.out.println("[error] : report select one");
			e.printStackTrace();
		}

		return dto;
	}
	
	
	@Override
	public int myCampDelete(int campno) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "myCampDelete", campno);
		} catch (Exception e) {
			System.out.println("[error] : camp delete");
			e.printStackTrace();
		}

		return res;
	}

	
	

	
	
	@Override
	public List<RoomDto> campInfoList() {
		List<RoomDto> list = new ArrayList<RoomDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "campInfoList");
		} catch (Exception e) {
			System.out.println("[error] : camp info list");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public RoomDto selectOne(int roomno) {
		RoomDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", roomno);
		} catch (Exception e) {
			System.out.println("[error] : select one");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int update(RoomDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update", dto);
		} catch (Exception e) {
			System.out.println("[error] : update");
			e.printStackTrace();
		}
		
		return res;
	}

	
	
	@Override
	public List<ReservationDto> reservList() {
		List<ReservationDto> list = new ArrayList<ReservationDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "reservList");
		} catch (Exception e) {
			System.out.println("[error] : reservation list");
			e.printStackTrace();
		}

		return list;
	}

	
	@Override
	public int reservUpdate(ReservationDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"reservUpdate", dto);
		} catch (Exception e) {
			System.out.println("[error] : reservation update");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int reservCancel(ReservationDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"reservCancel", dto);
		} catch (Exception e) {
			System.out.println("[error] : reservation cancel");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<ReservationDto> reservFinish() {
		List<ReservationDto> list = new ArrayList<ReservationDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "reservFinish");
		} catch (Exception e) {
			System.out.println("[error] : reservation finish list");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ReservationDto> myreservCancel() {
		List<ReservationDto> list = new ArrayList<ReservationDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"myreservCancel");
		} catch (Exception e) {
			System.out.println("[error] : reservation cancel list");
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<eventDto> myPointList(String userId) {
		return sqlSession.selectList("mypage.myPointList", userId);
	}


	@Override
	public List<joonggo> likelist(String userId) {
		return sqlSession.selectList("mypage.likelist", userId);
	}

	@Override
	public List<report> myReportList(String userId) {
		return sqlSession.selectList("mypage.myReportList", userId);
	}

	@Override
	public List<ReservationDto> myReservList(String userId) {
		return sqlSession.selectList("mypage.myReservList", userId);
	}

//	@Override
//	public List<ReservationDto> myCalendarList() {
//		List<ReservationDto> calendar = null;
//		calendar = sqlSession.selectList(NAMESPACE+"myCalendarList");
//		return calendar;
//	}

	
	
	

	

	

}
