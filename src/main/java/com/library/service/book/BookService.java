package com.library.service.book;

import java.util.List;

import com.library.model.BookDTO;

public interface BookService {

	public void insert(BookDTO dto);
	
	public void update(BookDTO dto);
	
	public int count(String isbn);
	 
	public List<BookDTO> book_rank();
}
