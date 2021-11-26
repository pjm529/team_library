package com.library.service.mylib;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.mylib.HopeMapper;
import com.library.model.search.BookDTO;

@Service
public class HopeServiceImpl implements HopeService {

	@Autowired
	private HopeMapper hopeMapper;

	// 희망 도서 신청
	@Override
	public void insert_hope(BookDTO book) {
		hopeMapper.insert_hope(book);
	}

}
