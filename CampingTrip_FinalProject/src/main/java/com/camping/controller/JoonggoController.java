package com.camping.controller;


import java.io.IOException;
import java.net.SocketException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.camping.controller.model.joonggo.biz.biz;
import com.camping.controller.model.joonggo.dto.FtpClient;
import com.camping.controller.model.joonggo.dto.LocationDistance;
import com.camping.controller.model.joonggo.dto.chat;
import com.camping.controller.model.joonggo.dto.chatroom;
import com.camping.controller.model.joonggo.dto.joonggo;
import com.camping.controller.model.joonggo.dto.kakao;
import com.camping.controller.model.joonggo.dto.report;
import com.camping.controller.model.member.dto.MemberDto;
import com.google.gson.JsonObject;



@Controller
public class JoonggoController {
	private static final Logger logger = LoggerFactory.getLogger(JoonggoController.class);
	@Autowired
	private biz biz;
	
	@RequestMapping("/joonggo_list.do")
	public String list(Model model, String keyword) {
		logger.info("selectlist");
		System.out.println("keyword : " + keyword);
		System.out.println("regexp :" + getKeywords(keyword));
		
		List<joonggo> list = biz.selectList(getKeywords(keyword));
		model.addAttribute("islast", list.size()!=10);
		if(list.size() == 10) {
			list.remove(list.size()-1);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String toJson = null;
		try {
			toJson = mapper.writeValueAsString(list);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		model.addAttribute("list", toJson);
		model.addAttribute("keyword", keyword);
		
		return "joonggo/joonggo_main"; 
	}
	
	public String getKeywords(String keyword){
/*		Set<String> set = new HashSet<String>();
		set.add(keyword);
		set.add(keyword.replaceAll("\\s", ""));
		for(String s : keyword.split("\\s")) {
			set.add(s);
		}
		return (HashSet<String>) set;*/
		
		List<String> list = new ArrayList<String>(Arrays.asList(keyword.split("\\s")));
		List<String> res = new ArrayList<String>();
		int count = list.size();
		
		while(count > 0) {
			for(int i = 0; i < list.size(); i++) {
				String str = "";
				
				if(i + count > list.size()) {
					break;
				}else {
					for(int j = i; j < i+count; j++) {
						str += list.get(j) + " ";
					}
					if(count > 1) {
						res.add(str.trim());
						res.add(str.replaceAll("\\s", ""));
					}else {
						res.add(str.trim());
					}
				}
			}
			count--;
		}
		
		String regexp = "";
		for(String s : res) {
			regexp += s + "|";
		}
		
		return regexp.substring(0, regexp.length()-1);
	}
	
	@ResponseBody
	@RequestMapping(value="/setcategory.do",method=RequestMethod.POST)
	public Map<String, Object> setCategoryAndStatus(String category, String status, String keyword){
		logger.info("setcategory");
		
		List<String> categories = category.length()==0? new ArrayList<String>():new ArrayList<String>(Arrays.asList(category.split(",")));
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("category", categories);
		map.put("status", status);
		map.put("regexp", getKeywords(keyword));
		List<joonggo> list = biz.setCategoryAndStatus(map);
		System.out.println(list.size());

		Map<String,Object> maps = new HashMap<String,Object>();
		maps.put("islast",list.size()!=10);
		
		if(list.size() == 10) {
			list.remove(list.size()-1);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String toJson = null;
		try {
			toJson = mapper.writeValueAsString(list);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	    maps.put("data",toJson);
	    
	    return maps;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/moreresult.do",method=RequestMethod.POST)
	public Map<String, Object> getMoreResult(String page, String category, String status, String keyword){
		logger.info("moreresult");
		
		List<String> categories = category.length()==0? new ArrayList<String>():new ArrayList<String>(Arrays.asList(category.split(",")));
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("category", categories);
		map.put("status", status);
		map.put("regexp", getKeywords(keyword));
		map.put("page", page);
		List<joonggo> list = biz.moreResult(map);
		
		Map<String,Object> maps = new HashMap<String,Object>();
		maps.put("islast",list.size()!=10);
		
		if(list.size() == 10) {
			list.remove(list.size()-1);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String toJson = null;
		try {
			toJson = mapper.writeValueAsString(list);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	    maps.put("data",toJson);
	    
	    return maps;
	}
	
	@ResponseBody
	@RequestMapping(value="/selectlist_main.do",method=RequestMethod.POST)
	public Map<String, Object> selectlist_main(){
		logger.info("selectlist_main");
		
		List<joonggo> list = biz.selectlist_main();
		
		Map<String,Object> maps = new HashMap<String,Object>();
		
		ObjectMapper mapper = new ObjectMapper();
		String toJson = null;
		try {
			toJson = mapper.writeValueAsString(list);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	    maps.put("data",toJson);
	    
	    return maps;
	}
	
	
	
	
	
	@RequestMapping("/error.do")
	public String error() {
		logger.info("error");
		return "joonggo/error";
	}
	
	@ResponseBody
	@RequestMapping("/confirmsession.do")
	public Map<String,Object> confirmsession(HttpSession session){
		logger.info("session 확인");
		Map<String,Object> map = new HashMap<String,Object>();
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		map.put("data", sessiondto != null);
		
		return map;
	}
	
	@RequestMapping("/joonggo_selectone.do")
	public String selectone(HttpSession session, Model model, int seq) {
		logger.info("selectone : " + seq);
		joonggo dto = biz.selectone(seq, false);
		
		if(dto != null) {
			dto.setRegdate(new Timestamp(dto.getRegdate().getTime()));
			dto.setQuality(dto.getQuality().equals("A")?"미개봉":dto.getQuality().equals("B")?"거의 새 것":"사용감 있음");
			dto.setDelivery(dto.getDelivery().equals("A")?"직거래, 택배 거래":dto.getDelivery().equals("D")?"직거래":"택배 거래");
			
			model.addAttribute("dto", dto);
			
			MemberDto sessiondto = (MemberDto) session.getAttribute("login");
			if(sessiondto != null) {
				model.addAttribute("sessiondto", sessiondto); 
			}
			
		}else {
			return "redirect:error.do";
		}
		return "joonggo/joonggo_detail";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/joonggo_insertConfirm",method=RequestMethod.POST)
	public Map<String,Object> insertConfirm(HttpSession session) {
		logger.info("insertConfirm");
		
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("data", sessiondto != null); //sessiondto != null

		if(sessiondto != null) {
	    	map.put("penalty", sessiondto.getMypenalty());
	    }
		return map;
	}
	
	@RequestMapping("/joonggo_insertform")
	public String insertform(HttpSession session, Model model) {
		logger.info("insertform");
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		
		if(sessiondto == null) {
			return "redirect:error.do";
		}else {
			if(sessiondto.getMypenalty() >=5) {
				return "redirect:error.do";
			}
			model.addAttribute("sessiondto", sessiondto);
		}
		return "joonggo/joonggo_insertForm";
	}
	
	@RequestMapping("/joonggo_insert")
	public String insert(HttpSession session, joonggo joonggo) {
		logger.info("insert");
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		
		if(sessiondto == null) {
			return "redirect:error.do";
		}else {
			if(!joonggo.getId().equals(sessiondto.getMyid())){
				return "redirect:error.do";
			}
			if(sessiondto.getMypenalty() >=5) {
				return "redirect:error.do";
			}
		}
		int res = biz.insert(joonggo);
		if(res > 0) {
			return "redirect:joonggo_selectone.do?seq=" + res;
		}else {
			return "redirect:error.do";
		}
	}
	

	
	@RequestMapping("/joonggo_updateform")
	public String updateForm(HttpSession session, Model model, String writer, int seq) {
		logger.info("updateform" + seq);
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		
		if(sessiondto == null) {
			return "redirect:error.do";
		}else {
			if(!sessiondto.getMyid().equals(writer)) {
				return "redirect:error.do";
			}
		}
		joonggo dto = biz.selectone(seq, true);
		if(dto != null) {
			model.addAttribute("dto", dto);
			return "joonggo/joonggo_updateform";
		}else {
			return "redirect:error.do";
		}
	}
	
	@RequestMapping("/joonggo_update")
	public String update(HttpSession session, joonggo joonggo) {
		logger.info("update");
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		
		if(sessiondto == null) {
			return "redirect:error.do";
		}else {
			if(!sessiondto.getMyid().equals(joonggo.getId())) {
				return "redirect:error.do";
			}
		}
		int seq = joonggo.getSeq();
		int res = biz.update(joonggo);
		if(res > 0) {
			return "redirect:joonggo_selectone.do?seq=" + seq;
		}else {
			return "redirect:error.do";
		}
	}
	
	@RequestMapping("/joonggo_delete")
	public String delete(HttpSession session, String writer, int seq) {
		logger.info("delete");
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		
		if(sessiondto == null) {
			return "redirect:error.do";
		}else {
			if(!sessiondto.getMyid().equals(writer)) {
				return "redirect:error.do";
			}
		}
		int res = biz.delete(seq);
		if(res > 0) {
			return "redirect:joonggo_list.do?keyword=";
		}else {
			return "redirect:error.do";
		}
	}
	
	@RequestMapping("/joonggo_admindelete")
	public String admindelete(HttpSession session, int seq) {
		logger.info("delete");
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		if(sessiondto != null && sessiondto.getMyrole()=="ADMIN") {
			int res = biz.delete(seq);
			if(res > 0) {
				return "redirect:joonggo_list.do?keyword=";
			}else {
				return "redirect:error.do";
			}
		}else {
			return "redirect:error.do";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/getpopularhit",method=RequestMethod.POST)
	public Map<String,Object> getPopularHitList(int seq) {
		logger.info("getpopularhit");
		//최근 7일간 조회 리스트 상위 20개 가져오기
		//-> 랜덤 6개
		
		List<joonggo> list = biz.selectPopularHit(seq);
		System.out.println("리스트사이즈" + list.size());
		
		List<Integer> randomlist = new ArrayList<Integer>();
		
		int size = list.size() >= 6? 6: list.size();
		
		while(randomlist.size() < size) {
			int random = (int)(Math.random()*list.size());
			if(randomlist.indexOf(random) == -1) {
				randomlist.add(random);
			}
		}
		System.out.println("랜덤리스트 사이즈" + randomlist);
		
		List<joonggo> result = new ArrayList<joonggo>();
		for(joonggo j : list) {
			if(randomlist.indexOf(list.indexOf(j)) != -1) {
				result.add(j);
			}
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		String toJson = null;
		try {
			toJson = mapper.writeValueAsString(result);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	    map.put("data",toJson);
		
		return map;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/renewal.do",method=RequestMethod.POST)
	public Map<String, Object> renewal(HttpSession session, String writer, int seq){
		logger.info("renewal");
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(sessiondto == null) {
			map.put("data","error");
		}else {
			if(!sessiondto.getMyid().equals(writer)) {
				map.put("data","error");
			}else {
				map.put("data",biz.renew(seq));
			}
		}
	    return map;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/joonggo_addheart.do",method=RequestMethod.POST)
	public Map<String, Object> addHeart(HttpSession session, String sessionid, int seq){
		logger.info("addheart");
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(sessiondto != null) {
			if(!sessiondto.getMyid().equals(sessionid)) {
				map.put("data","different");
			}else {
				Map<String,Object> params = new HashMap<String,Object>();
				params.put("heartid", sessionid);
				params.put("seq", seq);
				int res = biz.addheart(params);
				map.put("data",res>0? "성공":"실패");
			}
		}else {
			map.put("data",false);
		}
	    return map;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/joonggo_rmheart.do",method=RequestMethod.POST)
	public Map<String, Object> rmHeart(HttpSession session, String sessionid, int seq){
		logger.info("rmheart");
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(sessiondto != null) {
			if(!sessiondto.getMyid().equals(sessionid)) {
				map.put("data","different");
			}else {
				Map<String,Object> params = new HashMap<String,Object>();
				params.put("heartid", sessionid); //sessionid
				params.put("seq", seq);
				int res = biz.rmheart(params);
				map.put("data",res>0? "성공":"실패");
			}
		}else {
			map.put("data",false);
		}
	    return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/joonggo_confirmheart.do",method=RequestMethod.POST)
	public Map<String, Object> confirmHeart(HttpSession session, String sessionid, int seq){
		logger.info("confirmheart");
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(sessiondto != null) {
			if(!sessiondto.getMyid().equals(sessionid)) {
				map.put("data",false);
			}else {
				Map<String,Object> params = new HashMap<String,Object>();
				params.put("heartid", sessionid); //sessionid
				params.put("seq", seq);
				map.put("data",biz.confirmheart(params));
			}
		}else{
			map.put("data",false);
		}
	    return map;
	}
	
	
	@RequestMapping("/person.do")
	public String person(Model model, String id) {
		logger.info("person");
		List<joonggo> list = biz.person(id);
		
		ObjectMapper mapper = new ObjectMapper();
		String toJson = null;
		try {
			toJson = mapper.writeValueAsString(list);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		model.addAttribute("list", toJson);
		model.addAttribute("id", id);
		model.addAttribute("size", list.size());
		
		
		return "joonggo/joonggo_person"; 
	}
	
	
	@RequestMapping("/joonggo_reportform.do")
	public String reportform(HttpSession session, Model model, int seq, String writer, String reportid) {
		logger.info("reportform");
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		Map<String,Object> map = new HashMap<String,Object>();
		if(sessiondto != null) {
			if(!sessiondto.getMyid().equals(reportid)) {
				return "redirect:error.do";
			}else {
				model.addAttribute("reportid", reportid);
				model.addAttribute("writer", writer);
				model.addAttribute("seq", seq);
				return "joonggo/joonggo_reportform";
			}
		}else {
			return "redirect:error.do";
		}
	}
	
	
	@RequestMapping("/joonggo_report.do")
	@ResponseBody
	public String report(MultipartHttpServletRequest mtfRequest, HttpSession session, report report) {
		logger.info("report");
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		if(sessiondto != null) {
			if(!sessiondto.getMyid().equals(report.getReportid())) {
				return "error";
			}
		}else {
			return "error";
		}
		
		final String[] PERMISSION_FILE_EXT_ARR = {".GIF", ".JPEG", ".JPG", ".PNG", ".BMP"};
		List<MultipartFile> filelist = mtfRequest.getFiles("file");
		boolean nofile = false;
		
		for(MultipartFile mf : filelist) {
			
			String originalFileName = mf.getOriginalFilename();	//오리지날 파일명
			if(originalFileName.equals("")) {
				nofile = true;
				break;
			}
			String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); //확장자
			
			String ext = extension.toUpperCase();
			System.out.println("파일 확장자 : " + ext);
			boolean res = false;
			for(int i = 0; i < PERMISSION_FILE_EXT_ARR.length; i++) {
				if(PERMISSION_FILE_EXT_ARR[i].equals(ext)) {
					res = true;
				}
			}
			if(!res) {return "false";}
		}
		//첨부파일이 있는 경우 파일 검증완료
		
		if(!nofile) {
			String imglist = "";
			FtpClient fp = new FtpClient("oracleksk.p-e.kr", 21, "ftpuser", "1234");
			for(MultipartFile mf : filelist) {
				String originalFileName = mf.getOriginalFilename();	//오리지날 파일명
				String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
				
				boolean isuploaded = false;
				try {
					isuploaded = fp.upload(mf, savedFileName);
				} catch (SocketException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
				if(!isuploaded) {
					return "notuploaded";
				}else {
					imglist += savedFileName + ",";
				}
			}
			report.setFilepath(imglist.substring(0,imglist.length()-1));
		}else {
			report.setFilepath("");
		}
		
		int res = biz.report(report);
		if(res > 0) {
			return "success";
		}else {
			return "error";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="/addrSearch.do",method=RequestMethod.POST)
	public Map<String, Object> addrSearch(String category, String status, String keyword, String address, int km){
		logger.info("addrSearch");
		
		List<String> categories = category.length()==0? new ArrayList<String>():new ArrayList<String>(Arrays.asList(category.split(",")));
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("category", categories);
		map.put("status", status);
		map.put("regexp", getKeywords(keyword));
		List<joonggo> list = biz.setAddress(map);
		List<joonggo> res = new ArrayList<joonggo>();
		
		kakao k = new kakao();
		LocationDistance ld = new LocationDistance();
		
		k.setAddress(address);
		Map<String, Double> temp = k.getResult();
		double lati = temp.get("latitude");
		double longi = temp.get("longitude");
		
		for(int i = 0; i < list.size(); i++) {
			
			String place = list.get(i).getPlace();
			k.setAddress(place);
			Map<String, Double> tmp = k.getResult();
			
			double distance = ld.distance(lati, longi, tmp.get("latitude"), tmp.get("longitude"), "km");
			System.out.println("거리" + distance);
			System.out.println("km" + km);
			
			if(distance <= (double)km) {
				res.add(list.get(i));
			}
		}
		System.out.println("최종 리스트 사이즈" + res.size());
		
		Map<String,Object> maps = new HashMap<String,Object>();
		maps.put("islast", !(res.size() >= 10));
		
		if(res.size() >= 10) {
			res = res.subList(0, 9);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String toJson = null;
		try {
			toJson = mapper.writeValueAsString(res);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	    maps.put("data",toJson);
	    
	    return maps;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/addrMore.do",method=RequestMethod.POST)
	public Map<String, Object> addrMore(String category, String status, String keyword, String address, int km, String page){
		logger.info("addrMore");
		
		List<String> categories = category.length()==0? new ArrayList<String>():new ArrayList<String>(Arrays.asList(category.split(",")));
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("category", categories);
		map.put("status", status);
		map.put("regexp", getKeywords(keyword));
		List<joonggo> list = biz.setAddress(map);
		List<joonggo> res = new ArrayList<joonggo>();
		
		kakao k = new kakao();
		LocationDistance ld = new LocationDistance();
		
		k.setAddress(address);
		Map<String, Double> temp = k.getResult();
		double lati = temp.get("latitude");
		double longi = temp.get("longitude");
		
		for(int i = 0; i < list.size(); i++) {
			
			String place = list.get(i).getPlace();
			k.setAddress(place);
			Map<String, Double> tmp = k.getResult();
			
			double distance = ld.distance(lati, longi, tmp.get("latitude"), tmp.get("longitude"), "km");
			System.out.println("거리" + distance);
			System.out.println("km" + km);
			
			if(distance <= (double)km) {
				res.add(list.get(i));
			}
		}
		int pageCount = Integer.parseInt(page);
		res = res.subList(pageCount * 9, res.size());

		Map<String,Object> maps = new HashMap<String,Object>();
		maps.put("islast", !(res.size() >= 10));
		
		if(res.size() >= 10) {
			res = res.subList(0, 9);
		}
		System.out.println("추가 리스트 사이즈" + res.size());
		
		ObjectMapper mapper = new ObjectMapper();
		String toJson = null;
		try {
			toJson = mapper.writeValueAsString(res);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	    maps.put("data",toJson);
	    
	    return maps;
	}	
	
	//채팅폼 - 채팅신청
	@RequestMapping("/joonggo_chatform.do")
	public String chatform(HttpSession session, Model model, chatroom chatroom) {
		logger.info("chatform");
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		
		if(sessiondto != null) {
			if(!sessiondto.getMyid().equals(chatroom.getUserid())) {
				return "redirect:error.do";
			}else {
				model.addAttribute("userid", chatroom.getUserid());
				model.addAttribute("writer", chatroom.getWriter());
				
				List<chat> list = biz.chatConfirm(chatroom);
				ObjectMapper mapper = new ObjectMapper();
				String toJson = null;
				try {
					toJson = mapper.writeValueAsString(list);
				} catch (JsonGenerationException e) {
					e.printStackTrace();
				} catch (JsonMappingException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				model.addAttribute("list", toJson);
				return "joonggo/joonggo_chatform";
			}
		}else {
			return "redirect:error.do";
		}
	}
	
	//채팅방목록
	@RequestMapping("/mychatlist.do")
	public String getchatlist(HttpSession session, Model model) {	
		
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		
		if(sessiondto != null) {
			
			List<chatroom> roomlist = biz.getchatlist(sessiondto.getMyid());
			for(chatroom room : roomlist) {
				room.setImglist(room.getImglist().split(",")[0]);
			}
			/*
			String toJson = null;
			try {
				toJson = mapper.writeValueAsString(roomlist);
			} catch (JsonGenerationException e) {
				e.printStackTrace();
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}*/
			model.addAttribute("list", roomlist);
			model.addAttribute("sessionid", sessiondto.getMyid());
		}else {
			return "redirect:error.do";
		}
		
		return "mypage/my_member_chat";
	}
	
	//특정 방 클릭 - 마이페이지
	@RequestMapping("/joonggo_myroom.do")
	public String myroom(HttpSession session, Model model, chatroom chatroom) {
		logger.info("myroom");
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		
		if(sessiondto != null) {
			if(!sessiondto.getMyid().equals(chatroom.getUserid())) {
				return "redirect:error.do";
			}else {
				model.addAttribute("userid", chatroom.getUserid());
				model.addAttribute("writer", chatroom.getWriter());
				
				List<chat> list = biz.chatlist(chatroom.getRoomseq());
				
				if(list.size()==0) {
					return "redirect:error.do";
				}else {
					ObjectMapper mapper = new ObjectMapper();
					String toJson = null;
					try {
						toJson = mapper.writeValueAsString(list);
					} catch (JsonGenerationException e) {
						e.printStackTrace();
					} catch (JsonMappingException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					model.addAttribute("list", toJson);
					return "joonggo/joonggo_chatform";
				}
			}
		}else {
			return "redirect:error.do";
		}
	}
	
	@RequestMapping("/longpolling.do")
	@ResponseBody
	public Map<String, Object> longpolling(HttpServletRequest request ,HttpSession session, Model model, chatroom chatroom, String finaldate) {
		logger.info("longpolling");
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		Map<String,Object> map = new HashMap<String,Object>();
		System.out.println(finaldate);
		
		if(sessiondto != null) {
			if(!sessiondto.getMyid().equals(chatroom.getUserid())) {
				map.put("data", false);
			}else {
				
				map.put("data", true);
				
				Map<String,Object> maps = new HashMap<String,Object>();
				maps.put("finaldate", finaldate);
				maps.put("roomseq", chatroom.getRoomseq());
				
				while(true) {
					
					List<chat> list = biz.chatRefresh(maps);
					if(list.size() != 0) {
						
						ObjectMapper mapper = new ObjectMapper();
						String toJson = null;
						try {
							toJson = mapper.writeValueAsString(list);
						} catch (JsonGenerationException e) {
							e.printStackTrace();
						} catch (JsonMappingException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
					    map.put("list",toJson);
						
						break;
					}
					
					try {
						Thread.sleep(150);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					
				}
				
			}
			
		}else {
			map.put("data", false);
		}
		
		return map;
	}

	
	@RequestMapping("/joonggo_sendmessage.do")
	@ResponseBody
	public Map<String, Object> sendmessage(HttpSession session, chat chat) {
		logger.info("sendmessage");
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(sessiondto != null) {
			if(!sessiondto.getMyid().equals(chat.getSender())) {
				map.put("data", false);
			}else {
				int res = biz.sendMessage(chat);
				if(res>0) {
					map.put("data", true);
				}else {
					map.put("data", false);
				}
			}
		}else {
			map.put("data", false);
		}
		return map;
	}
	
	
	@RequestMapping("/joonggo_sendDeletemessage.do")
	@ResponseBody
	public Map<String, Object> sendDeletemessage(HttpSession session, chat chat) {
		logger.info("sendmessage");
		MemberDto sessiondto = (MemberDto) session.getAttribute("login");
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(sessiondto != null) {
			if(!sessiondto.getMyid().equals(chat.getSender())) {
				map.put("data", false);
			}else {
				chat.setContent(chat.getSender() + "님이 퇴장하셨습니다.");
				int res = biz.setDelete(chat);
				if(res>0) {
					map.put("data", true);
				}else {
					map.put("data", false);
				}
			}
		}else {
			map.put("data", false);
		}
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//file upload
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		System.out.println("테스트");
		
		JsonObject jsonObject = new JsonObject();
		
        
		String fileRoot = "http://oracleksk.p-e.kr/image/"; // IIS서버 주소
		 
		
		/*
		 * // 내부경로로 저장 String contextRoot = new
		 * HttpServletRequestWrapper(request).getRealPath("/"); String fileRoot =
		 * contextRoot+"resources/fileupload/";
		 */
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		//File targetFile = new File(fileRoot + savedFileName);	
		FtpClient fp = new FtpClient("oracleksk.p-e.kr", 21, "ftpuser", "1234"); //FTP 주소/포트번호/유저명/비밀번호
		
		boolean uploaded = false;
		try {
			uploaded = fp.upload(multipartFile, savedFileName);
		} catch (SocketException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if(uploaded) {
			jsonObject.addProperty("url", fileRoot + savedFileName); // 업로드성공시 IIS 서버로 접근한다 contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
		}else {
			jsonObject.addProperty("responseCode", "error");
		}
		String a = jsonObject.toString();
		return a;
	}	
	
	
	
	
	
	
}


































