package com.library.controller.member;

import java.util.Random;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.model.member.MemberDTO;
import com.library.service.member.SignupService;

@Controller
@RequestMapping("/member")
public class SignupController {

	@Autowired
	private SignupService signupService;

	@Autowired
	private JavaMailSender mailSender; // 이메일 전송 bean
	
	@Autowired
	private PasswordEncoder pwencoder; // 암호화 Encoder
	
	// 회원가입 페이지 진입 (get)
	@GetMapping("/signup")
	public String signupGET() {

		System.out.println("회원가입 페이지 진입");

		return "/member/sub2/signup";

	}

	// 회원가입 (post)
	@PostMapping("/signup")
	public String signupPOST(MemberDTO member) throws Exception {

		String encode_pw = pwencoder.encode(member.getUser_pw());
		member.setUser_pw(encode_pw);
		
		// 회원가입 service 쿼리 실행
		signupService.signUp(member);
		
		// 회원 권한 추가
		signupService.auth(member.getUser_id());

		System.out.println("회원가입 성공");

		return "redirect:/member/login";
	}

	// 아이디 중복검사
	@ResponseBody
	@PostMapping("/memberIdChk")
	public String memberIdChkPOST(String memberId) throws Exception {

		System.out.println("memberIdChk() 진입");

		int result = signupService.idCheck(memberId);

		if (result != 0) {

			return "fail";

		} else {

			return "success";

		}
	}

	// 이메일 인증
	@ResponseBody
	@GetMapping("/mailCheck")
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
