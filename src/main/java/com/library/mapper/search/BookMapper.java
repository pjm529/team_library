package com.library.mapper.search;

import java.util.List;

import com.library.model.search.BookDTO;
 
public interface BookMapper {

	public void insert(BookDTO dto);
	
	public void update(BookDTO dto);
	
	public int count(String isbn);
	
	public List<BookDTO> book_rank();
}
