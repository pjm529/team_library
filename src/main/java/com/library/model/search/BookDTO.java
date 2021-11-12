package com.library.model.search;

import lombok.Data;
 
@Data
public class BookDTO {
	int count;
	int total_count;
	String user_id;
	String book_title;
	String book_author;
	String book_isbn;
	String book_cover;
	String book_pubDate;
	String book_publisher;
	int priceStandard;
	String description;
	int total;
	
}
