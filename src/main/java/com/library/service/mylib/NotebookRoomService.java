package com.library.service.mylib;

import java.util.List;

import com.library.model.mylib.NoteBookRoomDTO;

public interface NotebookRoomService {

	public List<NoteBookRoomDTO> seats_list_all();
	public NoteBookRoomDTO reservation_info(String user_id);
	
	/* 좌석 예약 */
	public void nb_seat_booking(NoteBookRoomDTO dto);
	public void updateStatusOccupied(NoteBookRoomDTO dto);
	
	
	
}
