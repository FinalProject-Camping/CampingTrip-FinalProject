package com.camping.controller.model.member.dao;

import com.camping.controller.model.member.dto.MemberDto;

public interface MemberDao {
	String NAMESPACE = "mymember.";
	
	public MemberDto login(MemberDto dto);
	public int insert(MemberDto dto);
	

	// 아이디 중복 체크
	public Integer idChk(String memberId);
	
}
