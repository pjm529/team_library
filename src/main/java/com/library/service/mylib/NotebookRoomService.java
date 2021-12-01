package com.library.service.mylib;

import java.util.List;

import com.library.model.mylib.NoteBookRoomDTO;

public interface NotebookRoomService {

	/* 좌석 정보 출력(전체 | 로그인한 기준) */
	/* 전체 좌석 조회 */
	public List<NoteBookRoomDTO> nb_list_all();
	/* 예약 좌석 정보 */
	public NoteBookRoomDTO nbRoom_info(String user_id);
	
	
	
	
	
	
	/* Notebook Room 좌석 setting */
	public void insert(int seat_no);








	
	
}
