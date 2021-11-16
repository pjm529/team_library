package com.library.service.admin;

import java.util.List;

import com.library.model.member.MemberDTO;
import com.library.model.search.BookDTO;
import com.library.page.Criteria;

public interface LoanService {

	// 대출 중 이력 조회
	public List<BookDTO> loan_list_paging(Criteria cri);

	// 대출 수 출력
	public int get_total(Criteria cri);
	
	// 도서 반납
	public int return_book(BookDTO book);
	
	// 회원 대출 중 도서 수 감소
	public void user_book_count(BookDTO book);

}
