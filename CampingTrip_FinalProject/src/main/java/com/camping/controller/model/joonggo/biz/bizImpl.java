package com.camping.controller.model.joonggo.biz;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.camping.controller.model.joonggo.dao.dao;
import com.camping.controller.model.joonggo.dto.chat;
import com.camping.controller.model.joonggo.dto.chatroom;
import com.camping.controller.model.joonggo.dto.joonggo;
import com.camping.controller.model.joonggo.dto.renew;
import com.camping.controller.model.joonggo.dto.report;

@Service
public class bizImpl implements biz{
	@Autowired
	private dao dao;

	@Override
	public List<joonggo> selectList(String regexp) {
		return dao.selectList(regexp);
	}

	@Override
	public List<joonggo> setCategoryAndStatus(Map<String, Object> map) {
		return dao.setCategoryAndStatus(map);
	}

	@Override
	public List<joonggo> moreResult(Map<String, Object> map) {
		return dao.moreResult(map);
	}

	@Override
	public int insert(joonggo joonggo) {
		return dao.insert(joonggo);
	}

	@Override
	@Transactional
	public joonggo selectone(int seq, boolean isupdate) {
		
		if(!isupdate) {
			dao.recordHitData(seq);
			dao.updateviewcnt(seq);
		}
		return dao.selectone(seq);
	}

	@Override
	public int delete(int seq) {
		return dao.delete(seq);
	}

	@Override
	public int update(joonggo joonggo) {
		return dao.update(joonggo);
	}

	@Override
	public List<joonggo> selectPopularHit(int seq) {
		return dao.selectPopularHit(seq);
	}

	@Override
	public String renew(int seq) {
		
		//1 5회가 이미 있을 시 리턴 
		List<renew>	list = dao.confirmRenew(seq);
		if(list.size() == 5) {
			return "초과";
		}
		if(list.size() != 0) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			Date date = list.get(0).getRenewdate();
			Date now = new Date();
			
			String renewdate = sdf.format(date);
			String nowdate = sdf.format(now);
			if(nowdate.equals(renewdate)) {
				return "실패";
			}
			/* 24시간 이내로 하는경우
			if((now.getTime() - date.getTime())/3600000 < 24) {
				return "실패";
			}*/
		}
		if(dao.updateRenew(seq) < 0) {
			return "실패";
		}
		if(dao.insertRenew(seq) < 0) {
			return "실패";
		}
		return "성공";
	}

	@Override
	public int addheart(Map<String,Object> map) {
		
		int res = dao.addheart(map);
		if(res > 0) {
			dao.upheart(map);
			return res;
		}else {
			return res;
		}
	}

	@Override
	public int rmheart(Map<String, Object> map) {
		
		int res = dao.rmheart(map);
		if(res > 0) {
			dao.downheart(map);
			return res;
		}else {
			return res;
		}
	}

	@Override
	public boolean confirmheart(Map<String, Object> map) {
		return dao.confirmheart(map)!=null;
	}

	@Override
	public List<joonggo> person(String id) {
		return dao.person(id);
	}

	@Override
	public List<joonggo> selectlist_main() {
		return dao.selectlist_main();
	}

	@Override
	public int report(report report) {
		return dao.report(report);
	}

	@Override
	public List<joonggo> setAddress(Map<String, Object> map) {
		return dao.setAddress(map);
	}

	@Override
	public List<chat> chatConfirm(chatroom room) {
		
		chatroom res = dao.getroom(room);
		if(res == null) {
			//개설된 채팅방이 없음
			int createres = dao.createroom(room);
			if(createres == 0) {
				System.out.println("인서트에러");
			}else {
				res = dao.getroom(room);
			}
		}
		
		List<chat> chatlist = dao.chatlist(res.getRoomseq());
		if(chatlist.size() == 1) {
			dao.updateDate(res.getRoomseq());
			chatlist = dao.chatlist(res.getRoomseq());
		}
		
		return chatlist;
	}
	
	@Override
	public List<chat> chatlist(int roomseq){
		List<chat> chatlist = dao.chatlist(roomseq);
		
		return chatlist;
	}

	@Override
	public int sendMessage(chat chat) {
		return dao.sendMessage(chat);
	}

	@Override
	public List<chatroom> getchatlist(String sessionid) {
		
		List<chatroom> all = dao.getchatlist_all(sessionid);
		List<chatroom> only = dao.getchatlist(sessionid);
		System.out.println(all.size());
		System.out.println(only.size());
		
		if(all.size() != only.size()) {
			
			for(int i = 0; i < all.size(); i++) {
				
				boolean flag = false;
				for(int j = 0; j < only.size(); j++) {
					
					if(all.get(i).getRoomseq() == only.get(j).getRoomseq()) {
						all.set(i, only.get(j));
						flag = true;
						break;
					}
					
				}
				if(!flag) {
					all.get(i).setImglist("");
					all.get(i).setTitle("삭제된 게시글");
				}
				
			}
			
			return all;
			
			
		}else {
			return only;
		}
	}

	@Override
	public List<chat> chatRefresh(Map<String, Object> map) {
		
		return dao.chatRefresh(map);
	}

	@Override
	public int setDelete(chat chat) {
		
		int res = dao.setDelete(chat);
		if(res > 0) {
			chat.setSender("exit");
			return dao.sendMessage(chat);
		}else {
			return 0;
		}
		
	}
	
	
}

























