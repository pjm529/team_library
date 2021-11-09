package com.library.controller.member;

import java.util.Random;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.model.MemberDTO;
import com.library.service.member.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

	// 로그인 페이지 진입
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() {

		System.out.println("로그인 페이지 진입");

		return "/member/sub1/login";

	}

	@Autowired
	private MemberService memberService;

	@Autowired
	private JavaMailSender mailSender; // 이메일 전송 bean

	// 회원가입 페이지 진입 (get)
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signupGET() {

		System.out.println("회원가입 페이지 진입");

		return "/member/sub2/signup";

	}

	// 회원가입 (post)
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signupPOST(MemberDTO member) throws Exception {

		// 회원가입 service 쿼리 실행
		memberService.signUp(member);

		System.out.println("회원가입 성공");

		return "redirect:/member/login";
	}

	// 아이디 중복검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception {

		System.out.println("memberIdChk() 진입");

		int result = memberService.idCheck(memberId);

		if (result != 0) {

			return "fail";

		} else {

			return "success";

		}
	}

	// 이메일 인증
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {

		// view로부터 넘어온 데이터 확인
		System.out.println("이메일 데이터 전송 확인");
		System.out.println("이메일 : " + email);

		// 인증번호 난수 생성
		Random random = new Random();
		int checkNum = random.nextInt(899999) + 100000; // 100000 ~ 999999 범위의 난수 생성
		System.out.println("인증번호 : " + checkNum);

		String from = "library.raon@gmail.com";
		String to = email;
		String title = "라온 도서관 : 회원가입 인증";
		String content = "라온 도서관을 이용해주셔서 감사합니다." + "<br><br>" + "인증번호는 <b>" + checkNum + "</b> 입니다." + "<br><br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		// 메일 발송
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper mailHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

				mailHelper.setFrom(new InternetAddress(from, "라온도서관", "UTF-8"));
				mailHelper.setTo(to);
				mailHelper.setSubject(title);
				mailHelper.setText(content, true);

			}
		};

		try {
			mailSender.send(preparator);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum); // view단으로 보내기 위한 난수 String 파싱

		return num;

	}

}
