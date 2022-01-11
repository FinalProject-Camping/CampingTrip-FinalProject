package com.camping.controller.model.joonggo.biz;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.camping.controller.model.joonggo.dao.dao;
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
	
	
	
}

























