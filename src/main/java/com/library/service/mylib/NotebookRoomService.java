package com.library.service.mylib;

import java.util.List;

import com.library.model.mylib.NoteBookRoomDTO;

public interface NotebookRoomService {

	/* 좌석 정보 출력(전체 | 로그인한 기준) */
	/* 전체 좌석 조회 */
	public List<NoteBookRoomDTO> nbRoom_list_all();
	/* 예약 좌석 정보 */
	public NoteBookRoomDTO nbRoom_info(String user_id);
	
	
	/* 예약 | 좌석 이동 | 퇴실 | 좌석 시간 연장 */
	/* 좌석 예약 */
	public void nbRoom_booking(NoteBookRoomDTO dto);
	/* 좌석 상태 체크 */
	public int nb_seat_check(String seat_no);
	
	/* 좌석 반납 */
	public void nbRoom_delete(String user_id);
	
	
	
	
	/* Notebook Room 좌석 setting */
	public void insert(int seat_no);








	
	
}
