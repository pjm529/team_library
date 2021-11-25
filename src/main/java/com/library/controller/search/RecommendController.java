package com.library.controller.search;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.model.search.BookDTO;
import com.library.model.search.DateDTO;
import com.library.page.Criteria;
import com.library.page.ViewPage;
import com.library.service.search.AladinApi;
import com.library.service.search.BookService;
import com.library.service.search.RecommendService;

@Controller
@RequestMapping("/search")
public class RecommendController {

	@Autowired
	private AladinApi api;

	@Autowired
	private RecommendService recommendService;
	
	@Autowired
	private BookService bookService;

	// 검색 도서 출력
	@GetMapping("/recommend-book")
	public String recommend_book(Model model, Criteria cri, DateDTO date) {

		System.out.println("recommend_book 진입");

		if (date.getYear() == null) {
			date.setYear(date("year"));
		}

		if (date.getMonth() == null) {
			date.setMonth(date("month"));
		}

		// BookDTO 리스트 선언
		List<BookDTO> list = recommendService.recommend_list(cri, date);

		int total = recommendService.get_total(date);

		model.addAttribute("list", list);

		ViewPage vp = new ViewPage(cri, total);
		model.addAttribute("pageMaker", vp);

		model.addAttribute("year", date.getYear());
		model.addAttribute("month", date.getMonth());

		return "/search/sub3/recommend_book";
	}

	// 도서 상세페이지
	@GetMapping("/recommend-book-detail")
	public String recommned_book_detail(Model model, Criteria cri, @RequestParam String book_isbn,
			String year, String month) {

		// isbn이 null이 아닐 때
		if (book_isbn != null && book_isbn != "") {
			try {

				BookDTO book = api.search_detail(book_isbn);

				if (book.getBook_title() != null) {

					System.out.println("선택 책 제목 : " + book.getBook_title());
					model.addAttribute("book", book);

					// 대출 중인 도서의 수를 가져옴
					int count = bookService.count(book_isbn);
					count = 2 - count;
					model.addAttribute("count", count);

				} else {

					System.out.println("잘못된 값 입력");
					return "redirect:/search/book";

				}

			} catch (ParseException e) {
				e.printStackTrace();
			}

		} else {

			System.out.println("빈 검색어 입력");
			return "redirect:/search/book";

		}
		model.addAttribute("cri", cri);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		return "/search/sub3/recommend_book_detail";
	}

	public String date(String type) {
		Date now = new Date();
		Calendar cal = Calendar.getInstance();

		cal.setTime(now);

		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;

		if (type.equals("year")) {
			return Integer.toString(year);
		} else {
			return Integer.toString(month);
		}

	}
}
