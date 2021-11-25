package com.library.service.mylib;

import java.util.List;

import com.library.model.mylib.NoteBookRoomDTO;

public interface NotebookRoomService {

	public List<NoteBookRoomDTO> seats_list_all();
	public NoteBookRoomDTO reservation_info(String user_id);
	
	/* 좌석 예약 */
	public void nb_seat_booking(NoteBookRoomDTO dto);
	public void updateStatusOccupied(NoteBookRoomDTO dto);
	
	/* 좌석 반납&퇴실 */
	public void nb_seat_return(NoteBookRoomDTO dto);
	public void updateStatusVacant(NoteBookRoomDTO dto);
	
	/* 좌석 연장 */
	public void nb_seat_extend(NoteBookRoomDTO dto);
	
	/* 좌석 자동 반납 */
	public void updateNotebook_Room_RentalTable();
	public void updateNotebook_RoomTable();

	
}
