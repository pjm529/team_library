package com.library.service.mylib;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public void room2_booking(ReadingRoom2DTO dto) {
		mapper.room2_booking(dto);
		
	}

	@Override
	public void updateStatusOccupied(ReadingRoom2DTO dto) {
		mapper.updateStatusOccupied(dto);
		
	}

	@Override
	public ReadingRoom2DTO room2_info(String user_id) {
		return mapper.room2_info(user_id);
		
	}

	@Override
	public void room2_delete(String seat_no) {
		mapper.room2_delete(seat_no);
		
	}

	@Override
	public void updateStatusVacant(String seat_no) {
		mapper.updateStatusVacant(seat_no);
		
	}

	@Override
	public void room2_extend(String seat_no) {
		mapper.room2_extend(seat_no);
		
	}


	@Override
	public void moveSeat2(ReadingRoom2DTO dto) {
		mapper.moveSeat2(dto);
		
	}

	@Override
	public void room2_delete(ReadingRoom2DTO dto) {
		mapper.room2_delete(dto);
		
	}

	@Override
	public void updateStatusVacant(ReadingRoom2DTO dto) {
		mapper.updateStatusVacant(dto);
		
	}

	@Override
	public void updateReading_Room2Table() {
		mapper.updateReading_Room2Table();
		
	}

	@Override
	public void updateReading_Room2_RentalTable() {
		mapper.updateReading_Room2_RentalTable();
		
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
