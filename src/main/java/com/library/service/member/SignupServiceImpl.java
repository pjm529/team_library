package com.library.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.member.SignupMapper;
import com.library.model.member.MemberDTO;

@Service
public class SignupServiceImpl implements SignupService {

	@Autowired
	private SignupMapper signupMapper;

	// 회원가입
	@Override
	public void signUp(MemberDTO member) throws Exception {

		signupMapper.signUp(member);

	}

	// 중복 아이디 체크
	@Override
	public int idCheck(String user_id) throws Exception {

		return signupMapper.idCheck(user_id);

	}

}
