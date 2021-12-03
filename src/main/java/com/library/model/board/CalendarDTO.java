package com.library.model.board;

import lombok.Data;

@Data
public class CalendarDTO {

	private int cal_no;
	private String groupId;
	private String title;
	private String user_id;
	private String start;
	private String end;
	private boolean allday;
	private String textColor;
	private String backgroundColor;
	private String borderColor;
	private String reg_date;
}
