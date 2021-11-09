package com.library.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.MemberMapper;
import com.library.model.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;

	// 회원가입
	@Override
	public void signUp(MemberDTO member) throws Exception {

		memberMapper.signUp(member);

	}

	// 중복 아이디 체크
	@Override
	public int idCheck(String user_id) throws Exception {

		return memberMapper.idCheck(user_id);

	}
	
	// 아이디 찾기 정보확인
	@Override
	public int search_id_check(MemberDTO member) throws Exception {
		
		return memberMapper.search_id_check(member);
	}

	// 아이디 찾기
	@Override
	public String search_id(MemberDTO member) throws Exception {
		return memberMapper.search_id(member);
	}
	
	// 비밀번호 찾기 정보 확인
	@Override
	public int search_pw_check(MemberDTO member) throws Exception {
		
		return memberMapper.search_pw_check(member);
	}

	// 비밀번호 찾기 성공후 초기화
	@Override
	public void reset_pw(MemberDTO member, String newPw) throws Exception {
		memberMapper.reset_pw(member, newPw);
		
	}


}
