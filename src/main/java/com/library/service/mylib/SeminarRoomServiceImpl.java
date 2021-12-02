package com.library.service.mylib;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.mylib.SeminarRoomMapper;
import com.library.model.mylib.SeminarRoomDTO;

@Service
public class SeminarRoomServiceImpl implements SeminarRoomService {

	@Autowired
	private SeminarRoomMapper sMapper;
	
	
	/* 세미나실 전체 예약 현황 리스트 */
	@Override
	public List<SeminarRoomDTO> room_list_all() {
		return sMapper.room_list_all();
	}
	/* 세미나실 예약 정보 */
	@Override
	public SeminarRoomDTO smRoom_info(String user_id) {
		return sMapper.smRoom_info(user_id);
	}
	
	
	/* 룸 예약 */
	@Override
	public int sm_Room_booking(SeminarRoomDTO dto) {
		return sMapper.sm_Room_booking(dto);
	}
	
	
	@Override
	public void smRoom_delete(String user_id) {
		sMapper.smRoom_delete(user_id);
		
	}



	
	
	
}
