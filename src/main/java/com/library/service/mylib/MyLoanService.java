package com.library.service.mylib;

import java.util.List;

import com.library.model.search.BookDTO;
import com.library.page.Criteria;

public interface MyLoanService {

	// 대출 중 이력 조회
	public List<BookDTO> loan_list_paging(String user_id);

	// 대출 수 출력
	public int get_total(String user_id);
	
}
