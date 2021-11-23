package com.library.service.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.search.BookMapper;
import com.library.model.search.BookDTO;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookMapper mapper;

	// 도서 대출
	@Override
	public void insert(BookDTO dto) {
		mapper.insert(dto);
	}

	// 도서 수 카운트
	@Override
	public int count(String isbn) {
		return mapper.count(isbn);
	}

	// 대출 베스트 출력
	@Override
	public List<BookDTO> book_rank() {
		return mapper.book_rank();
	}
	
	// 대출자 상태 체크
	@Override
	public int statusCheck(String user_id) {
		return mapper.statusCheck(user_id);
	}

	// 대출자 대출 수 증가
	@Override
	public void increase_count(String user_id) {
		mapper.increase_count(user_id);
	}
}
