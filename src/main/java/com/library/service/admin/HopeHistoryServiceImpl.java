package com.library.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.admin.HopeHistoryMapper;
import com.library.model.mylib.HopeDTO;
import com.library.page.Criteria;

@Service
public class HopeHistoryServiceImpl implements HopeHistoryService {

	@Autowired
	private HopeHistoryMapper hopeHistoryMapper;


	// 희망 도서 신청내역
	@Override
	public List<HopeDTO> hope_list(Criteria cri) {
		return hopeHistoryMapper.hope_list(cri);
	}

	// 희망 도서 신청 수
	@Override
	public int get_total() {
		return hopeHistoryMapper.get_total();
	}

	// 희망 도서 정보 조회
	@Override
	public HopeDTO hope_info(String hope_no) {
		return hopeHistoryMapper.hope_info(hope_no);
	}

}
