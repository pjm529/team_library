package com.library.model.admin;

import lombok.Data;

@Data // Data = getter + setter + toString
public class BannerDTO {

	private String uuid;
	private String file_name;
	private String user_id;
	private String reg_date;
}
