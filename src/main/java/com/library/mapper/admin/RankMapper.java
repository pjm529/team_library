package com.library.mapper.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.library.model.member.MemberDTO;
import com.library.model.search.DateDTO;
import com.library.page.Criteria;

public interface RankMapper {

	// 회원 대출 순위
	public List<MemberDTO> rank_list(DateDTO dto);

}
