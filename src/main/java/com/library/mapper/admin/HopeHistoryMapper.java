package com.library.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.library.model.mylib.HopeDTO;
import com.library.page.Criteria;

public interface HopeHistoryMapper {

	// 희망도서 신청내역
	public List<HopeDTO> hope_list(Criteria cri);

	// 희망도서 신청수
	public int get_total();
	
	// 희망 도서 정보 조회
		public HopeDTO hope_info(String hope_no);
}
