package com.library.service.mylib;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.library.model.mylib.ReadingRoom2DTO;

public interface ReadingRoom2Service {
	
	public List<ReadingRoom2DTO> list_all();

	public void room2_booking(ReadingRoom2DTO dto);

	public void updateStatusOccupied(ReadingRoom2DTO dto);

	public ReadingRoom2DTO room2_info(String user_id);

	public void room2_delete(String seat_no);

	public void updateStatusVacant(String seat_no);

	public void room2_extend(String user_id);

	public void moveSeat2(ReadingRoom2DTO dto);

	public void room2_delete(ReadingRoom2DTO dto);

	public void updateStatusVacant(ReadingRoom2DTO dto);
	
	public void updateReading_Room2Table();
	
	public void updateReading_Room2_RentalTable();
	



	


	



	

	

//	public ArticleDTO userInfo(Long uno);
//
//	public void userDelete(Long uno);//삭제는 결과값 받을게 없어서 void
//
//	public void userInsert(ArticleDTO dto);
//
//	public void userUpdate(ArticleDTO dto);
	
	//서비스단에서 impl로 넘긴다.
			
}
