package com.library.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.admin.AdminListMapper;
import com.library.model.member.MemberDTO;
import com.library.page.Criteria;

@Service
public class AdminListServiceImpl implements AdminListService {


	@Autowired
	private AdminListMapper adminListMapper;
	
	@Override
	public int get_total(Criteria cri) {
		return adminListMapper.get_total(cri);
	}

	@Override
	public List<MemberDTO> list_paging(Criteria cri) {
		return adminListMapper.list_paging(cri);
	}

}
