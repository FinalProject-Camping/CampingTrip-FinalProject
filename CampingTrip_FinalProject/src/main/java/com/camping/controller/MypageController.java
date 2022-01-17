package com.camping.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.camping.controller.model.camp.dto.CampDto;
import com.camping.controller.model.camp.dto.ReservationDto;
import com.camping.controller.model.camp.dto.RoomDto;
import com.camping.controller.model.event.dto.eventDto;
import com.camping.controller.model.joonggo.dto.joonggo;
import com.camping.controller.model.joonggo.dto.report;
import com.camping.controller.model.member.dto.MemberDto;
import com.camping.controller.model.mypage.biz.MyCampBiz;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

	@Autowired
	private MyCampBiz biz;


	@RequestMapping("/admin_memdelete.do")
	public String memberDelete(int myno) {
		logger.info("회원 탈퇴");

		int res = biz.memberDelete(myno);
		if (res > 0) {
			return "redirect:admin_memberlist.do";
		} else {
			return "redirect:admin_memberlist.do";
		}
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
	
	@RequestMapping("/admin_penalty.do")
	public String myPenalty(MemberDto dto) {
		logger.info("예약 업데이트(예약확정)");

		int res = biz.myPenalty(dto);
		if (res > 0) {
			return "redirect:admin_list.do";
		} else {
			return "redirect:admin_list.do";
		}
	}
	
	
	
	@RequestMapping("/admin_list.do")
	public ModelAndView list(@RequestParam(defaultValue="myid") String searchOption,
							 @RequestParam(defaultValue="") String keyword) throws Exception {
		
		List<MemberDto> list = biz.listAll(searchOption, keyword);
		
		// 레코드의 갯수
		int count = biz.countAtricle(searchOption, keyword);
		
		// ModelAndView - 모델과 뷰
		ModelAndView mav = new ModelAndView();
		
		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);	// list
		map.put("count", count); // 레코드의 갯수
		map.put("searchOption", searchOption);	// 검색옵션
		map.put("keyword", keyword);	// 검색 키워드
		mav.addObject("map", map);	// 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("mypage/my_admin_member");	// 뷰를 list.jsp로 설정
		
		return mav; // my_admin_member.jsp로 List가 전달됨
	}
	
	
	
	@RequestMapping("/admin_camplist.do")
	public ModelAndView camplist(@RequestParam(defaultValue="name") String searchOption,
							 @RequestParam(defaultValue="") String keyword) throws Exception {
		
		List<CampDto> list = biz.camplistAll(searchOption, keyword);
		
		// 레코드의 갯수
		int count = biz.campcountAtricle(searchOption, keyword);
		
		// ModelAndView - 모델과 뷰
		ModelAndView mav = new ModelAndView();
		
		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);	// list
		map.put("count", count); // 레코드의 갯수
		map.put("searchOption", searchOption);	// 검색옵션
		map.put("keyword", keyword);	// 검색 키워드
		mav.addObject("map", map);	// 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("mypage/my_admin_main");	// 뷰를 list.jsp로 설정
		
		return mav;
	}
	
	
	@RequestMapping("/admin_reportlist.do")
	public ModelAndView reportlist(@RequestParam(defaultValue="writer") String searchOption,
							 @RequestParam(defaultValue="") String keyword) throws Exception {
		
		List<report> list = biz.reportlistAll(searchOption, keyword);
		
		// 레코드의 갯수
		int count = biz.reportcountAtricle(searchOption, keyword);
		
		// ModelAndView - 모델과 뷰
		ModelAndView mav = new ModelAndView();
		
		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);	// list
		map.put("count", count); // 레코드의 갯수
		map.put("searchOption", searchOption);	// 검색옵션
		map.put("keyword", keyword);	// 검색 키워드
		mav.addObject("map", map);	// 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("mypage/my_admin_reportlist");	// 뷰를 list.jsp로 설정
		
		return mav;
	}
	
	
	
	
	
	

	// 판매자
	@RequestMapping("/manager_camplist.do")
	public ModelAndView campInfoList(HttpSession session, ModelAndView mav) {
		// session에 저장된 userId
		String userId = (String) session.getAttribute("id");

		Map<String, Object> map = new HashMap<String, Object>();

		List<CampDto> list = biz.campInfoList(userId);

		map.put("list", list); // 포인트 정보를 map에 저장
		mav.setViewName("mypage/my_manager_camplist"); // view(jsp)의 이름 저장
		mav.addObject("map", map); // map 변수 저장

		return mav;
	}
	
	
	@RequestMapping("/manager_roomlist.do")
	public ModelAndView roomList(HttpSession session, ModelAndView mav) {
		// session에 저장된 userId
		String userId = (String) session.getAttribute("id");

		Map<String, Object> map = new HashMap<String, Object>();

		List<RoomDto> list = biz.roomList(userId);

		map.put("list", list); // 포인트 정보를 map에 저장
		mav.setViewName("mypage/my_manager_roomlist"); // view(jsp)의 이름 저장
		mav.addObject("map", map); // map 변수 저장

		return mav;
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
		if (res > 0) {
			return "redirect:manager_roomdetail.do?roomno=" + dto.getRoomno();
		} else {
			return "redirect:manager_roomupdateform.do?roomno=" + dto.getRoomno();
		}
	}

	/* 판매자 메인화면 */
	@RequestMapping("/manager_reservlist.do")
	public ModelAndView reservList(HttpSession session, ModelAndView mav) {
		// session에 저장된 userId
		String userId = (String) session.getAttribute("id");

		Map<String, Object> map = new HashMap<String, Object>();

		List<ReservationDto> list = biz.reservList(userId);

		map.put("list", list);
		mav.setViewName("mypage/my_manager_main");
		mav.addObject("map", map);

		return mav;

	}

	// 예약 detail
	@RequestMapping("/manager_reservdetail.do")
	public String myReservDetail(Model model, int reservno) {
		logger.info("RESERVATION SELECT ONE");

		model.addAttribute("dto", biz.reservSelectOne(reservno));
		return "mypage/my_manager_reservdetail";
	}

	// 예약확정 버튼 눌렀을 때(STATUS=N)
	@RequestMapping("/manager_reservupdate.do")
	public String reservUpdate(ReservationDto dto) {
		logger.info("예약 업데이트(예약확정)");

		int res = biz.reservUpdate(dto);
		if (res > 0) {
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
		if (res > 0) {
			return "redirect:manager_reservlist.do";
		} else {
			return "redirect:manager_reservlist.do";
		}
	}

	@RequestMapping("/manager_reservfinishlist.do")
	public ModelAndView reservFinish(HttpSession session, ModelAndView mav) {
		String userId = (String) session.getAttribute("id");

		Map<String, Object> map = new HashMap<String, Object>();

		List<ReservationDto> list = biz.reservFinish(userId);

		map.put("list", list);
		mav.setViewName("mypage/my_manager_finish");
		mav.addObject("map", map);

		return mav;
	}

	@RequestMapping("/manager_reservcancellist.do")
	public ModelAndView myreservCancel(HttpSession session, ModelAndView mav) {
		String userId = (String) session.getAttribute("id");

		Map<String, Object> map = new HashMap<String, Object>();

		List<ReservationDto> list = biz.myreservCancel(userId);

		map.put("list", list);
		mav.setViewName("mypage/my_manager_cancel");
		mav.addObject("map", map);

		return mav;
	}

	
	
	
	
	
	// 사용자
	@RequestMapping("/member_pointlist.do")
	public ModelAndView myPointList(HttpSession session, ModelAndView mav) {

		// session에 저장된 userId
		String userId = (String) session.getAttribute("id");

		Map<String, Object> map = new HashMap<String, Object>();

		List<eventDto> list = biz.myPointList(userId);

		map.put("list", list); // 회원의 신고 정보를 map에 저장
		mav.setViewName("mypage/my_member_point"); // View 이름 저장
		mav.addObject("map", map); // map 변수 저장

		return mav;
	}

	// 찜리스트 목록
	@RequestMapping("/member_likelist.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {

		// session에 저장된 userId
		String userId = (String) session.getAttribute("id");

		Map<String, Object> map = new HashMap<String, Object>();

		List<joonggo> list = biz.likelist(userId); // 찜리스트 정보
		
		for(joonggo j : list){
			j.setImglist(j.getImglist().split(",")[0]);
		}

		map.put("list", list); // 찜리스트 정보를 map에 저장
		mav.setViewName("mypage/my_member_like"); // view(jsp)의 이름 저장
		mav.addObject("map", map); // map 변수 저장

		return mav;
	}

	// 회원 신고 목록
	@RequestMapping("/member_reportlist.do")
	public ModelAndView reportlist(HttpSession session, ModelAndView mav) {

		// session에 저장된 userId
		String userId = (String) session.getAttribute("id");

		Map<String, Object> map = new HashMap<String, Object>();

		List<report> list = biz.myReportList(userId); // 회원 신고 정보

		map.put("list", list); // 회원의 신고 정보를 map에 저장
		mav.setViewName("mypage/my_member_report"); // View 이름 저장
		mav.addObject("map", map); // map 변수 저장

		return mav;
	}

	// 회원 캠핑지 예약 목록
	@RequestMapping("/member_reservlist.do")
	public ModelAndView myReserveList(HttpSession session, ModelAndView mav) {

		String userId = (String) session.getAttribute("id");

		Map<String, Object> map = new HashMap<String, Object>();

		List<ReservationDto> list = biz.myReservList(userId);

		map.put("list", list);
		mav.setViewName("mypage/my_member_reserve");
		mav.addObject("map", map);

		return mav;
	}


}
