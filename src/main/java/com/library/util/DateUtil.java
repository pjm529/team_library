package com.library.util;

import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	
	public static String date(String type) {
		Date now = new Date();
		Calendar cal = Calendar.getInstance();

		cal.setTime(now);

		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;

		if (type.equals("year")) {
			return Integer.toString(year);
		} else {
			return Integer.toString(month);
		}
	}
}
