package com.library.mapper.mylib;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.library.model.mylib.ReadingRoomDTO;
import com.library.page.Criteria;

public interface ReadingRoomMapper {

//	public List<ReadingRoomDTO> getSeatsList(@Param("skip")int skip, @Param("amount")int amount);
	public List<ReadingRoomDTO> getSeatsList();
	public void bookingSeat(ReadingRoomDTO dto);
	public void updateStatusToOccupied(ReadingRoomDTO dto);
	public void returnSeat(ReadingRoomDTO dto);
	public void updateStatusToVacant(ReadingRoomDTO dto);
	public void extendSeat(ReadingRoomDTO dto);
	public ReadingRoomDTO mySeatInfo(String user_id);
	public void updateReading_Room1_RentalTable();
	public void updateReading_Room1Table();

	
	
}
