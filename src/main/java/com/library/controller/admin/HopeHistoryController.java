package com.library.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.model.member.MemberDTO;
import com.library.model.mylib.HopeDTO;
import com.library.page.Criteria;
import com.library.page.ViewPage;
import com.library.service.admin.HopeHistoryService;

@Controller
@RequestMapping("/admin")
public class HopeHistoryController {

	@Autowired
	private HopeHistoryService hopeHistoryService;
	
	@GetMapping("/hope-history")
	public String hope_history(Model model, Criteria cri) {

		System.out.println("희망도서신청내역 진입");

		List<HopeDTO> hope_list = hopeHistoryService.hope_list(cri);

		for (HopeDTO hope : hope_list) {

			hope.setHope_reg_date(hope.getHope_reg_date().substring(0, 10));
		}

		model.addAttribute("hope_list", hope_list);

		int total = hopeHistoryService.get_total();
		model.addAttribute("total", total);

		ViewPage vp = new ViewPage(cri, total);
		model.addAttribute("pageMaker", vp);

		return "/admin/sub5/hope_history";

	}
	
	@GetMapping("/hope-info")
	public String hope_info(Model model, Criteria cri, @RequestParam String hope_no) {
		
		HopeDTO hope = hopeHistoryService.hope_info(hope_no);

		hope.setHope_reg_date(hope.getHope_reg_date().substring(0, 10));

		model.addAttribute("hope", hope);
		model.addAttribute("cri", cri);

		return "/admin/sub5/hope_info";
	}
}
