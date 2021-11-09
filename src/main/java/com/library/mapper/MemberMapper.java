package com.library.mapper;

import com.library.model.MemberDTO;

public interface MemberMapper {

	// 회원가입
	public void signUp(MemberDTO member);

	// 아이디 중복 검사
	public int idCheck(String user_id);

}
