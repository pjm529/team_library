package com.library.mapper.member;

import org.apache.ibatis.annotations.Param;

import com.library.model.member.MemberDTO;

public interface MemberMapper {

	// 회원가입
	public void signUp(MemberDTO member);

	// 아이디 중복 검사
	public int idCheck(String user_id);

	// 아이디 찾기 정보 확인
	public int search_id_check(MemberDTO member);

	// 아이디 찾기
	public String search_id(MemberDTO member);

	// 비밀번호 찾기 정보 확인
	public int search_pw_check(MemberDTO member);

	// 비밀번호 찾기 성공후 초기화, 다중 파라미터 사용
	public void reset_pw(@Param("member") MemberDTO member, @Param("newPw") String newPw);
}
