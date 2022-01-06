package com.camping.controller.model.camp.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.controller.model.camp.dao.CampDao;
import com.camping.controller.model.camp.dto.CampDto;

@Service
public class CampBiz {
	
	@Autowired
	private CampDao dao;

	public int Insert(CampDto dto) {
		return dao.insert(dto);
	}
}
