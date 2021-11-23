package com.library.mapper.member;

import com.library.model.member.MemberDTO;

public interface SignupMapper {

	// 회원가입
	public void signUp(MemberDTO member);

	// 아이디 중복 검사
	public int idCheck(String user_id);
	
	// 회원 권한 입력
	public void auth(String user_id);

}
