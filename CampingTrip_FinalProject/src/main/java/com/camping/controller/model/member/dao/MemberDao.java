package com.camping.controller.model.member.dao;

import com.camping.controller.model.member.dto.MemberDto;

public interface MemberDao {
	String NAMESPACE = "mymember.";
	
	public MemberDto login(MemberDto dto);
	
	public int insert(MemberDto dto);

	// 아이디 중복 체크
	public Integer idChk(String memberId);
	
	public String findId(MemberDto dto);
	
	public Integer resetPw(MemberDto dto);
	
	//회원정보 조회
	public MemberDto select(String memberId);
	
	//회원정보 수정
	public int update(MemberDto dto);
	
	//활성화 여부 수정
	public int enabledUpdate(MemberDto dto);
}
