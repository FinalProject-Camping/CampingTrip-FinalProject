package com.camping.controller.model.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camping.controller.model.member.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberDto login(MemberDto dto) {
		MemberDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"login", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int insert(MemberDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@Override

	// 아이디 중복 체크
	public Integer idChk(String memberId) {
		
		Integer idCnt =0;
		//넘겨받은 아이디로 회원테이블을 조회하여 (카운트쿼리) 0이면 true 리턴=사용가능아이디, 0초과 이면 false리턴=사용하지않는아이읻
		try {
			idCnt=	sqlSession.selectOne(NAMESPACE+"idChk", memberId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return idCnt;
	}
	
	
	
	
	
	

}
