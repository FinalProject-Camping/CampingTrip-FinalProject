package com.camping.controller.model.camp.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.controller.model.camp.dto.CampDto;
import com.camping.controller.model.camp.dto.CampImageDto;
import com.camping.controller.model.camp.dto.ReservationDto;
import com.camping.controller.model.camp.dto.ReviewDto;
import com.camping.controller.model.camp.dto.RoomDto;
import com.camping.controller.model.camp.dto.RoomImageDto;
import com.camping.controller.model.camp.dto.SearchInfo;
import com.camping.controller.model.camp.dto.WriterInfo;

@Repository
public class CampDao {
	
	String NAMESPACE="camp.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<CampDto> selectAllCamp(){
		List <CampDto> res = new ArrayList<CampDto>();
		
		try {
			res=sqlSession.selectList(NAMESPACE+"selectAllCamp");
		} catch (Exception e) {
			System.out.println("[error]: selectAll camp");
			e.printStackTrace();
		}
		
		return res;
	}
	
	public CampDto selectOne(int campno) {
		CampDto res=null;
		
		try {
			res=sqlSession.selectOne(NAMESPACE+"selectOneCamp",campno);
		} catch (Exception e) {
			System.out.println("[error]: selectOne Camp");
			e.printStackTrace();
		}
		
		return res;
	}
	
	public List<RoomDto> selectAllRoom(int campno){
		List<RoomDto> res = new ArrayList<RoomDto>();
		
		try {
			res=sqlSession.selectList(NAMESPACE+"selectAllRoom",campno);
		} catch (Exception e) {
			System.out.println("[error]: selectAll Room");
			e.printStackTrace();
		}		
		return res;
	}
	
	public RoomDto selectOneRoom(int roomno){
		RoomDto res = null;
		
		try {
			res=sqlSession.selectOne(NAMESPACE+"selectOneRoom",roomno);
		} catch (Exception e) {
			System.out.println("[error]: selectOne Room");
			e.printStackTrace();
		}
		
		return res;
	}
	
	public List<CampImageDto> selectAllImage(int campno){
		List<CampImageDto> res = new ArrayList<CampImageDto>();
		
		try {
			res=sqlSession.selectList(NAMESPACE+"selectAllImage",campno);
		} catch (Exception e) {
			System.out.println("[error]: selectAll Image");
			e.printStackTrace();
		}		
		return res;
	}
	
	public List<RoomImageDto> selectAllRImage(int roomno){
		List<RoomImageDto> res = new ArrayList<RoomImageDto>();
		
		try {
			res=sqlSession.selectList(NAMESPACE+"selectAllRImage",roomno);
		} catch (Exception e) {
			System.out.println("[error]: selectAll RImage");
			e.printStackTrace();
		}		
		return res;
	}
	
	public List<ReservationDto> selectAllReservation(int roomno){
		List<ReservationDto> res = new ArrayList<ReservationDto>();
		
		try {
			res=sqlSession.selectList(NAMESPACE+"selectAllResevation",roomno);
		} catch (Exception e) {
			System.out.println("[error]: selectAll Reservation");
			e.printStackTrace();
		}
		return res;
	}
	
	public List<ReviewDto> selectAllReview(int campno){
		List<ReviewDto> res = new ArrayList<ReviewDto>();
		
		try {
			res=sqlSession.selectList(NAMESPACE+"selectAllReview",campno);
		} catch (Exception e) {
			System.out.println("[error]: selectAll Review");
			e.printStackTrace();
		}
		return res;
	}
	
	public ReviewDto selectOneReview(int reviewno){
		ReviewDto res = null;
		
		try {
			res=sqlSession.selectOne(NAMESPACE+"selectAllReview",reviewno);
		} catch (Exception e) {
			System.out.println("[error]: selectOne Review");
			e.printStackTrace();
		}
		return res;
	}
	public int insertCamp(CampDto dto) {
		int res = 0;
		
		try {
			res=sqlSession.insert(NAMESPACE+"insertCamp",dto);
		} catch (Exception e) {
			System.out.println("[error]: insert Camp");
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int insertFiles(Map<String,Object> fileinfo) {
		int res=0;
		
		try {
			res=sqlSession.insert(NAMESPACE+"insertfile",fileinfo);
		} catch(Exception e) {
			System.out.println("[error]: insert Files");
			e.printStackTrace();
		}
		return res;
	}
	
	public int insertRoom(RoomDto dto) {
		int res=0;
		
		try {
			res=sqlSession.insert(NAMESPACE+"insertRoom",dto);
		} catch (Exception e) {
			System.out.println("[error]: insert room");
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int insertRFiles(Map<String,Object> fileinfo) {
		int res=0;
		
		try {
			res=sqlSession.insert(NAMESPACE+"insertRfile",fileinfo);
		} catch(Exception e) {
			System.out.println("[error]: insert RFiles");
			e.printStackTrace();
		}
		return res;
	}
	
	public int insertReservation(ReservationDto dto) {
		int res=0;
		
		try {
			res=sqlSession.insert(NAMESPACE+"insertReservation",dto);
		} catch(Exception e) {
			System.out.println("[error]: insert Reservation");
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int insertReview(ReviewDto dto) {
		int res=0;
		
		try {
			res=sqlSession.insert(NAMESPACE+"insertReview",dto);
		} catch(Exception e) {
			System.out.println("[error]: insert Review");
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int updateCampThumbnail(String src) {
		int res=0;
		
		try {
			res=sqlSession.update(NAMESPACE+"updateCampThumbnail",src);
		} catch (Exception e) {
			System.out.println("[error]: update Camp Thumbnail");
			e.printStackTrace();
		}
		return res;
	}
	
	public int updateRoomThumbnail(String src) {
		int res=0;
		
		try {
			res=sqlSession.update(NAMESPACE+"updateRoomThumbnail",src);
		} catch (Exception e) {
			System.out.println("[error]: update Room Thumbnail");
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int chkReservation(ReservationDto dto) {
		int res=-1;
		
		try {
			res=sqlSession.selectOne(NAMESPACE+"chkReservation",dto);
		} catch (Exception e) {
			System.out.println("[error]: check Reservation");
			e.printStackTrace();
		}
		
		return res;
	}
	
	public WriterInfo collectWriterInfo(int campno){
		 WriterInfo res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"collectWriterInfo",campno);
		} catch (Exception e) {
			System.out.println("[error]: collect WriterInfo");
			e.printStackTrace();
		}
		return res;
	}
	
	public ReservationDto newReservation() {
		ReservationDto res = null;
		
		try {
			res= sqlSession.selectOne(NAMESPACE+"newReservation");
		} catch (Exception e) {
			System.out.println("[error]: select newReservation");
			e.printStackTrace();
		}
		return res;
	}
	
	public List<RoomDto> searchRoom(ReservationDto dto){
		List<RoomDto> res = new ArrayList<RoomDto>();
		try {
			res=sqlSession.selectList(NAMESPACE+"searchRoom",dto);
		} catch (Exception e) {
			System.out.println("[error]: search Room");
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int paymentChk(int reservno) {
		int res = 0;
		
		try {
			res=sqlSession.update(NAMESPACE+"paymentChk",reservno);
		} catch (Exception e) {
			System.out.println("[error]: update paymentStatus");
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int lowPrice(int campno) {
		int res = 0;
		
		try {
			res=sqlSession.selectOne(NAMESPACE+"lowPrice",campno);
		} catch (Exception e) {
			System.out.println("[error]: select lowPrice");
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int updateLowestPrice() {
		int res=0;
		int campno=newstCampno();
		System.out.println("campno="+campno);
		try {
			res=sqlSession.update(NAMESPACE+"updateLowestPrice",campno);
		} catch (Exception e) {
			System.out.println("[error]: update lowPrice");
			e.printStackTrace();
		}
		return res;
	}
	public int newstCampno() {
		int campno=0;
		try {
			campno=sqlSession.selectOne(NAMESPACE+"newstCampno");
		} catch (Exception e) {
			System.out.println("[error]: find newstCampno");
			e.printStackTrace();
		}
		return campno;
	}
	public int viewPlus(int campno) {
		int res=0;
		
		try {
			res=sqlSession.update(NAMESPACE+"viewPlus",campno);
		} catch (Exception e) {
			System.out.println("[error]: update view");
			e.printStackTrace();
		}
		return res;
	}
	
	public int updateTotalgrade(int campno) {
		int res=0;
		
		try {
			res=sqlSession.update(NAMESPACE+"updateTotalgrade",campno);
		} catch (Exception e) {
			System.out.println("[error]: update Totalgrade");
			e.printStackTrace();
		}
		return res;
	}
	
	public List<CampDto> searchCamp(SearchInfo dto){
		List<CampDto> res = new ArrayList<CampDto>();
		
		try {
			res=sqlSession.selectList(NAMESPACE+"searchCamp",dto);
		} catch (Exception e) {
			System.out.println("[error]: search Camp");
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int reviewCount(int campno) {
		int res = 0 ;
		
		try {
			res=sqlSession.update(NAMESPACE+"reviewCount",campno);
		} catch (Exception e) {
			System.out.println("[error]: update reviewCount");
			e.printStackTrace();
		}
		return res;
	}
	
	public List<CampDto> topCampList(){
		List<CampDto> res = new ArrayList<CampDto>();
		
		try {
			res=sqlSession.selectList(NAMESPACE+"topCampList");
		} catch (Exception e) {
			System.out.println("[error]: select topCampList");
			e.printStackTrace();
		}
		return res;
	}
	
	public List<CampDto> newCampList(){
		List<CampDto> res = new ArrayList<CampDto>();
		
		try {
			res=sqlSession.selectList(NAMESPACE+"newCampList");
		} catch (Exception e) {
			System.out.println("[error]: select newCampList");
			e.printStackTrace();
		}
		return res;
	}
	
	public int updateCamp(CampDto dto) {
		int res=0;
		
		try {
			res=sqlSession.update(NAMESPACE+"updateCamp",dto);
		} catch (Exception e) {
			System.out.println("[error]: update Camp");
			e.printStackTrace();
		}
		return res;
	}
	
	public int deleteCamp(int campno) {
		int res=0;
		
		try {
			res=sqlSession.delete(NAMESPACE+"deleteCamp",campno);
		} catch (Exception e) {
			System.out.println("[error]: delete Camp");
			e.printStackTrace();
		}
		return res;
	}
}
