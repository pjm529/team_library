package com.library.controller.mylib;

import java.util.Calendar;
import java.util.Date;
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

		// 회원 대출 중 리스트
		List<BookDTO> loan_list = myLoanService.loan_list_paging(id);

		for (BookDTO book : loan_list) {

			book.setLoan_date(book.getLoan_date().substring(0, 10));
			if (book.getReturn_date() != null) {

				book.setReturn_date(book.getReturn_date().substring(0, 10));
			}

			book.setReturn_period(book.getReturn_period().substring(0, 10));
		}

		// 대출 중 내역
		model.addAttribute("loan_list", loan_list);

		// 대출 내역 수
		int total = myLoanService.get_total(id);
		model.addAttribute("total", total);

		// 대출 연체 권수
		int overdue_count = myLoanService.get_overdue(id);
		model.addAttribute("overdue_count", overdue_count);
		
		// 회원 대출 정지일
		int overdue_date = myLoanService.get_overdue_date(id);

		if (overdue_date != 0) {
			model.addAttribute("overdue_date", date(overdue_date));
		} else {
			model.addAttribute("overdue_date", "해당없음");
		}

		return "/mylib/sub1/loan_list";

	}

	public String date(int overdue_date) {
		Date now = new Date();
		Calendar cal = Calendar.getInstance();

		cal.setTime(now);

		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);

		// 오늘 날짜가 2월일 경우
		if (month == 2) {

			year += overdue_date / 365;
			month += (overdue_date % 365) / 28;
			day += (overdue_date % 365) % 28;

			// 오늘 날짜가 1, 3, 5, 7, 8, 10, 12 월일 경우
		} else if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {

			year += overdue_date / 365;
			month += (overdue_date % 365) / 31;
			day += (overdue_date % 365) % 31;

			// 오늘 날짜가 4, 6, 9, 11월 일경우
		} else {

			year += overdue_date / 365;
			month += (overdue_date % 365) / 30;
			day += (overdue_date % 365) % 30;

		}

		// 대출 정지 만기일
		String date = year + "-" + month + "-" + day;

		return date;
	}

}
