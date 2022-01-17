package com.camping.controller.model.event.dao;

import java.util.ArrayList;
import java.util.HashMap;
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
	public List<eventDto> selectList(String pointId) {
		List<eventDto> list = new ArrayList<eventDto>();
	
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList", pointId);
		} catch (Exception e) {
			System.out.println("[error] : selectList");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public eventDto selectOne(int pointSeq) {
		return null;
	}

	@Override
	public void insertPoint(HashMap<String, Object> pointMap) {
		try {
			sqlSession.insert(NAMESPACE + "insertPoint", pointMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}