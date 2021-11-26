package com.library.controller.mylib;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.model.mylib.HopeDTO;
import com.library.page.Criteria;
import com.library.page.ViewPage;
import com.library.service.mylib.HopeService;

@Controller
@RequestMapping("/mylib")
public class HopeController {

	@Autowired
	private HopeService hopeService;
	
	@GetMapping("/hope")
	public String hopeGET(Model model) {

		System.out.println("도서신청 폼 진입");

		return "/mylib/sub2/hope";

	}
	
	@PostMapping("/hope")
	public String hopePOST(HopeDTO hope, Principal principal) {
		
		System.out.println("도서신청 post");
		hope.setUser_id(principal.getName());
		
		hopeService.insert_hope(hope);
		
		return "redirect:/mylib/hope";
	}
	
	@GetMapping("/hope-history")
	public String hope_history(Model model, Criteria cri, Principal principal) {

		System.out.println("희망도서신청내역 진입");

		List<HopeDTO> hope_list = hopeService.hope_list(cri, principal.getName());

		for (HopeDTO hope : hope_list) {

			hope.setHope_reg_date(hope.getHope_reg_date().substring(0, 10));
		}

		model.addAttribute("hope_list", hope_list);

		int total = hopeService.get_total(principal.getName());
		model.addAttribute("total", total);

		ViewPage vp = new ViewPage(cri, total);
		model.addAttribute("pageMaker", vp);

		return "/mylib/sub2/hope_history";

	}
}
