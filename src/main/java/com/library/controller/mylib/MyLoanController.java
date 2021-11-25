package com.library.controller.mylib;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.model.search.BookDTO;
import com.library.page.Criteria;
import com.library.page.ViewPage;
import com.library.service.mylib.MyLoanService;

@Controller
@RequestMapping("/mylib")
public class MyLoanController {

	@Autowired
	private MyLoanService myLoanService;

	// 대출 중 리스트 출력 (get)
	@GetMapping("/loan-list")
	public String my_loan_list(Model model) {

		System.out.println("my_loan_list 진입");

		// 로그인 된 user_id 받아오기
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		String id = userDetails.getUsername();

		List<BookDTO> loan_list = myLoanService.loan_list_paging(id);

		for (BookDTO book : loan_list) {

			book.setLoan_date(book.getLoan_date().substring(0, 10));
			if (book.getReturn_date() != null) {

				book.setReturn_date(book.getReturn_date().substring(0, 10));
			}

			book.setReturn_period(book.getReturn_period().substring(0, 10));
		}

		model.addAttribute("loan_list", loan_list);

		int total = myLoanService.get_total(id);
		model.addAttribute("total", total);

		return "/mylib/sub1/loan_list";

	}

}
