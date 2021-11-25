package com.library.service.mylib;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.mylib.MyLoanMapper;
import com.library.model.search.BookDTO;
import com.library.page.Criteria;

@Service
public class MyLoanServiceImpl implements MyLoanService {

	@Autowired
	private MyLoanMapper myLoanMapper;

	// 대출 중 이력 조회
	@Override
	public List<BookDTO> loan_list_paging(String user_id) {
		return myLoanMapper.loan_list_paging(user_id);
	}

	// 대출 수 출력
	@Override
	public int get_total(String user_id) {
		return myLoanMapper.get_total(user_id);
	}


}
