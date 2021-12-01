package com.library.service.mylib;

public interface ReservationRoomService {
	
	/* 잔여 좌석 | 사용 좌석 */
	/* 잔여 좌석 */
	public int nbRoom_usingSeat();
	/* 사용 좌석 */
	public int nbRoom_usedSeat();

}
