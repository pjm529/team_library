package com.library.service.member;

import com.library.model.MemberDTO;

public interface MemberService {

	// 회원가입
	public void signUp(MemberDTO member) throws Exception;

	// 중복 아이디 체크
	public int idCheck(String user_id) throws Exception;

	// 아이디 찾기 정보확인
	public int search_id_check(MemberDTO member) throws Exception;

	// 아이디 찾기
	public String search_id(MemberDTO member) throws Exception;

	// 비밀번호 찾기 정보 확인
	public int search_pw_check(MemberDTO member) throws Exception;

	// 비밀번호 찾기 성공후 초기화
	public void reset_pw(MemberDTO member, String newPw) throws Exception;
}
