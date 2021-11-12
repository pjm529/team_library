package com.library.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.admin.AdminMapper;
import com.library.mapper.admin.LoanMapper;
import com.library.model.member.MemberDTO;
import com.library.model.search.BookDTO;
import com.library.page.Criteria;

@Service
public class LoanServiceImpl implements LoanService {

	@Autowired
	private LoanMapper loanMapper;

	@Override
	public List<BookDTO> loan_list_paging(Criteria cri) {
		return loanMapper.loan_list_paging(cri);
	}

	@Override
	public int get_total(Criteria cri) {
		return loanMapper.get_total(cri);
	}

}
