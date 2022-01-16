package com.camping.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camping.controller.model.event.biz.eventBiz;
import com.camping.controller.model.event.dto.eventDto;
import com.camping.controller.model.member.dto.MemberDto;


@Controller
public class EventController {
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	private eventBiz biz;
	
	@RequestMapping("/event.do")
	public String list(HttpSession session, Model model) {	//model은 데이터 담는 객체 (model & view)
		logger.info("SELECT LIST");
		System.out.println("이벤트 페이지");
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		
		if(sessiondto == null) {
			return "../../index";
		}else {
			return "event/eventtest";
		}
	}

	@RequestMapping("/eventdetail.do")
	public String detail(Model model) {
		System.out.println("이벤트 상세페이지");
		model.addAttribute("list", biz.selectList());
		return "event/eventdetail";
	}
	
	@RequestMapping("/cscenter.do")
	public String cscenter(Model model) {
		System.out.println("고객센터");
		return "cscenter/cscenter";
	}
	
//	@ResponseBody
//	@RequestMapping(value="/event_insert_point.do",method=RequestMethod.POST)
//	public String insertPoint(HttpSession session, @RequestBody String point){
//		HashMap<String,Object> params = new HashMap<String,Object>();
//		
//		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
//		
//		logger.info("point=" + point);
//		
//		params.put("pointId", sessiondto.getMyid());
//		params.put("point", Integer.parseInt(point));
//	
//		biz.insertPoint(params);
//		
//	    return "SUCCESS";
//	}
	
	@RequestMapping(value="/event_insert_point.do",method=RequestMethod.POST)
	public @ResponseBody String insertPoint(@RequestParam Map<String, Object> param, HttpSession session){
		HashMap<String,Object> params = new HashMap<String,Object>();
		
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		String point = (String) param.get("point");
		
		logger.info("point=" + point);
		
		params.put("pointId", sessiondto.getMyid());
		params.put("point", point);
	
		biz.insertPoint(params);
		
	    return "SUCCESS";
	}
	
}