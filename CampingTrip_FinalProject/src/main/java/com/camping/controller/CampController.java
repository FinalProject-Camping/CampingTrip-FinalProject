package com.camping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camping.controller.model.camp.biz.CampBiz;

@Controller
public class CampController {
	
	@Autowired
	private CampBiz biz;
	
	@RequestMapping("/insert.do")
	public String Insert() {
		return "";
	}
}
