package com.camping.controller.model.event.biz;

import java.util.List;

import com.camping.controller.model.event.dto.eventDto;

public interface eventBiz {
	public List<eventDto> selectList(String regexp);
}