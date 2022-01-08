package com.camping.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camping.controller.model.member.biz.MemberBiz;
import com.camping.controller.model.member.dto.MemberDto;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberBiz biz;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("/loginform.do")
	public String loginForm() {
		logger.info("LOGIN FORM");
		return "member/memberLogin";
	}
	
	
	@RequestMapping("/ajaxlogin.do")
	@ResponseBody
	public Map<String, Boolean> ajaxLogin(HttpSession session, @RequestBody MemberDto dto) {
		logger.info("LOGIN");
		//@RequestBody : request로 넘어오는 데이터를 java객체
		//@ResponseBody : java객체를 response에 binding
		
		MemberDto res = biz.login(dto);
		
		boolean check = false;
		if(res != null) {
			//database에 저장되어있는 pw와 화면에서 넘어온 pw가 일치하는지 확인
			if(passwordEncoder.matches(dto.getMypw(), res.getMypw())) {
				session.setAttribute("login", res);
				check=true;
			}
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
		return map;
	}
	
	/**
	 * 회원가입 아이디 중복확인 ajax
	 * @param session
	 * @param dto
	 * @return
	 */
	@RequestMapping("/ajaxIdChk.do")
	@ResponseBody
	public Map<String, Boolean> ajaxIdChk(HttpSession session, @RequestBody String memberId) {
		logger.info("ID CHECK");
		//@RequestBody : request로 넘어오는 데이터를 java객체
		//@ResponseBody : java객체를 response에 binding
		Boolean check = false;
		Integer idCnt = biz.idChk(memberId);

		if(idCnt == 0) {
			check = true;
		}
		
		//return 값 세팅
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
		return map;
	}
	
	/**
	 * 회원가입 페이지 호출
	 * @return
	 */
	@RequestMapping("/registerform.do")
	public String memberInsertForm() {
		return "member/memberRegister";
	}
	

	
/**
 * 삭제예정
 * @return
 */
	@RequestMapping("/nextRegisterForm.do")
	public String nextMemberInsertForm() {
		return "member/nextMemberRegister";
	}
	
	/**
	 * ㅅㄱ제예정
	 * @param dto
	 * @return
	 */
	@RequestMapping("/register.do")
	public String memberInsert(MemberDto dto) {

		//화면에서 넘어온 password 암호화하기
		dto.setMypw(passwordEncoder.encode(dto.getMypw()));
		System.out.println(dto.getMypw());
		//가입(인서트)성공시 로그인화면으로 이동하고 실패시 다시가입화면으로 이동
		if(biz.insert(dto)>0) {
			return "redirect:loginform.do";
		}else {
			return "redirect:registerform.do";
		}
		
	}

	/**
	 * 회원가입 버튼 클릭 시 호출 ajax 가입처리.
	 * @param session
	 * @param dto
	 * @return
	 */
	@RequestMapping("/ajaxMemberInsert.do")
	@ResponseBody
	public Map<String, Boolean> ajaxMemberInsert(HttpSession session, @RequestBody MemberDto dto) {
		logger.info("MEMBER 가입");

		//화면에서 넘어온 password 암호화하기
		dto.setMypw(passwordEncoder.encode(dto.getMypw()));
		dto.setMyrole("USER");
		dto.setMybirth(dto.getMybirth().replaceAll("-", ""));
		Boolean check = false;
		
		//가입(인서트)성공여부
		if(biz.insert(dto)>0) {
			check = true;
		}
		
		//return 값 세팅
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
		return map;
		
		
	}
	
}
