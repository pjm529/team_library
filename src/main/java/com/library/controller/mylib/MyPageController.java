package com.library.controller.mylib;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.model.member.MemberDTO;
import com.library.service.mylib.MyPageService;

@Controller
@RequestMapping("/mylib")
public class MyPageController {

	@Autowired
	private MyPageService myPageService;

	@Autowired
	private PasswordEncoder pwencoder; // 암호화 Encoder

	// 마이 페이지 진입
	@GetMapping("/mypage")
	public String mypage(Model model) {

		System.out.println("마이 페이지 진입");

		// 로그인 된 user_id 받아오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		String id = userDetails.getUsername();

		MemberDTO my = myPageService.my_view(id);

		my.setUser_reg_date(my.getUser_reg_date().substring(0, 10));

		model.addAttribute("my", my);

		return "/mylib/sub5/mypage";

	}

	// 수정 페이지 진입
	@GetMapping("/modify")
	public String modifyGET(Model model) {
		System.out.println("수정 페이지 진입");

		// 로그인 된 user_id 받아오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		String id = userDetails.getUsername();

		MemberDTO my = myPageService.my_view(id);

		my.setUser_reg_date(my.getUser_reg_date().substring(0, 10));

		model.addAttribute("my", my);

		return "/mylib/sub5/modify";

	}

	// 정보 수정
	@PostMapping("/modify")
	public String modifyPOST(MemberDTO member) {

		System.out.println("수정post 진입");

		// 로그인 된 user_id 받아오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		String id = userDetails.getUsername();

		member.setUser_id(id);

		myPageService.my_modify(member);

		return "redirect:/mylib/mypage";
	}

	// 탈퇴 페이지 진입
	@GetMapping("/secession")
	public String secessionGET() {

		System.out.println("탈퇴 페이지 진입");

		return "/mylib/sub5/secession";

	}

	// 탈퇴 가능 여부 체크
	@ResponseBody
	@PostMapping("/secession")
	public String secessionPOST(String user_pw, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		// 로그인 된 user_id 받아오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		String id = userDetails.getUsername();
		
		
		// 회원 정보 받아오기
		MemberDTO my = myPageService.user_book_count(id); 
		
		// 대출 중 도서 수
		int count = my.getUser_book_count();
		
		// db에 있는 회원 비밀번호
		String db_pw = my.getUser_pw(); 

		if (count > 0) {

			return "book";

		} else {

			// 입력한 비밀번호과 db에 있는 비밀번호가 같으면 탈퇴 수행
			if (pwencoder.matches(user_pw, db_pw)) {
				
				// 회원 탈퇴
				myPageService.my_secession(id);
				
				// 세션 초기화
				session.invalidate();
				
				return "success";

			} else {

				return "fail";

			}

		}

	}

}
