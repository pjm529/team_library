package com.library.service.admin;

import java.util.List;

import com.library.model.member.MemberDTO;
import com.library.model.search.BookDTO;
import com.library.page.Criteria;

public interface LoanService {

	// 대출 중 이력 조회
	public List<BookDTO> loan_list_paging(Criteria cri);

	
	public int get_total(Criteria cri);

}
