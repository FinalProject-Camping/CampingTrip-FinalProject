package com.camping.controller.model.member.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.controller.model.member.dao.MemberDao;
import com.camping.controller.model.member.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz {

	@Autowired
	private MemberDao dao;
	
	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}
	
	@Override
	public int insert(MemberDto dto) {
		return dao.insert(dto);
	}
	
	@Override
	public Integer idChk(String memberId) {
		return dao.idChk(memberId);
	}
	

	@Override
	public String findId(MemberDto dto) {
		return dao.findId(dto);
	}

	@Override
	public Integer resetPw(MemberDto dto) {
		return dao.resetPw(dto);
	}
}
