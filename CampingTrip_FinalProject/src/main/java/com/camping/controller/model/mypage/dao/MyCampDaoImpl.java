package com.camping.controller.model.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public int myPenalty(MemberDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "myPenalty", dto);
		} catch (Exception e) {
			System.out.println("[error] : myPenalty update");
			e.printStackTrace();
		}

		return res;
	}
	
	
	// 게시글 전체 목록
	@Override
	public List<MemberDto> listAll(String searchOption, String keyword) throws Exception {
		// 검색옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectList("mypage.listAll", map);
	}
	
	
	@Override
	public List<CampDto> camplistAll(String searchOption, String keyword) throws Exception {
		// 검색옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		return sqlSession.selectList("mypage.camplistAll", map);
	}
	
	
	
	@Override
	public List<report> reportlistAll(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		return sqlSession.selectList("mypage.reportlistAll", map);
	}

	
	
	
	

	// 게시글 레코드 갯수
	@Override
	public int countAtricle(String searchOption, String keyword) throws Exception {
		// 검색옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("mypage.countAtricle", map);
	}
	
	@Override
	public int campcountAtricle(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("mypage.campcountAtricle", map);
	}
	
	
	@Override
	public int reportcountAtricle(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("mypage.reportcountAtricle", map);

	}
	
	
	

	

	
	// 캠핑지 정보수정(판매자 캠핑지 리스트)
	@Override
	public List<CampDto> campInfoList(String userId) {
		return sqlSession.selectList("mypage.campInfoList", userId);
	}
	
	@Override
	public List<RoomDto> roomList(String userId) {
		return sqlSession.selectList("mypage.roomList", userId);
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

	
	/* 판매자 메인화면 */
	@Override
	public List<ReservationDto> reservList(String userId) {
		return sqlSession.selectList("mypage.reservList", userId);
	}
	
	/* 예약 detail */
	@Override
	public ReservationDto reservSelectOne(int reservno) {
		ReservationDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"reservSelectOne", reservno);
		} catch (Exception e) {
			System.out.println("[error] : reservation select one");
			e.printStackTrace();
		}
		
		return dto;
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
	public List<ReservationDto> reservFinish(String userId) {
		return sqlSession.selectList("mypage.reservFinish", userId);
	}

	@Override
	public List<ReservationDto> myreservCancel(String userId) {
		return sqlSession.selectList("mypage.myreservCancel", userId);
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

	

}
