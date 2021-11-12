package com.library.service.board;

import java.util.List;

import com.library.model.board.EnquiryBoardDTO;
import com.library.page.Criteria;

public interface EnquiryBoardService {
	
	/* ��� / ���� / ��ȸ�� */
	/* �Խ��� ��� */
	public List<EnquiryBoardDTO> enquiryBoardAll();
	
	/* �Խù� ��ȸ (����) */
	public EnquiryBoardDTO enquiryContent(Long enquiry_no);
	
	/* �Խù� ��ȸ�� */
	public void updateView(Long enquiry_no);
	
	
	
	/* ��� / ���� / ���� */
	/* �Խù� ��� */
	public void enquiryBoardInsert(EnquiryBoardDTO dto);
	
	/* �Խù� ���� */
	public void enquiryBoardUpdate(EnquiryBoardDTO dto);
	
	/* �Խù� ���� */
	public void enquiryBoardDelete(Long enquiry_no);
	
	
	
	/* �� �Խù� / ����¡ */
	/* �Խù� �� ���� */
	public int getTotal(Criteria cri);
	
	/* �Խù� ����¡ */
	public List<EnquiryBoardDTO> getListPage(Criteria cri);

}
