package com.camping.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camping.controller.model.camp.dto.CampDto;
import com.camping.controller.model.camp.dto.ReservationDto;
import com.camping.controller.model.camp.dto.RoomDto;
import com.camping.controller.model.mypage.biz.MyCampBiz;

@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private MyCampBiz biz;

	
	@RequestMapping("/admin_camplist.do")
	public String campList(Model model) {
		logger.info("캠핑지 리스트");
		model.addAttribute("list", biz.campList());
		
		return "mypage/my_admin_main";
	}
	
	@RequestMapping("/admin_memberlist.do")
	public String memberList(Model model) {
		logger.info("회원 리스트");
		model.addAttribute("list", biz.memberList());
		
		return "mypage/my_admin_member";
	}
	
	
	
	@RequestMapping("/admin_memdelete.do")
	public String memberDelete(int myno) {
		logger.info("회원 탈퇴");
		
		int res = biz.memberDelete(myno);
		if(res>0) {
			return "mypage/my_admin_member";
		} else {
			return "mypage/my_admin_member";
		}
	}
	
	@RequestMapping("/admin_reportlist.do")
	public String reportList(Model model) {
		logger.info("신고 리스트");
		model.addAttribute("list", biz.reportList());
		
		return "mypage/my_admin_reportlist";
	}
	
	
	@RequestMapping("/admin_reportdetail.do")
	public String reportDetail(Model model, int reportseq) {
		logger.info("REPORT SELECT ONE");
		
		model.addAttribute("dto", biz.reportSelectOne(reportseq));
		return "mypage/my_admin_reportdetail";
	}
	
	
	@RequestMapping("/admin_campdelete.do")
	public String myCampDelete(int campno) {
		logger.info("캠핑지 삭제");

		int res = biz.myCampDelete(campno);
		if (res > 0) {
			return "redirect:admin_camplist.do";
		} else {
			return "redirect:admin_camplist.do";
		}
	}
	
	
	

	
	
	
	@RequestMapping("/manager_camplist.do")
	public String campInfoList(Model model) {
		logger.info("업체 캠핑 리스트");
		model.addAttribute("list", biz.campInfoList());
		
		return "mypage/my_manager_camplist";
	}
	
	
	
	@RequestMapping("/manager_roomdetail.do")
	public String roomDetail(Model model, int roomno) {
		logger.info("SELECT ONE");
		
		model.addAttribute("dto", biz.selectOne(roomno));
		return "mypage/my_manager_roomInfo";
	}
	
	
	
	
	@RequestMapping("/manager_roomupdateform.do")
	public String roomUpdateForm(Model model, int roomno) {
		logger.info("캠핑지 객실 수정 폼");
		
		model.addAttribute("dto", biz.selectOne(roomno));
		return "mypage/my_manager_roomupdate";
	}
	
	
	
	
	@RequestMapping("/manager_roomupdate.do")
	public String roomUpdate(RoomDto dto) {
		logger.info("캠핑지 객실 수정");
		
		int res = biz.update(dto);
		if(res > 0) {
			return "redirect:manager_roomdetail.do?roomno="+dto.getRoomno();
		} else {
			return "redirect:manager_roomupdateform.do?roomno="+dto.getRoomno();
		}
	}
	
	
	
	
	
	
	@RequestMapping("/manager_reservlist.do")
	public String reservList(Model model) {
		logger.info("예약 리스트");
		model.addAttribute("list", biz.reservList());
		
		return "mypage/my_manager_main";
	}
	
	
	// 예약확정 버튼 눌렀을 때(STATUS=N)
	@RequestMapping("/manager_reservupdate.do")
	public String reservUpdate(ReservationDto dto) {
		logger.info("예약 업데이트(예약확정)");
		
		int res = biz.reservUpdate(dto);
		if(res > 0) {
			return "redirect:manager_reservlist.do";
		} else {
			return "redirect:manager_reservlist.do";
		}
	}
	
	// 예약취소 버튼 눌렀을 때(STATUS=C)
	@RequestMapping("/manager_reservcancel.do")
	public String reservCancel(ReservationDto dto) {
		logger.info("예약 업데이트(예약취소)");
		
		int res = biz.reservCancel(dto);
		if(res > 0) {
			return "redirect:manager_reservlist.do";
		} else {
			return "redirect:manager_reservlist.do";
		}
	}
	
	
	@RequestMapping("/manager_reservfinishlist.do")
	public String reservFinish(Model model) {
		logger.info("예약 완료 리스트");
		model.addAttribute("list", biz.reservFinish());
		
		return "mypage/my_manager_finish";
	}
	
	@RequestMapping("/manager_reservcancellist.do")
	public String myreservCancel(Model model) {
		logger.info("예약 취소 리스트");
		model.addAttribute("list", biz.myreservCancel());
		
		return "mypage/my_manager_cancel";
	}
	
	
	
	@RequestMapping("/member_likelist.do")
	public String likeList(Model model) {
		logger.info("찜리스트");
		model.addAttribute("list", biz.likeList());
		
		return "mypage/my_member_like";
	}
	
	@RequestMapping("/member_pointlist.do")
	public String myPointList(Model model) {
		logger.info("포인트 리스트");
		model.addAttribute("list", biz.myPointList());
		
		return "mypage/my_member_point";
	}
	
}
