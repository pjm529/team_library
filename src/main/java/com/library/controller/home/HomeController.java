package com.library.controller.home;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.library.model.board.NoticeDTO;
import com.library.page.Criteria;
import com.library.service.board.NoticeService;

@Controller
public class HomeController {
	
	@Autowired
	private NoticeService noticeService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Criteria cri) {
		
		List<NoticeDTO> noticeList = noticeService.getListPaging(cri);
		model.addAttribute("noticeList", noticeList);
		
		
		
		return "index";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {

		HttpSession session = request.getSession();

		// 세션 초기화
		session.invalidate();

		return "redirect:/";

	}

	@GetMapping("/accessError")
	public String accessDenied() {

		return "/error/accessError";

	}

	@GetMapping("/accessError2")
	public String accessDenied2() {

		return "/error/accessError2";

	}

}
