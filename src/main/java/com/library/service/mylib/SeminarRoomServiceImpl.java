package com.library.service.mylib;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.mylib.SeminarRoomMapper;
import com.library.model.mylib.SeminarRoomDTO;

@Service
public class SeminarRoomServiceImpl implements SeminarRoomService {

	@Autowired
	private SeminarRoomMapper sMapper;
	
	
	/* 룸 예약 */
	@Override
	public int sm_Room_booking(SeminarRoomDTO dto) {
		return sMapper.sm_Room_booking(dto);
	}
	
	
	
}
