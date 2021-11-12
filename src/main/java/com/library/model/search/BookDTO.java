package com.library.model.search;

import lombok.Data;
 
@Data
public class BookDTO {
	private int count;
	private int total_count;
	private String user_id;
	private String book_title;
	private String book_author;
	private String book_isbn;
	private String book_cover;
	private String book_pubDate;
	private String book_publisher;
	private String loan_date;
	private String return_date;
	private String return_period;
	private int priceStandard;
	private String description;
	private int total;
	
}
