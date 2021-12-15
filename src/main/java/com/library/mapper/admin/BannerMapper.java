package com.library.mapper.admin;

import java.util.List;

import com.library.model.admin.BannerDTO;

public interface BannerMapper {

	// 배너 출력
	public List<BannerDTO> banner_list();

	// 배너 삭제
	public void banner_del(BannerDTO banner);
}
