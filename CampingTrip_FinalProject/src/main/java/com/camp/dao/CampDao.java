package com.camp.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camp.dto.CampDto;

@Repository
public class CampDao {
	
	String NAMESPACE="camp.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insert(CampDto dto) {
		int res = 0;
		
		try {
			res=sqlSession.insert(NAMESPACE+"insert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
}
