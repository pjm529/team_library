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


}
