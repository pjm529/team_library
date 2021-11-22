package com.library.service.mylib;

import java.util.List;

import com.library.model.mylib.ReadingRoomDTO;

public interface ReadingRoomService {
	
	public List<ReadingRoomDTO> getSeatsList(int skip, int amount);
	public void bookingSeat(ReadingRoomDTO dto);
	public void updateStatusToOccupied(ReadingRoomDTO dto);
	public void returnSeat(ReadingRoomDTO dto);
	public void updateStatusToVacant(ReadingRoomDTO dto);
	public void extendSeat(ReadingRoomDTO dto);
	public ReadingRoomDTO mySeatInfo(String user_id);
	public void updateReading_Room1_RentalTable();
	public void updateReading_Room1Table();
	
}
