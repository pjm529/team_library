package com.library.service.mylib;

import java.util.List;

import com.library.model.mylib.SeminarRoomDTO;

public interface SeminarRoomService {
	
	/* 세미나실 전체 예약 현황 리스트 */
	public List<SeminarRoomDTO> room_list_all();
	/* 세미나실 예약 정보 */
	public SeminarRoomDTO smRoom_info(String user_id);
	
	/* 룸 예약 */
	public int sm_Room_booking(SeminarRoomDTO dto);
	
	/* 룸 예약 취소 */
	public void smRoom_delete(String user_id);

}
