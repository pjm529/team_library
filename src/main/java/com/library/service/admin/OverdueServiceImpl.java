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
	public List<BookDTO> overdue_list() {
		return overdueMapper.overdue_list();
	}

	@Override
	public int get_total() {
		return overdueMapper.get_total();
	}

}
