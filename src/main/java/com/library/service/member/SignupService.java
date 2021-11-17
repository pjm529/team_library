package com.library.service.member;

import com.library.model.member.MemberDTO;

public interface SignupService {

	// 회원가입
	public void signUp(MemberDTO member) throws Exception;

	// 중복 아이디 체크
	public int idCheck(String user_id) throws Exception;
}
