package com.camping.controller.model.member.biz;

import com.camping.controller.model.member.dto.MemberDto;

public interface MemberBiz {
	public MemberDto login(MemberDto dto);
	public int insert(MemberDto dto);
	public Integer idChk(String memberId);
	public String findId(MemberDto dto);
	public Integer resetPw(MemberDto dto);
	public MemberDto select(String memberId);
	public int update(MemberDto dto);
	public int enabledUpdate(MemberDto dto);
}
