package com.library.service.mylib;

import com.library.model.mylib.SeminarRoomDTO;

public interface SeminarRoomService {
	
	/* 룸 예약 */
	public int sm_Room_booking(SeminarRoomDTO dto);
	public void updateStatusOccupied(SeminarRoomDTO dto);

}
