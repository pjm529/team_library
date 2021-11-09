package com.library.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	// 로그인 페이지 진입
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() {

		System.out.println("로그인 페이지 진입");

		return "/member/sub1/login";

	}

}
