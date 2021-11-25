package com.library.mapper.mylib;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.library.model.search.BookDTO;
import com.library.page.Criteria;

public interface MyLoanMapper {

	// 대출 중 이력 조회
	public List<BookDTO> loan_list_paging(String user_id);

	// 대출 수 출력
	public int get_total(String user_id);
}
