package com.library.roomTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.library.service.mylib.ReadingRoomService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReadingRoomTest {
	
	@Autowired
	private ReadingRoomService service;
	
	@Test
	public void roomInsert() {
		
		for(int i = 1; i < 125; i++) {
			service.insert(i);
		}
	}

}
