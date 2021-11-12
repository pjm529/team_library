package com.library.mapper.board;

import java.util.List;

import com.library.model.board.EnquiryBoardDTO;
import com.library.page.Criteria;

public interface EnquiryBoardMapper {
	
	/* 게시판 / 본문 / 조회 수 */
	public EnquiryBoardDTO enquiryContent(Long enquiry_no);
	public void updateView(Long enquiry_no);
	
	
	/* 등록 / 수정 / 삭제 */
	/* 등록 */
	public void enquiryBoardInsert(EnquiryBoardDTO dto);
	/* 수정 */
	public void enquiryBoardUpdate(EnquiryBoardDTO dto);
	/* 삭제 */
	public void enquiryBoardDelete(Long enquiry_no);
	
	
	/* 총 게시물 / 페이징 / 게시물 정렬 */
	public int getTotal(Criteria cri);
	public List<EnquiryBoardDTO> getListPage(Criteria cri);
	public void reset();

}

