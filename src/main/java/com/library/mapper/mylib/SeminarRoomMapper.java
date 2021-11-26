package com.library.mapper.mylib;

import com.library.model.mylib.SeminarRoomDTO;

public interface SeminarRoomMapper {
	
	
	/* 룸 예약 */
	public int sm_Room_booking(SeminarRoomDTO dto);
	public void updateStatusOccupied(SeminarRoomDTO dto);

}
