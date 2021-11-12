package com.library.service.mylib;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.mapper.mylib.ReadingRoom2Mapper;
import com.library.model.mylib.ReadingRoom2DTO;

@Service
public class ReadingRoom2ServiceImpl implements ReadingRoom2Service {

	@Autowired
	private ReadingRoom2Mapper mapper;

	@Override
	public List<ReadingRoom2DTO> list_all() {
		
		return mapper.list_all();
	}

	@Override
	public void bookingSeat(@RequestParam("seat_no")String seat_no) {
		mapper.bookingSeat(seat_no);
		
	}

	@Override
	public void updateStatusOccupied(@RequestParam("seat_no")String seat_no) {
		mapper.updateStatusOccupied(seat_no);
		
	}


	


//	@Override
//	public ArticleDTO userInfo(Long uno) {
//		
//		return mapper.userInfo(uno);
//	}
//
//	@Override
//	public void userDelete(Long uno) {
//		mapper.userDelete(uno);
//		
//	}
//
//	@Override
//	public void userInsert(ArticleDTO dto) {
//		mapper.userInsert(dto);
//		
//	}
//
//	@Override
//	public void userUpdate(ArticleDTO dto) {
//		mapper.userUpdate(dto);
//		
//	}

//	@Override
//	public void update(UserDTO dto) {
//		mapper.update(dto);
//		
//	}
	
	

}
