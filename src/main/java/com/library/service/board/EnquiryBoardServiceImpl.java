package com.library.service.board;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.board.EnquiryBoardMapper;
import com.library.model.board.EnquiryBoardDTO;
import com.library.page.Criteria;

@Service
public class EnquiryBoardServiceImpl implements EnquiryBoardService {

	@Autowired
	public EnquiryBoardMapper eMapper;
	
	
	@Override
	public void enquiryBoardInsert(EnquiryBoardDTO dto) {
		eMapper.enquiryBoardInsert(dto);
	}

	@Override
	public List<EnquiryBoardDTO> enquiryBoardAll() {
		return eMapper.enquiryBoardAll();
	}

	@Override
	public EnquiryBoardDTO enquiryContent(Long enquiry_no) {
		return eMapper.enquiryContent(enquiry_no);
	}

	@Override
	public void enquiryBoardDelete(Long enquiry_no) {
		eMapper.enquiryBoardDelete(enquiry_no);

	}

	@Override
	public void enquiryBoardUpdate(EnquiryBoardDTO dto) {
		eMapper.enquiryBoardUpdate(dto);

	}

	@Override
	public void updateView(Long enquiry_no) {
		eMapper.updateView(enquiry_no);
		
	}

	@Override
	public int getTotal(Criteria cri) {
		return eMapper.getTotal(cri);
	}

	@Override
	public List<EnquiryBoardDTO> getListPage(Criteria cri) {
		return eMapper.getListPage(cri);
	}

}
