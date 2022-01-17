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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camping.controller.model.joonggo.dto.joonggo;
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
	public String loginForm(HttpSession session) {
		logger.info("LOGIN FORM");
		
		//로그인 상태에서 메인으로 이동(리다이렉트)
		if(session.getAttribute("id") != null && session.getAttribute("id") != "") {
			return "redirect:/";
		}
		
		
		return "member/memberLogin";
	}
	
	/**
	 * id찾기화면이동
	 * @param session
	 * @param dto
	 * @return
	 */
	@RequestMapping("/findId.do")
	public String findId() {
		logger.info("FIND ID FORM");
		return "member/findId";
	}

	/**
	 * pw찾기화면이동
	 * @param session
	 * @param dto
	 * @return
	 */
	@RequestMapping("/findPw.do")
	public String findPw() {
		logger.info("FIND PW FORM");
		return "member/findPw";
	}
	
	/**
	 * 회원정보로 id찾기
	 * @param session
	 * @param dto
	 * @return
	 */
	@RequestMapping("/ajaxFindId.do")
	@ResponseBody
	public Map<String, String> ajaxFindId(HttpSession session, @RequestBody MemberDto dto) {
		logger.info("ajaxFindId");
		//@RequestBody : request로 넘어오는 데이터를 java객체
		//@ResponseBody : java객체를 response에 binding
		
		String rtnId = "";
		dto.setMybirth(dto.getMybirth().replaceAll("-", ""));
		rtnId = biz.findId(dto);
		//리턴값을 담을 변수 선언
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("rtnId", rtnId);
		
		return map;
	}
	

	/**
	 * 회원정보로 비밀번호초기화
	 * @param session
	 * @param dto
	 * @return
	 */
	@RequestMapping("/ajaxFindPw.do")
	@ResponseBody
	public Map<String, Integer> ajaxFindPw(HttpSession session, @RequestBody MemberDto dto) {
		logger.info("ajaxFindPw");
		//@RequestBody : request로 넘어오는 데이터를 java객체
		//@ResponseBody : java객체를 response에 binding
		Integer res = 0;
		dto.setMybirth(dto.getMybirth().replaceAll("-", ""));
		//id를암호화하여 pw에 담기
		dto.setMypw(passwordEncoder.encode(dto.getMyid()));
		res = biz.resetPw(dto);
		//리턴값을 담을 변수 선언
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("check", res);
		
		return map;
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
				session.setAttribute("id", res.getMyid());
				session.setAttribute("name", res.getMyname());
				session.setAttribute("role", res.getMyrole());

				
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
	public String memberInsertForm(HttpSession session, Model model) {
		
		if("사용자".equals(session.getAttribute("role")) || "판매자".equals(session.getAttribute("role"))){
			return "redirect:/";
		}else if("관리자".equals(session.getAttribute("role"))){
			model.addAttribute("adminRole","관리자");
		}
		return "member/memberRegister";
		
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
	
	/**
	 * logout
	 */
	@RequestMapping("/sessionLogout.do")
	public String sessionLogout(HttpSession session) {

		session.removeAttribute("id");
		session.removeAttribute("name");
		session.removeAttribute("login");
		session.removeAttribute("role");

		return "redirect:/";
		
	}
	

	/**
	 * 회원상세정보 조회
	 * @param session 
	 * @param id 
	 */
	@RequestMapping("/memberDetail.do")
	public String memberDetail(Model model, HttpSession session) {
		logger.info("DETAIL");
		
		//1.로그인 정보에서 아이디 가져오기
		String loginId = session.getAttribute("id").toString();

		//2.받아온 아이디로 회원정보 조회
		MemberDto dto = biz.select(loginId);
		
		//3.조회한 회원정보를 화면에 넘겨준다
		model.addAttribute("memberInfo",dto);
		
		return "member/memberDetail";
		
		
	}
	
	
	
	/**
	 * 회원상세정보 조회
	 * @param session 
	 * @param id 
	 */
	@RequestMapping("/ajaxMemberUpdate.do")
	@ResponseBody
	public Map<String, Boolean> ajaxMemberUpdate(Model model, HttpSession session, @RequestBody MemberDto dto) {
		logger.info("UPDATE");

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		Boolean check = false;
		
		int res = 0;
		
		//pw를 암호화하여 db에 담기
		dto.setMypw(passwordEncoder.encode(dto.getMypw()));
		
		res = biz.update(dto);
		
		if(res>0) {
			//성공
			check=true;
		}else {
			check=false;
		}

		map.put("check", check);
		
		return map;
		
	}
	

	/**
	 * 회원탈퇴 후 메인화면 호출
	 * @param session 
	 * @param id 
	 */
	@RequestMapping("/ajaxEnabledUpdate.do")
	@ResponseBody
	public Map<String, Boolean> ajaxEnabledUpdate(Model model, HttpSession session) {
		logger.info("ENABLEDUPDATE");
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		Boolean check = false;
		
		int res = 0;
		
		MemberDto dto = new MemberDto();
		
		dto.setMyid(session.getAttribute("id").toString());
		
		res = biz.enabledUpdate(dto);
		
		if(res>0) {
			//성공
			session.removeAttribute("id");
			session.removeAttribute("name");
			session.removeAttribute("login");
			session.removeAttribute("role");

			check=true;
		}else {
			check=false;
		}

		map.put("check", check);
		
		return map;
		
		
	}
	
	
	/**
	 * 회원탈퇴화면이동
	 * @param session
	 * @param dto
	 * @return
	 */
	@RequestMapping("/memberPwCheck.do")
	public String memberPwCheck(HttpSession session,Model model) {
		logger.info("PWCHECK");
		String myid = "";
		//로그인 상태에서 메인으로 이동(리다이렉트)
		if(session.getAttribute("id") != null && session.getAttribute("id") != "") {
			myid = session.getAttribute("id").toString();
		}
		model.addAttribute("myid",myid);
		return "member/memberPwCheck";
	}
	
	
	/**
	 * 회원정보수정화면이동
	 * @param session
	 * @param dto
	 * @return
	 */
	@RequestMapping("/memberDetailCheck.do")
	public String memberDetailCheck(HttpSession session,Model model) {
		logger.info("DETAILPWCHECK");
		String myid = "";
		//로그인 상태에서 메인으로 이동(리다이렉트)
		if(session.getAttribute("id") != null && session.getAttribute("id") != "") {
			myid = session.getAttribute("id").toString();
		}
		model.addAttribute("myid",myid);
		return "member/memberDetailCheck";
	}
	
	/**
	 * pw검증
	 * */


	/**
	 * 회원정보로 비밀번호초기화
	 * @param session
	 * @param dto
	 * @return
	 */
	@RequestMapping("/ajaxPwCheck.do")
	@ResponseBody
	public Map<String, Boolean> ajaxPwCheck(HttpSession session, @RequestBody String mypw) {
		logger.info("ajaxPwCheck");
		//@RequestBody : request로 넘어오는 데이터를 java객체
		//@ResponseBody : java객체를 response에 binding
		Boolean res = false;


		//1.로그인 정보에서 아이디 가져오기
		String loginId = session.getAttribute("id").toString();

		MemberDto param = new MemberDto();
		param.setMyid(loginId);
		//2.받아온 아이디로 회원정보 조회
		MemberDto dto = biz.login(param);
		
		//3.db pw와 사용자가 입력한 pw 둘다 암호화 한 값으로 비교
//		if(passwordEncoder.matches(dto.getMypw(), passwordEncoder.encode(mypw))) {
		if(passwordEncoder.matches(mypw,dto.getMypw())) {
			res = true;
		}
		//리턴값을 담을 변수 선언
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		map.put("check", res);
		
		return map;
	}
	
	
	
		
}
