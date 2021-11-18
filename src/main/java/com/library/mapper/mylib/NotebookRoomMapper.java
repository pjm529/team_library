package com.library.mapper.mylib;

import java.util.List;

import com.library.model.mylib.NoteBookRoomDTO;

public interface NotebookRoomMapper {

	public List<NoteBookRoomDTO> seats_list_all();
	public NoteBookRoomDTO reservation_info(String user_id);
	
	/* 좌석 예약 */
	public void nb_seat_booking(NoteBookRoomDTO dto);
	public void updateStatusOccupied(NoteBookRoomDTO dto);
	
	
	/* 좌석 반납&퇴실 */
	public void nb_seat_return(String seat_no);
	public void updateStatusVacant(String seat_no);

}
