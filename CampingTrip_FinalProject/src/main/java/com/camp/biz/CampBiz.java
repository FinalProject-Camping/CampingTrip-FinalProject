package com.camp.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.dao.CampDao;
import com.camp.dto.CampDto;

@Service
public class CampBiz {
	
	@Autowired
	private CampDao dao;

	public int Insert(CampDto dto) {
		return dao.insert(dto);
	}
}
