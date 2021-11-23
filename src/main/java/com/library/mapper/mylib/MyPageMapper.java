package com.library.mapper.mylib;

import com.library.model.member.MemberDTO;

public interface MyPageMapper {

	// 회원 정보 출력
	public MemberDTO my_view(String user_id);

	// 회원 정보 수정
	public void my_modify(MemberDTO member);

	// 회원의 대출 중 도서 수와 비밀번호 받아오기
	public MemberDTO user_book_count(String user_id);

	// 회원 탈퇴
	public void my_secession(String user_id);

	// 탈퇴 회원 테이블에 입력
	public void insert_secession(String user_id);
}
