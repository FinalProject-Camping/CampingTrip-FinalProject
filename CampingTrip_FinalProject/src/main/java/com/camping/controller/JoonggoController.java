package com.camping.controller;


import java.io.IOException;
import java.net.SocketException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

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

import com.camping.controller.model.joonggo.biz.biz;
import com.camping.controller.model.joonggo.dto.FtpClient;
import com.camping.controller.model.joonggo.dto.joonggo;
import com.google.gson.JsonObject;



@Controller
public class JoonggoController {
	private static final Logger logger = LoggerFactory.getLogger(JoonggoController.class);
	@Autowired
	private biz biz;
	
	@RequestMapping("/list.do")
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
		/*
		  userDto sessiondto = (userDto)session.getAttribute("login");
		  if(sessiondto != null)... */
		//model.addAttribute("sessiondto", sessiondto); 
		
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
	
	
	@RequestMapping("/error.do")
	public String error() {
		logger.info("error");
		return "joonggo/error";
	}
	
	
	@RequestMapping("/selectone")
	public String selectone(HttpSession session, Model model, int seq) {
		logger.info("selectone : " + seq);
		joonggo dto = biz.selectone(seq, false);
		
		if(dto != null) {
			dto.setRegdate(new Timestamp(dto.getRegdate().getTime()));
			dto.setQuality(dto.getQuality().equals("A")?"미개봉":dto.getQuality().equals("B")?"거의 새 것":"사용감 있음");
			dto.setDelivery(dto.getDelivery().equals("A")?"직거래, 택배 거래":dto.getDelivery().equals("D")?"직거래":"택배 거래");
			
			model.addAttribute("dto", dto);
			/*
			  userDto sessiondto = (userDto)session.getAttribute("login");
			  if(sessiondto != null)... */
			//model.addAttribute("sessiondto", sessiondto); 
			
		}else {
			return "joonggo/error";
		}
		return "joonggo/joonggo_detail";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/insertConfirm",method=RequestMethod.POST)
	public Map<String,Object> insertConfirm(HttpSession session) {
		logger.info("insertConfirm");
		/*
		  userDto sessiondto = (userDto)session.getAttribute("login");
		   */
		  
		
		Map<String,Object> map = new HashMap<String,Object>();
	    map.put("data",true); //sessiondto != null
	    //map.put("penalty", sessiondto.getPenalty()); if(sessiondto != null) 
		
		return map;
	}
	
	@RequestMapping("/insertform")
	public String insertform(HttpSession session, Model model) {
		logger.info("insertform");
		/*
		  userDto sessiondto = (userDto)session.getAttribute("login");
		   */
		//세션확인 else return joonggo/error
		//sessiondto.getpenalty 확인 else joonggo/error
		
		//model.addAttribute('sessiondto', sessiondto);
		return "joonggo/joonggo_insertForm";
	}
	
	@RequestMapping("/insert")
	public String insert(HttpSession session, joonggo joonggo) {
		logger.info("insert");
		/*
		  userDto sessiondto = (userDto)session.getAttribute("login");
		   */
		
		//insert 요청한 계정과 현재 세션이 다르면 안됨 if(joonggo.getId().equals(sessiondto.getId)) else return joonggo/error
		
		//sessiondto.getpenalty 확인
		
		joonggo.setId("호갱");
		
		int res = biz.insert(joonggo);
		if(res > 0) {
			return "redirect:selectone.do?seq=" + res;
		}else {
			return "joonggo/error";
		}
	}
	

	
	@RequestMapping("/updateform")
	public String updateForm(HttpSession session, Model model, String writer, int seq) {
		logger.info("updateform" + seq);
		//세션이 끊겼는지 확인 userDto sessiondto = (userDto)session.getAttribute("login");
		
		joonggo dto = biz.selectone(seq, true);
		
		if(dto != null) {
			//if(sessiondto.equals(writer)) ... else{return joonggo/error}
			model.addAttribute("dto", dto);
			return "joonggo/joonggo_updateform";
		}else {
			return "joonggo/error";
		}
		
	}
	
	@RequestMapping("/update")
	public String update(HttpSession session, joonggo joonggo) {
		logger.info("update");
		
		/*
		  userDto sessiondto = (userDto)session.getAttribute("login");
		   */
		
		
		int seq = joonggo.getSeq();
			//if(sessiondto.getUserid().equals(joonggo.getId())) 
			int res = biz.update(joonggo);
			if(res > 0) {
				return "redirect:selectone.do?seq=" + seq;
			}else {
				return "joonggo/error";
			}
			//else return joonggo/error
	}
	
	@RequestMapping("/delete")
	public String delete(HttpSession session, String writer, int seq) {
		logger.info("delete");
		/*
		  userDto sessiondto = (userDto)session.getAttribute("login");
		  */
	    
		
		//if(sessiondto.getUserid.equals(writer)) 
			int res = biz.delete(seq);
			if(res > 0) {
				return "redirect:list.do?keyword=";
			}else {
				return "joonggo/error";
			}
		//else return joonggo/error
		
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
		/*
		  userDto sessiondto = (userDto)session.getAttribute("login");
		  */
		
		//if(sessiondto.getUserid.equals(writer))
		Map<String,Object> map = new HashMap<String,Object>();
	    map.put("data",biz.renew(seq));
	    //else maps.put("data","error");
	    
	    return map;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/addheart.do",method=RequestMethod.POST)
	public Map<String, Object> addHeart(HttpSession session, String sessionid, int seq){
		logger.info("addheart");
		/*
		  userDto sessiondto = (userDto)session.getAttribute("login");
		  */
		
		//if(sessiondto != null) 
			//if(sessionid.equals(sessiondto.getUserid()){
			Map<String,Object> map = new HashMap<String,Object>();
			Map<String,Object> params = new HashMap<String,Object>();
			params.put("heartid", "가나다"); //sessionid
			params.put("seq", seq);
			int res = biz.addheart(params);
			map.put("data",res>0? "성공":"실패");
			//else{ map.put("data","differenet");}
			
		//else map.put("data",sessiondto != null);

		
		
	    return map;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/rmheart.do",method=RequestMethod.POST)
	public Map<String, Object> rmHeart(HttpSession session, String sessionid, int seq){
		logger.info("rmheart");
		/*
		  userDto sessiondto = (userDto)session.getAttribute("login");
		  */
		
		//if(sessiondto != null) 
			//if(sessionid.equals(sessiondto.getUserid()){
			Map<String,Object> map = new HashMap<String,Object>();
			Map<String,Object> params = new HashMap<String,Object>();
			params.put("heartid", "가나다"); //sessionid
			params.put("seq", seq);
			int res = biz.rmheart(params);
			map.put("data",res>0? "성공":"실패");
			//else{ map.put("data","differenet");}
			
		//else map.put("data",sessiondto != null);

		
		
	    return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/confirmheart.do",method=RequestMethod.POST)
	public Map<String, Object> confirmHeart(HttpSession session, String sessionid, int seq){
		logger.info("renewal");
		/*
		  userDto sessiondto = (userDto)session.getAttribute("login");
		  */
		
		//if(sessiondto != null) 
			//if(sessionid.equals(sessiondto.getUserid()){
			Map<String,Object> map = new HashMap<String,Object>();
			Map<String,Object> params = new HashMap<String,Object>();
			params.put("heartid", "가나다"); //sessionid
			params.put("seq", seq);
			map.put("data",biz.confirmheart(params));
			//else{ map.put("data",false);}
			
		//else map.put("data",sessiondto != null);

	    return map;
	}
	
	
	@RequestMapping("/person.do")
	public String person(Model model, String id) {
		
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

































