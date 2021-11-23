package com.library.service.mylib;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.mylib.MyPageMapper;
import com.library.model.member.MemberDTO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper myPageMapper;

	// 회원 정보 출력
	@Override
	public MemberDTO my_view(String user_id) {
		return myPageMapper.my_view(user_id);
	}

	// 회원 정보 수정
	@Override
	public void my_modify(MemberDTO member) {
		myPageMapper.my_modify(member);
	}

	// 회원의 대출 중 도서 수와 비밀번호 받아오기
	@Override
	public MemberDTO user_book_count(String user_id) {
		return myPageMapper.user_book_count(user_id);
	}

	// 회원 탈퇴
	@Override
	public void my_secession(String user_id) {
		myPageMapper.my_secession(user_id);
	}

}
