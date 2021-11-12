package com.library.controller.admin;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.model.member.MemberDTO;
import com.library.page.Criteria;
import com.library.page.ViewPage;
import com.library.service.admin.AdminService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private JavaMailSender mailSender; // 이메일 전송 bean

	// 멤버 리스트 출력 (get)
	@RequestMapping(value = "/member_list", method = RequestMethod.GET)
	public String member_list(Model model, Criteria cri) {

		System.out.println("member_list 진입");

//		List<MemberDTO> member_list = adminService.member_list();

		List<MemberDTO> member_list = adminService.list_paging(cri);

		for (MemberDTO m : member_list) {

			m.setUser_reg_date(m.getUser_reg_date().substring(0, 10));
		}

		model.addAttribute("member_list", member_list);

		int total = adminService.get_total(cri);
		model.addAttribute("total", total);

		ViewPage vp = new ViewPage(cri, total);
		model.addAttribute("pageMaker", vp);

		return "/admin/sub1/member_list";

	}

	// 멤버 조회
	@RequestMapping(value = "/member_view", method = RequestMethod.GET)
	public String member_view(Model model, Criteria cri, @RequestParam String user_id) {

		MemberDTO member = adminService.member_view(user_id);

		member.setUser_reg_date(member.getUser_reg_date().substring(0, 10));

		model.addAttribute("member", member);
		model.addAttribute("cri", cri);

		return "/admin/sub1/member_view";
	}

	// 회원 수정 폼 진입
	@RequestMapping(value = "/member_modify", method = RequestMethod.GET)
	public String member_modifyGet(Model model, Criteria cri, @RequestParam String user_id) {

		MemberDTO member = adminService.member_view(user_id);

		member.setUser_reg_date(member.getUser_reg_date().substring(0, 10));

		model.addAttribute("member", member);
		model.addAttribute("cri", cri);

		return "/admin/sub1/member_modify";
	}

	// 회원 수정
	@RequestMapping(value = "/member_modify", method = RequestMethod.POST)
	public String member_modifyPost(Model model, Criteria cri, MemberDTO member) {

		adminService.member_modify(member);
		String keyword;
		int amount = cri.getAmount();
		int page = cri.getPage();
		String type = cri.getType();
		model.addAttribute("user_id", member.getUser_id());
		
		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/admin/member_list";
		}

		return "redirect:/admin/member_view?amount=" + amount + "&page=" + page + "&type=" + type + "&keyword="
				+ keyword;
	}
	
	// 회원 탈퇴
	@RequestMapping(value = "/member_delete", method = RequestMethod.GET)
	public String member_delete(Criteria cri, @RequestParam String user_id) {

		adminService.member_delete(user_id);

		int amount = cri.getAmount();
		int page = cri.getPage();
		String type = cri.getType();
		String keyword;
		
		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/admin/member_list";
		}
		
		return "redirect:/admin/member_list?amount=" + amount + "&page=" + page + "&type=" + type + "&keyword="
		+ keyword;
	}

}
