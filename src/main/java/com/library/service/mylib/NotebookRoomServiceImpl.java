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

	@Override
	public NoteBookRoomDTO reservation_info(String user_id) {
		return nbMapper.reservation_info(user_id);
	}


	/* 좌석 예약 */
	@Override
	public void nb_seat_booking(NoteBookRoomDTO dto) {
		nbMapper.nb_seat_booking(dto);
	}

	@Override
	public void updateStatusOccupied(NoteBookRoomDTO dto) {
		nbMapper.updateStatusOccupied(dto);
	}


	
	/* 좌석 반납&퇴실 */
	@Override
	public void nb_seat_return(NoteBookRoomDTO dto) {
		nbMapper.nb_seat_return(dto);
		
	}

	@Override
	public void updateStatusVacant(NoteBookRoomDTO dto) {
		nbMapper.updateStatusVacant(dto);
		
	}

	
	/* 좌석 연장 */
	@Override
	public void nb_seat_extend(NoteBookRoomDTO dto) {
		nbMapper.nb_seat_extend(dto);
	}

	
	/* 좌석 자동 반납 */
	@Override
	public void updateNotebook_Room_RentalTable() {
		nbMapper.updateNotebook_Room_RentalTable();
		
	}

	@Override
	public void updateNotebook_RoomTable() {
		nbMapper.updateNotebook_RoomTable();
		
	}



}
