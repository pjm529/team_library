package com.library.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.library.model.search.BookDTO;
import com.library.page.Criteria;
import com.library.page.ViewPage;
import com.library.service.admin.LoanService;

@Controller
@RequestMapping(value = "/admin")
public class LoanController {

	@Autowired
	private LoanService loanService;

	@Autowired
	private JavaMailSender mailSender; // 이메일 전송 bean

	// 멤버 리스트 출력 (get)
	@RequestMapping(value = "/loan_list", method = RequestMethod.GET)
	public String loan_list(Model model, Criteria cri) {

		System.out.println("loan_list 진입");

		List<BookDTO> loan_list = loanService.loan_list_paging(cri);

		for (BookDTO book : loan_list) {

			book.setLoan_date(book.getLoan_date().substring(0, 10));
			if (book.getReturn_date() != null) {

				book.setReturn_date(book.getReturn_date().substring(0, 10));
			}

			book.setReturn_period(book.getReturn_period().substring(0, 10));
		}

		model.addAttribute("loan_list", loan_list);

		int total = loanService.get_total(cri);
		model.addAttribute("total", total);

		ViewPage vp = new ViewPage(cri, total);
		model.addAttribute("pageMaker", vp);

		return "/admin/sub2/loan_list";

	}

}
