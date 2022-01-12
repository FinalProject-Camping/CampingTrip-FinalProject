package com.camping.controller.model.event.dao;

import java.util.List;

import com.camping.controller.model.event.dto.eventDto;

public interface eventDao {
	String NAMESPACE = "event.";
	public List<eventDto> selectList(String regexp);
}