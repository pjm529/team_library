package com.library.service.mylib;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.mylib.ReadingRoom2Mapper;
import com.library.model.mylib.ReadingRoomDTO;

@Service
public class ReadingRoom2ServiceImpl implements ReadingRoom2Service {

	@Autowired
	private ReadingRoom2Mapper mapper;

	// 2열람실 출력
	@Override
	public List<ReadingRoomDTO> list_all() {

		return mapper.list_all();
	}

	
	// 열람실 예약
	@Override
	public void room2_booking(ReadingRoomDTO dto) {
		mapper.room2_booking(dto);

	}

	
	// 예약 좌석 정보
	@Override
	public ReadingRoomDTO room2_info(String user_id) {
		return mapper.room2_info(user_id);

	}

	// 열람실 퇴실
	@Override
	public void room2_delete(String user_id) {
		mapper.room2_delete(user_id);

	}

	// 열람실 좌석 시간 연장
	@Override
	public void room2_extend(String user_id) {
		mapper.room2_extend(user_id);

	}

	// 열람실 좌석 이동
	@Override
	public void moveSeat2(ReadingRoomDTO dto) {
		mapper.moveSeat2(dto);

	}
	
	// 열람실 좌석 상태 체크
	@Override
	public int seat2_check(String seat_no) {
		return mapper.seat2_check(seat_no);
	}

	// 열람실 좌석 insert
	@Override
	public void insert(int seat_no) {
		mapper.insert(seat_no);
	}

}
