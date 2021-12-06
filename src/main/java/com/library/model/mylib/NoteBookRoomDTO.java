package com.library.model.mylib;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoteBookRoomDTO {

	private int seat_no; // 좌석 번호
	private String user_id; // 예약자 id
	private Timestamp checkin_time; // 입실 시간
	private Timestamp checkout_time; // 퇴실 시간
	private long diff_time; // 잔여 시간
}
