package com.library.service.board;

import java.util.List;

import com.library.model.board.NoticeDTO;
import com.library.page.Criteria;

public interface NoticeService {

	public List<NoticeDTO> getListPaging(Criteria cri);
	public int getTotal(Criteria cri);
	public NoticeDTO noticeContent(Long notice_no);
	public void updateNoticeViews(Long notice_no);
	public void insert(NoticeDTO dto);
	public void delete(Long notice_no);
	public void reset();
	public void update(NoticeDTO dto);
	
}