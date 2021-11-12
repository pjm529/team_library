package com.library.mapper.mylib;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.library.model.mylib.ReadingRoom2DTO;

public interface ReadingRoom2Mapper {

	public ReadingRoom2DTO readingRoom2(String seat_no);

	public List<ReadingRoom2DTO> list_all();

	public void bookingSeat(@RequestParam("seat_no")String seat_no);

	public void updateStatusOccupied(@RequestParam("seat_no")String seat_no);
		
	
	
	

//	public ArticleDTO userInfo(Long uno);

//	public void userDelete(Long uno);
//
//	public void userInsert(ArticleDTO dto);
//
//	public void userUpdate(ArticleDTO dto);
	
}
