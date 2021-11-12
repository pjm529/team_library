package com.library.service.mylib;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.mylib.ReadingRoomMapper;
import com.library.model.mylib.ReadingRoomDTO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReadingRoomServiceImpl implements ReadingRoomService {

	@Autowired
	private ReadingRoomMapper mapper;
	
	@Override
	public List<ReadingRoomDTO> getSeatsList() {
		return mapper.getSeatsList();
	}

	@Override
	public void bookingSeat(ReadingRoomDTO dto) {
		mapper.bookingSeat(dto);		
	}

	@Override
	public void updateStatusToOccupied(ReadingRoomDTO dto) {
		mapper.updateStatusToOccupied(dto);
	}

	@Override
	public void returnSeat(ReadingRoomDTO dto) {
		mapper.returnSeat(dto);
	}

	@Override
	public void updateStatusToVacant(ReadingRoomDTO dto) {
		mapper.updateStatusToVacant(dto);
	}
	
	@Override
	public void extendSeat(ReadingRoomDTO dto) {
		mapper.extendSeat(dto);		
	}

	@Override
	public ReadingRoomDTO mySeatInfo(String user_id) {
		return mapper.mySeatInfo(user_id);
	}

}
