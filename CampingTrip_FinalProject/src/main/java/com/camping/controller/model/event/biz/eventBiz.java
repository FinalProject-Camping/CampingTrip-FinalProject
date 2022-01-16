package com.camping.controller.model.event.biz;

import java.util.HashMap;
import java.util.List;

import com.camping.controller.model.event.dto.eventDto;

public interface eventBiz {
	public List<eventDto> selectList(String pointId);
	public eventDto selectOne(int pointSeq);
	public void insertPoint(HashMap<String, Object> pointMap);
}