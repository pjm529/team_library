package com.library.model.board;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data //data 어노테이션은 get,set,tostring 메서드 모두 가져올 수 있음
// 클래스 만들어 놓은 것은 설명서-> 
public class ArticleDTO {
	
	private Long article_no;
	private String article_title;
	private String article_content;
	private String writer_id;
	private String writer_name;
	private Timestamp article_reg_date;
	private int article_views;
		
}
