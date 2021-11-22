package com.library.mapper.admin;

import java.util.List;

import com.library.model.member.MemberDTO;
import com.library.page.Criteria;

public interface AdminListMapper {

	// 관리자 총 인원 수 출력
	public int get_total(Criteria cri);

	// 관리자 수 페이징
	public List<MemberDTO> list_paging(Criteria cri);

}
