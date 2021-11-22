package com.library.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.model.member.MemberDTO;
import com.library.page.Criteria;
import com.library.page.ViewPage;
import com.library.service.admin.AdminListService;

@Controller
@RequestMapping("/admin")
public class AdminListController {
	
	@Autowired
	private AdminListService adminListService;

	// 연체 중 리스트 출력 (get)
	@GetMapping("/admin-list")
	public String overdue_list(Model model,  Criteria cri) {
		List<MemberDTO> admin_list = adminListService.list_paging(cri);
		
		for (MemberDTO m : admin_list) {

			m.setUser_reg_date(m.getUser_reg_date().substring(0, 10));
		}

		model.addAttribute("admin_list", admin_list);

		int total = adminListService.get_total(cri);
		model.addAttribute("total", total);

		ViewPage vp = new ViewPage(cri, total);
		model.addAttribute("pageMaker", vp);
		
		return "/admin/sub5/admin_list";

	}
	
	// 연체 중 리스트 출력 (get)
	@GetMapping("/add-popup")
	public String add_popup(Model model) {

		return "/admin/sub5/add_popup";

	}


}
