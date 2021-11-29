package com.library.service.mylib;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.library.model.mylib.ReadingRoomDTO;

public interface ReadingRoom2Service {

	// 열람실 출력
	public List<ReadingRoomDTO> list_all();

	// 열람실 예약
	public void room2_booking(ReadingRoomDTO dto);

	// 예약 좌석 정보
	public ReadingRoomDTO room2_info(String user_id);

	// 열람실 퇴실
	public void room2_delete(String user_id);

	// 열람실 좌석 시간 연장
	public void room2_extend(String user_id);

	// 열람실 좌석 이동
	public void moveSeat2(ReadingRoomDTO dto);

	// 좌석 상태 체크
	public int seat2_check(String seat_no);
	
	// 열람실 좌석 insert
	public void insert(int seat_no);

}
