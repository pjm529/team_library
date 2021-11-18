package com.library.mapper.mylib;

import java.util.List;

import com.library.model.mylib.ReadingRoom2DTO;

public interface ReadingRoom2Mapper {

	public ReadingRoom2DTO readingRoom2(String seat_no);

	public List<ReadingRoom2DTO> list_all();

	public void room2_booking(ReadingRoom2DTO dto);

	public void updateStatusOccupied(ReadingRoom2DTO dto);

	public ReadingRoom2DTO room2_info(String user_id);

	public void room2_delete(String seat_no);

	public void updateStatusVacant(String seat_no);
	
	public void room2_extend(String seat_no);

	public void moveSeat2(ReadingRoom2DTO dto);

	public void room2_delete(ReadingRoom2DTO dto);

	public void updateStatusVacant(ReadingRoom2DTO dto);
	
	public void updateReading_Room2Table();
	
	public void updateReading_Room2_RentalTable();




//	public ArticleDTO userInfo(Long uno);

//	public void userDelete(Long uno);
//
//	public void userInsert(ArticleDTO dto);
//
//	public void userUpdate(ArticleDTO dto);
	
}
