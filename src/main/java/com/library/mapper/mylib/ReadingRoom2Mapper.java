package com.library.mapper.mylib;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.library.model.mylib.ReadingRoomDTO;

public interface ReadingRoom2Mapper {

	// 열람실 출력
	public List<ReadingRoomDTO> list_all();

	// 열람실 예약
	public void room2_booking(ReadingRoomDTO dto);

	// 열람실 좌석 정보
	public ReadingRoomDTO room2_info(String user_id);

	// 열람실 퇴실
	public void room2_delete(String user_id);

	// 열람실 좌석 시간 연장
	public void room2_extend(String user_id);

	// 열람실 좌석 이동
	public void moveSeat2(ReadingRoomDTO dto);

	// 좌석 상태 체크
	public int seat2_check(String seat_no);

	/* 잔여 좌석 */
	public int rd2UsingSeat();

	/* 사용 좌석 */
	public int rd2UsedSeat();

	// 열람실 좌석 insert
	public void insert(int seat_no);

}
