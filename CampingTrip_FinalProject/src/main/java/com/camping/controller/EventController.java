package com.camping.controller;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camping.controller.model.event.biz.eventBiz;
import com.camping.controller.model.event.dto.eventDto;


@Controller
public class EventController {
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	private eventBiz biz;
	
	@RequestMapping("/event.do")
	public String list(Model model) {	//model은 데이터 담는 객체 (model & view)
		System.out.println("이벤트 페이지");
		model.addAttribute("message", biz.selectList(null));
		return "event/eventtest";
	}

	@RequestMapping("/eventdetail.do")
	public String detail(Model model) {
		System.out.println("이벤트 상세페이지");
		return "event/eventdetail";
	}
	
	@RequestMapping("/cscenter.do")
	public String cscenter(Model model) {
		System.out.println("고객센터");
		return "cscenter/cscenter";
	}
}