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

	// 대출 중 이력 조회
	@Override
	public List<BookDTO> loan_list_paging(Criteria cri) {
		return loanMapper.loan_list_paging(cri);
	}
	
	// 대출 수 출력
	@Override
	public int get_total(Criteria cri) {
		return loanMapper.get_total(cri);
	}

	// 도서 반납
	@Override
	public int return_book(BookDTO book) {
		return loanMapper.return_book(book);
	}
	
	// 회원 대출 중 도서 수 감소
	@Override
	public void user_book_count(BookDTO book) {
		loanMapper.user_book_count(book);
		
	}

}
