package com.library.model.mylib;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoteBookRoomDTO {

	private int seat_no;
	private String user_id;
	private Timestamp checkin_time;
	private Timestamp checkout_time;
	private long diff_time;
}
