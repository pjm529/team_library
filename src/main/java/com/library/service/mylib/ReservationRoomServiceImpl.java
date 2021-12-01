package com.library.service.mylib;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.mylib.NotebookRoomMapper;
import com.library.mapper.mylib.ReadingRoom2Mapper;
import com.library.mapper.mylib.ReadingRoomMapper;

@Service
public class ReservationRoomServiceImpl implements ReservationRoomService {

	@Autowired
	private ReadingRoomMapper rdMapper;
	@Autowired
	private ReadingRoom2Mapper rd2Mapper;
	@Autowired
	private NotebookRoomMapper nbMapper;
	
	@Override
	public int nbUsingSeat() {
		return nbMapper.nbUsingSeat();
	}

	@Override
	public int nbUsedSeat() {
		return nbMapper.nbUsedSeat();
	}

}