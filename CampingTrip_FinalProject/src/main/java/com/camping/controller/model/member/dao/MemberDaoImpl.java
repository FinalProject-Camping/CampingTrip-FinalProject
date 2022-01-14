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
	

	// 회원ID찾기
	public String findId(MemberDto dto) {
		
		String id ="";
		//넘겨받은 회원정보로 회원아이디를 조회하여 반환
		try {
			id=sqlSession.selectOne(NAMESPACE+"findId", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}
	
	//회원비밀번호초기화
	public Integer resetPw(MemberDto dto) {
		
		Integer res =0;
		//넘겨받은 아이디로 회원테이블을 조회하여 (카운트쿼리) 0이면 true 리턴=사용가능아이디, 0초과 이면 false리턴=사용하지않는아이읻
		try {
			res=	sqlSession.update(NAMESPACE+"resetPw", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	//회원정보 상세 조회
	public MemberDto select(String memberId) {
		
		MemberDto res = new MemberDto();
		
		try {
			res=sqlSession.selectOne(NAMESPACE+"select", memberId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
		
	}	
	
	//회원정보 수정
	public int update(MemberDto dto) {
		
		int res = 0;
		
		try {
			res=sqlSession.update(NAMESPACE+"update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
		
	}	
	
	//활성화 여부 수정
	public int enabledUpdate(MemberDto dto) {
		
		int res = 0;
		
		try {
			res=sqlSession.update(NAMESPACE+"enabledUpdate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
		
	}
	

}
