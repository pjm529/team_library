package com.library.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.board.NoticeMapper;
import com.library.model.board.NoticeDTO;
import com.library.page.Criteria;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeMapper mapper;

	@Override
	public List<NoticeDTO> getListPaging(Criteria cri) {
		return mapper.getListPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}	

	@Override
	public NoticeDTO noticeContent(Long notice_no) {
		return mapper.noticeContent(notice_no);
	}
	
	@Override
	public void updateNoticeViews(Long notice_no) {
		mapper.updateViews(notice_no);
	}

	@Override
	public void insert(NoticeDTO dto) {
		mapper.insert(dto);		
	}

	@Override
	public void delete(Long notice_no) {
		mapper.delete(notice_no);		
	}

	@Override
	public void reset() {
		mapper.reset();
	}

	@Override
	public void update(NoticeDTO dto) {
		mapper.update(dto);		
	}

	

	

	
	
	
	
	
	

}
