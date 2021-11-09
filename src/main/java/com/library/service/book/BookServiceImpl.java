package com.library.service.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.BookMapper;
import com.library.model.BookDTO;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookMapper mapper;

	@Override
	public void insert(BookDTO dto) {

		mapper.insert(dto);
		
	}

	@Override
	public void update(BookDTO dto) {
		
		mapper.update(dto);
		
	}

	@Override
	public int count(String isbn) {
		
		return mapper.count(isbn);
		
	}

	@Override
	public List<BookDTO> book_rank() {
		return mapper.book_rank();
	}
}
