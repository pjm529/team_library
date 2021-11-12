package com.library.service.board;	
import java.util.List;

import com.library.model.board.EnquiryBoardDTO;
import com.library.page.Criteria;

public interface EnquiryBoardService {
	
	/* 게시판 / 게시물 본문 / 조회수 */
	/* 게시물 본문 */
	public EnquiryBoardDTO enquiryContent(Long enquiry_no);
	/* 조회 수 */
	public void updateView(Long enquiry_no);
	
	
	/* 등록 / 수정 / 삭제 */
	public void enquiryBoardInsert(EnquiryBoardDTO dto);
	public void enquiryBoardUpdate(EnquiryBoardDTO dto);
	public void enquiryBoardDelete(Long enquiry_no);
	
	
	/* 총 게시물 / 게시물 페이징 */
	public int getTotal(Criteria cri);
	public List<EnquiryBoardDTO> getListPage(Criteria cri);
	
	/* 게시물 정렬 */
	public void reset();

}
