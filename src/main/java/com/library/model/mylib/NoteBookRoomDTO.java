package com.library.model.mylib;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoteBookRoomDTO {

	private int seat_no;
	private int seat_status;
	private String user_id;
	private Timestamp reg_time;
	private Timestamp return_time;
	private long diff_time;
}
