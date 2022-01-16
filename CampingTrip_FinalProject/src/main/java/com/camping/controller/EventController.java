package com.camping.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
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
	public String list(HttpSession session, HttpServletResponse response, Model model) throws IOException {	//model은 데이터 담는 객체 (model & view)
		logger.info("Roulette event");
		System.out.println("이벤트 페이지");
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		
		if(sessiondto == null) {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인이 필요한 서비스입니다.'); </script>");
            out.flush();
			return "member/memberLogin";
		}else {
			return "event/eventtest";
		}
	}

	@RequestMapping("/eventdetail.do")
	public String detail(HttpSession session, Model model) {
		logger.info("point detail");
		
		return "event/eventdetail";
	}
	
	@RequestMapping("/pointList.do")
	public @ResponseBody List<eventDto> getPointList(HttpSession session) {
		logger.info("Point List");
		
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		
		List<eventDto> dto = biz.selectList(sessiondto.getMyid());
		
		return dto; 
	}
	
	@RequestMapping("/cscenter.do")
	public String cscenter(Model model) {
		System.out.println("고객센터");
		return "cscenter/cscenter";
	}
	
	@RequestMapping(value="/event_insert_point.do",method=RequestMethod.POST)
	public @ResponseBody String insertPoint(@RequestParam Map<String, Object> param, HttpSession session){
		HashMap<String,Object> params = new HashMap<String,Object>();
		
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		String point = (String) param.get("point");
		
		logger.info("point=" + point);
		
		String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		params.put("pointId", sessiondto.getMyid());
		params.put("pointGetDate", currentDate);
		params.put("point", point);
	
		biz.insertPoint(params);
		
	    return "SUCCESS";
	}
	
}