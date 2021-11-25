package com.library.service.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.search.RecommendMapper;
import com.library.model.search.BookDTO;
import com.library.model.search.DateDTO;
import com.library.page.Criteria;

@Service
public class RecommendServiceImpl implements RecommendService {

	@Autowired
	private RecommendMapper recommendMapper;

	@Override
	public List<BookDTO> recommend_list(Criteria cri, DateDTO date) {
		return recommendMapper.recommend_list(cri, date);
	}

	@Override
	public int get_total(DateDTO date) {
		return recommendMapper.get_total(date);
	}
}
