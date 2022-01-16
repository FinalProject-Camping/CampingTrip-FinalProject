package com.camping.controller.model.camp.biz;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.controller.model.camp.dao.CampDao;
import com.camping.controller.model.camp.dto.CampDto;
import com.camping.controller.model.camp.dto.CampImageDto;
import com.camping.controller.model.camp.dto.ReservationDto;
import com.camping.controller.model.camp.dto.ReviewDto;
import com.camping.controller.model.camp.dto.RoomDto;
import com.camping.controller.model.camp.dto.RoomImageDto;
import com.camping.controller.model.camp.dto.SearchInfo;
import com.camping.controller.model.camp.dto.WriterInfo;

@Service
public class CampBiz {
	
	@Autowired
	private CampDao dao;
	
	public List<CampDto> selectAllCamp(){
		return dao.selectAllCamp();
	}
	
	public CampDto selectOneCamp(int campno) {
		return dao.selectOne(campno);
	}
	
	public List<RoomDto> selectAllRoom(int campno){
		return dao.selectAllRoom(campno);
	}
	
	public RoomDto selectOneRoom(int roomno) {
		return dao.selectOneRoom(roomno);
	}
	
	public List<CampImageDto> selectAllImage(int campno) {
		return dao.selectAllImage(campno);
	}
	
	public List<RoomImageDto> selectAllRImage(int roomno) {
		return dao.selectAllRImage(roomno);
	}
	
	public List<ReservationDto> selectAllReservation(int roomno){
		return dao.selectAllReservation(roomno);
	}
	
	public List<ReviewDto> selectAllReview(int campno){
		return dao.selectAllReview(campno);
	}
	
	public ReviewDto selectOneReview(int reviewno) {
		return dao.selectOneReview(reviewno);
	}
	
	public int insertCamp(CampDto dto) {
		return dao.insertCamp(dto);
	}
	
	public int insertFiles(List<Map<String,Object>> fileList) {
		int res=0;
		for(int i = 0 ; i < fileList.size();i++) {
			if(i==0) {
				
				String src ="/upload/"+(String)fileList.get(i).get("SAVE_FILE_NAME");
				System.out.println("src : "+src);
				dao.updateCampThumbnail(src);
			}
			res+=dao.insertFiles(fileList.get(i));
		}
		return res;
	}
	
	public int insertRoom(RoomDto dto) {
		return dao.insertRoom(dto);
	}
	
	public int insertRFiles(List<Map<String,Object>> fileList) {
		int res=0;
		for(int i = 0 ; i < fileList.size();i++) {
			if(i==0) {				
				String src ="/upload/"+(String)fileList.get(i).get("SAVE_FILE_NAME");
				dao.updateRoomThumbnail(src);
			}
			res+=dao.insertRFiles(fileList.get(i));
		}
		return res;
	}
	
	public int insertReservation(ReservationDto dto) {
		//예약가능한 날짜인지 확인 후 등록
		if(dao.chkReservation(dto)==0) {
			return dao.insertReservation(dto);
		}
		//예약가능한 날짜가 아닐경우 알려줌
		return -77;
	}
	
	public int insertReview(ReviewDto dto) {
		return dao.insertReview(dto);
	}
	public int updateTotalgrade(int campno) {
		return dao.updateTotalgrade(campno);
	}
	
	public  WriterInfo collectWriterInfo(int campno){
		return dao.collectWriterInfo(campno);
	}
	
	public ReservationDto newReservation() {
		return dao.newReservation();
	}
	
	public List<RoomDto> searchRoom(ReservationDto dto){
		return dao.searchRoom(dto);
	}
	
	public int paymentChk(int reservno) {
		return dao.paymentChk(reservno);
	}
	
	public int lowPrice(int campno) {
		return dao.lowPrice(campno);
	}
	
	public int updateLowestPrice() {
		
		return dao.updateLowestPrice();
	}
	
	public int viewPlus(int campno) {
		
		return dao.viewPlus(campno);
	}
	
	public List<CampDto> searchCamp(SearchInfo dto){
		
		return dao.searchCamp(dto);
	}
	public int reviewCount(int campno) {
		return dao.reviewCount(campno);
	}
	
	public List<CampDto> topCampList(){
		return dao.topCampList();
	}
	
	public List<CampDto> newCampList(){
		return dao.newCampList();
	}
	
	public int updateCamp(CampDto dto) {
		return dao.updateCamp(dto);
	}
	
	public int deleteCamp(int campno) {
		return dao.deleteCamp(campno);
	}
	
}
