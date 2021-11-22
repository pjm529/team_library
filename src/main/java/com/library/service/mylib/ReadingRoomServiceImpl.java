package com.library.service.mylib;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.mylib.ReadingRoomMapper;
import com.library.model.mylib.ReadingRoomDTO;
import com.library.page.Criteria;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReadingRoomServiceImpl implements ReadingRoomService {

	@Autowired
	private ReadingRoomMapper mapper;

	@Override
	public void updateReading_Room1_RentalTable() {
		mapper.updateReading_Room1_RentalTable();
	}
	
	@Override
	public void updateReading_Room1Table() {
		mapper.updateReading_Room1Table();
	}
	
	@Override
	public List<ReadingRoomDTO> getSeatsList(int skip, int amount) {
		return mapper.getSeatsList(skip, amount);
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
