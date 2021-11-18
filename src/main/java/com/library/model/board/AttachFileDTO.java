package com.library.model.board;

import lombok.Data;

@Data
public class AttachFileDTO {

	private String file_name;
	private String upload_path;
	private String uuid;
	private boolean image;
	
}
