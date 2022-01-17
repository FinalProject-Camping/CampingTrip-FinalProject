package com.camping.controller.model.event.biz;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.controller.model.event.dto.eventDto;
import com.camping.controller.model.event.dao.eventDao;

@Service
public class eventBizImpl implements eventBiz {
	@Autowired
	private eventDao dao;

	@Override
	public List<eventDto> selectList(String pointId) {
		return dao.selectList(pointId);
	}

	@Override
	public eventDto selectOne(int pointSeq) {
		return null;
	}

	@Override
	public void insertPoint(HashMap<String, Object> pointMap) {
		dao.insertPoint(pointMap);
	}
}