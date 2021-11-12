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
import com.library.service.admin.OverdueService;

@Controller
@RequestMapping(value = "/admin")
public class OverdueController {

	@Autowired
	private OverdueService overdueService;

	@Autowired
	private JavaMailSender mailSender; // 이메일 전송 bean

	// 연체 중 리스트 출력 (get)
	@RequestMapping(value = "/overdue_list", method = RequestMethod.GET)
	public String overdue_list(Model model, Criteria cri) {

		System.out.println("overdue_list");

		List<BookDTO> overdue_list = overdueService.overdue_list_paging(cri);

		for (BookDTO book : overdue_list) {

			book.setLoan_date(book.getLoan_date().substring(0, 10));
			if (book.getReturn_date() != null) {

				book.setReturn_date(book.getReturn_date().substring(0, 10));
			}

			book.setReturn_period(book.getReturn_period().substring(0, 10));
		}

		model.addAttribute("overdue_list", overdue_list);

		int total = overdueService.get_total(cri);
		model.addAttribute("total", total);

		ViewPage vp = new ViewPage(cri, total);
		model.addAttribute("pageMaker", vp);

		return "/admin/sub3/overdue_list";

	}
	
	

	// 도서 반납 (get)
//	@RequestMapping(value = "/return_book", method = RequestMethod.GET)
//	public String return_book(BookDTO book, Model model, Criteria cri) {
//
//		System.out.println("return_book 진입");
//
//		loanService.return_book(book);
//		
//		int amount = cri.getAmount();
//		int page = cri.getPage();
//		String type = cri.getType();
//		String keyword;
//		
//		try {
//			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			return "redirect:/admin/sub2/loan_list";
//		}
//
//		return "redirect:/admin/loan_list?amount="+ amount + "&page=" + page + "&type=" + type + "&keyword="
//				+ keyword;
//
//	}

}
