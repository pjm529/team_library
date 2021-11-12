package com.library.service.mylib;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.library.model.mylib.ReadingRoom2DTO;

public interface ReadingRoom2Service {
	
	public List<ReadingRoom2DTO> list_all();

	public void bookingSeat(@RequestParam("seat_no")String seat_no);

	public void updateStatusOccupied(@RequestParam("seat_no")String seat_no);

	

	

//	public ArticleDTO userInfo(Long uno);
//
//	public void userDelete(Long uno);//삭제는 결과값 받을게 없어서 void
//
//	public void userInsert(ArticleDTO dto);
//
//	public void userUpdate(ArticleDTO dto);
	
	//서비스단에서 impl로 넘긴다.
			
}
