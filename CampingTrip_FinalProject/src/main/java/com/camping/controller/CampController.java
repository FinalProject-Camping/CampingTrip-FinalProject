package com.camping.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.camping.controller.model.camp.biz.CampBiz;
import com.camping.controller.model.camp.dto.CampDto;
import com.camping.controller.model.camp.dto.ReservationDto;
import com.camping.controller.model.camp.dto.ReviewDto;
import com.camping.controller.model.camp.dto.RoomDto;
import com.camping.controller.model.camp.dto.SearchInfo;
import com.camping.controller.model.member.dto.MemberDto;

@Controller
public class CampController {
	
	@Autowired
	private CampBiz biz;
	
	private String uploadPath ="C:\\camping\\image_file\\";
	
	@RequestMapping("/insertform_camp.do")
	public String insertform() {

		return "camping/camping_write";
	}
	
	@RequestMapping(value="selectcamp_main.do",method=RequestMethod.POST)
	@ResponseBody
	public List<CampDto> selectcamp_main(){
		List<CampDto> result=biz.topCampList();
		List<CampDto> tmp = biz.newCampList();
		for(int i = 0 ; i<tmp.size();i++) {
			result.add(tmp.get(i));
		}
		return result;
	}
	@RequestMapping(value="/insertcamp.do", method=RequestMethod.POST)
	public String insertCamp(CampDto dto, MultipartHttpServletRequest mRequest, RoomDto rdto) throws Exception {
		 System.out.println(dto.toString());
		 int res = biz.insertCamp(dto);
		 System.out.println("res:"+res);
		 
		 List<MultipartFile> fileList = mRequest.getFiles("camp_image");
		 if(!fileList.isEmpty()) {
			 biz.insertFiles(parseFileInfo(fileList));
		 }
		
		int cnt = countCnt(rdto.getRoom_name());
		
		String rname [] = rdto.getRoom_name().split(",");
		String rprice [] = rdto.getRoom_price().split(",");
		String gnumber [] = rdto.getGuest_number().split(",");
		String rcontent [] = rdto.getRoom_content().split(",");
		
		for(int i = 0; i < cnt ; i++) {
			RoomDto tmp = new RoomDto();
			tmp.setRoom_name(rname[i]);
			tmp.setRoom_price(rprice[i]);
			tmp.setGuest_number(gnumber[i]);
			tmp.setRoom_content(rcontent[i]);
			
			biz.insertRoom(tmp);
			
			List<MultipartFile> rfileList = mRequest.getFiles("room_image"+i);
			if(!rfileList.isEmpty()) {
				biz.insertRFiles(parseFileInfo(rfileList));
			}
		}
		int res2=biz.updateLowestPrice();
		return "redirect:camplist.do";
	}
	
	@RequestMapping("/roominsertform.do")
	public String roomInsertForm(){
		 
		 return "camping/room_write";
	}
	@RequestMapping("/updateCampForm.do")
	public String updateCampForm(Model model,int campno) {
		model.addAttribute("campDto", biz.selectOneCamp(campno));
		return "camping/camping_update";
	}
	@RequestMapping("/campUpdateRes.do")
	public String updateCampRes(CampDto dto, HttpServletResponse response) throws IOException {
		int res=biz.updateCamp(dto);
		if(res>0) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('성공적으로 수정되었습니다.'); location.href='campdetail.do?campno="+dto.getCampno()+"'</script>");
            out.flush();
		}
		return "";
	}
	@RequestMapping("/deleteCamp.do")
	public String deleteCamp(int campno, HttpServletResponse response) throws IOException {
		int res=biz.deleteCamp(campno);
		if(res>0) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('성공적으로 삭제되었습니다.'); location.href='camplist.do'; </script>");
            out.flush();
		}
		return "";
	}
	@RequestMapping("/camplist.do")
	public String campList(Model model){
		 model.addAttribute("camplist",biz.selectAllCamp());
		 return "camping/camping_list";
	}
	
	@RequestMapping("/campdetail.do")
	public String campdetail(Model model,int campno) {
		int res= biz.viewPlus(campno);
		model.addAttribute("campDto", biz.selectOneCamp(campno));		
		model.addAttribute("imagelist",biz.selectAllImage(campno));		
		model.addAttribute("roomlist", biz.selectAllRoom(campno));
		model.addAttribute("reviewlist", biz.selectAllReview(campno));
		model.addAttribute("writerInfo", biz.collectWriterInfo(campno));
		return "camping/camping_detail";
	}
	
	@RequestMapping("/reservationform.do")
	public String reservationForm(Model model,int roomno) {
		model.addAttribute("roomDto",biz.selectOneRoom(roomno));
		model.addAttribute("resrvList", biz.selectAllReservation(roomno));
		return "camping/reservation_form";
	}
	
	@RequestMapping("reservationres.do")
	public String reservationRes(ReservationDto rsvdto,HttpServletResponse response) throws IOException {
		
		int res=biz.insertReservation(rsvdto);
		
		//예약중복
		if(res==-77) {
			System.out.println("날짜중복");
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('선택한 날짜는 이미 예약되었습니다.'); history.go(-1);</script>");
            out.flush();

			return "";
		}//등록실패
		else if(res<0){
			System.out.println("등록실패");
			return "redirect:reservationform.do?roomno="+rsvdto.getRoomno();
		}//등록성공
		else {
			System.out.println("등록성공");
			return "redirect:reservationchk.do";
		}
	}
	
	@RequestMapping("/reservationchk.do")
	public String reservationChk(Model model) {
		ReservationDto rsvdto = biz.newReservation();
		
		String campName=biz.selectOneCamp(rsvdto.getCampno()).getName();
		System.out.println(campName);
		
		RoomDto roomDto = biz.selectOneRoom(rsvdto.getRoomno());
		model.addAttribute("campName",campName);
		model.addAttribute("roomDto", roomDto);
		model.addAttribute("resrvDto",rsvdto);
		return "camping/reservation_check";
	}
	
	
	@RequestMapping("roomdetail.do")
	public String reservationRes(int roomno,Model model) {
		model.addAttribute("roomDto",biz.selectOneRoom(roomno));
		model.addAttribute("resrvList", biz.selectAllReservation(roomno));			
		model.addAttribute("imgList",biz.selectAllRImage(roomno));
		return "camping/room_detail";
	}
	
	@RequestMapping("reviewwrite.do")
	public String reviewWrite(int campno, Model model) {
		model.addAttribute("campno", campno);
		return "camping/review_write";
	}

	
	@RequestMapping("reviewwriteres.do")
	public String insertReview(ReviewDto dto,HttpServletResponse response) throws IOException {
		
		//랜덤 썸네일 부여
		Random random = new Random();
		String src = "user_profile_"+(random.nextInt(5)+1)+".png";
		dto.setThumbnail(src);
		
		//리뷰 총점
		double total = (double)Math.round(((dto.getCleanliness()+dto.getCost()+dto.getLocation()+dto.getService())/4)*10)/10;
		dto.setTotal(total);
		
		System.out.println(dto.toString());
		int res = biz.insertReview(dto);
		int res1 = biz.updateTotalgrade(dto.getCampno());
		int res2 = biz.reviewCount(dto.getCampno());
		if(res>0) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script> alert('리뷰가 등록되었습니다.'); opener.parent.refreshPage(); window.close();</script>");
            out.flush();

			return "camping/review_write";
		}
		return "camping/review_write";
	}
	
	@RequestMapping(value="searchRoom.do",method=RequestMethod.POST)
	@ResponseBody
	public List<RoomDto> searchRoom(@RequestBody ReservationDto rsDto) throws Exception{
		System.out.println(rsDto.toString());
		
		List<RoomDto> roomList = biz.searchRoom(rsDto);
		return roomList;
	}
	
	@RequestMapping(value="reviewlistajax.do",method=RequestMethod.POST)
	@ResponseBody
	public List<ReviewDto> reviewList(@RequestBody CampDto campno){
		List<ReviewDto> reviewList = biz.selectAllReview(campno.getCampno());
		return reviewList;
	}
	
	@RequestMapping(value="searchCamp.do",method=RequestMethod.POST)
	public String searchCamp(SearchInfo info,Model model) {
		System.out.println(info.toString());
		info.setType_lists();
		List<String> tmp = info.getType_list();
		if(!tmp.isEmpty()) {
			for( int i = 0 ; i <tmp.size();i++) {
				System.out.println(tmp.get(i));
			}
		}
		
		List<CampDto> campList = biz.searchCamp(info);
		if(!campList.isEmpty()) {
			for(int i = 0 ; i<campList.size();i++) {
				System.out.println(campList.get(i).toString());
			}
		}
		model.addAttribute("searchInfo", info);
		model.addAttribute("camplist",campList);
		 return "camping/camping_list";
	}
	
	@RequestMapping(value="paymentCheck.do",method=RequestMethod.POST)
	@ResponseBody
	public int paymentCheck(int reservno) {
		System.out.println("reservno:"+reservno);
		int res = biz.paymentChk(reservno);
		return res;
	}
	
	@RequestMapping("test.do")
	public String purchase() {
		return "camping/test";
	}
	
	@ResponseBody
	@RequestMapping(value="/loginChk.do",method=RequestMethod.POST)
	public Map<String,Object> loginChk(HttpSession session) {
		
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("data", sessiondto != null); //sessiondto != null

		if(sessiondto != null) {
	    	map.put("penalty", sessiondto.getMypenalty());
	    }
		return map;
	}
	
	private List<Map<String,Object>> parseFileInfo(List<MultipartFile> files) throws Exception{
		
		List<Map<String,Object>> fileList = new ArrayList<Map<String,Object>>();
		
		//지정한 경로가 존재하지 않을시 폴더생성
		File target= new File(uploadPath);
		if(!target.exists()) {target.mkdirs();}
		
		for(MultipartFile f : files) {
			String orgFileName = f.getOriginalFilename();
			String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
			String saveFileName = UUID.randomUUID().toString().replaceAll("-", "")+orgFileExtension;
			Long saveFileSize = f.getSize();
			
			System.out.println("===========file info===========");
			System.out.println("파일 실제이름 : "+orgFileName);
			System.out.println("파일 저장이름 : "+saveFileName);
			System.out.println("파일 크기 : "+saveFileSize);
			System.out.println("content type: "+f.getContentType());
			System.out.println("===============================");
			
			target = new File(uploadPath,saveFileName);
			f.transferTo(target);
			
			Map<String,Object> fileInfo = new HashMap<String,Object>();
			
			fileInfo.put("ORG_FILE_NAME", orgFileName);
			fileInfo.put("SAVE_FILE_NAME", saveFileName);
			fileInfo.put("FILE_SIZE", saveFileSize);
			fileList.add(fileInfo);
		}
		return fileList;
	}
	
	private int countCnt(String str) {
		int cnt=1;
		
		for(int i = 0 ; i < str.length();i++) {
			if(str.charAt(i)==',') {
				cnt++;
			}
		}
		return cnt;
	}
	
}
