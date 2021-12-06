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
	public List<NoteBookRoomDTO> nbRoom_list_all() {
		return nbMapper.nbRoom_list_all();
	}
	/* 예약 좌석 정보 */
	@Override
	public NoteBookRoomDTO nbRoom_info(String user_id) {
		return nbMapper.nbRoom_info(user_id);
	}
	
	
	
	/* 예약 | 좌석 이동 | 반납 | 좌석 시간 연장 */
	/* 좌석 예약 */
	@Override
	public void nbRoom_booking(NoteBookRoomDTO dto) {
		nbMapper.nbRoom_booking(dto);
	}
	/* 좌석 상태 체크 */
	@Override
	public int nb_seat_check(String seat_no) {
		return nbMapper.nb_seat_check(seat_no);
	}
	
	/* 좌석 이동 */
	@Override
	public void nbRoom_moveSeat(NoteBookRoomDTO dto) {
		nbMapper.nbRoom_moveSeat(dto);
	}
	
	/* 좌석 반납 */
	@Override
	public void nbRoom_delete(String user_id) {
		nbMapper.nbRoom_delete(user_id);
	}
	
	/* 좌석 시간 연장 */
	@Override
	public void nbRoom_extend(String user_id) {
		nbMapper.nbRoom_extend(user_id);
		
	}
	
	
	
	
	
	
	
	@Override
	public void insert(int seat_no) {
		nbMapper.insert(seat_no);
		
	}
	
	
	

	


	




}
