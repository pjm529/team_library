package com.library.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.board.CalendarMapper;
import com.library.model.board.CalendarDTO;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	public CalendarMapper calMapper;

	@Override
	public List<CalendarDTO> list_all() {
		return calMapper.list_all();
	}
	

}
