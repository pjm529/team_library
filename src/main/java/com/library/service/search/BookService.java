package com.library.service.search;

import java.util.List;

import com.library.model.search.BookDTO;

public interface BookService {

	// 도서 대출
	public void insert(BookDTO dto);

	// 도서 수 카운트
	public int count(String isbn);

	// 대출 베스트 출력
	public List<BookDTO> book_rank();

	// 대출자 상태 체크
	public int statusCheck(String user_id);

	// 대출자 대출 수 증가
	public void increase_count(String user_id);
}
