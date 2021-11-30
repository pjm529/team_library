package com.library.mapper.mylib;

import org.apache.ibatis.annotations.Param;

import com.library.model.member.MemberDTO;

public interface MyPageMapper {

	// 회원 정보 출력
	public MemberDTO my_view(String user_id);

	// 회원 정보 수정
	public void my_modify(MemberDTO member);

	// 회원 탈퇴
	public void my_secession(String user_id);

	// 탈퇴 회원 테이블에 입력
	public void insert_secession(MemberDTO member);

	// 비밀번호 변경
	public int modify_pw(@Param("user_id")String user_id, @Param("user_pw")String user_pw);
}
