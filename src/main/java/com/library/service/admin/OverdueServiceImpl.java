package com.library.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.admin.OverdueMapper;
import com.library.model.search.BookDTO;
import com.library.page.Criteria;

@Service
public class OverdueServiceImpl implements OverdueService {

	@Autowired
	private OverdueMapper overdueMapper;

	@Override
	public List<BookDTO> overdue_list_paging(Criteria cri) {
		return overdueMapper.overdue_list_paging(cri);
	}

	@Override
	public int get_total(Criteria cri) {
		return overdueMapper.get_total(cri);
	}

	// 도서 반납
	@Override
	public void return_book(BookDTO book) {
		overdueMapper.return_book(book);
	}

	@Override
	public String search_email(String user_id) {
		return overdueMapper.search_email(user_id);
	}

}
