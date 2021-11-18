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
	
	
	
	@Override
	public List<NoteBookRoomDTO> seats_list_all() {
		return nbMapper.seats_list_all();
	}

}
