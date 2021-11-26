package com.library.model.mylib;

import java.sql.Timestamp;
import lombok.Data;

@Data
public class SeminarRoomDTO {
	private int room_no;
	private String room_name;
	private String time_zone;
	private int room_status;
	private String user_id;
	private String sm_time;
	private String sm_date;
	private Timestamp reg_date;
}
