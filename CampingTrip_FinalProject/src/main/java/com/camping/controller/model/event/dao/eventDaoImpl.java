package com.camping.controller.model.event.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.controller.model.event.dto.eventDto;


@Repository
public class eventDaoImpl implements eventDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<eventDto> selectList(String regexp) {
		List<eventDto> res = new ArrayList<eventDto>();
	
		try {
			res = sqlSession.selectList(NAMESPACE + "selectList", regexp);
		} catch (Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}
		return res;
	}
}