package com.library.service.mylib;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.mylib.NotebookRoomMapper;
import com.library.model.mylib.NoteBookRoomDTO;

@Service
public class NotebookRoomServiceImpl implements NotebookRoomService {

	@Autowired
	private NotebookRoomMapper nbMapper;

	
	/* 전체 좌석 출력(Notebook Room) */
	@Override
	public List<NoteBookRoomDTO> nb_list_all() {
		return nbMapper.nb_list_all();
	}
	
	
	
	
	@Override
	public void insert(int seat_no) {
		nbMapper.insert(seat_no);
		
	}


	




}
