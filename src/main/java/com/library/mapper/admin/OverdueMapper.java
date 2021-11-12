package com.library.mapper.admin;

import java.util.List;

import com.library.model.member.MemberDTO;
import com.library.model.search.BookDTO;
import com.library.page.Criteria;

public interface OverdueMapper {

	// 대출 중 이력 조회
	public List<BookDTO> overdue_list_paging(Criteria cri);

	// 대출 수 출력
	public int get_total(Criteria cri);
	
	// 도서 반납
	public void return_book(BookDTO book);
}
