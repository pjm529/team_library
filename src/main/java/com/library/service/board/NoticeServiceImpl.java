package com.library.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.mapper.board.NoticeAttachMapper;
import com.library.mapper.board.NoticeMapper;
import com.library.model.board.NoticeAttachDTO;
import com.library.model.board.NoticeDTO;
import com.library.page.Criteria;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeMapper mapper;
	
	@Autowired
	private NoticeAttachMapper attachMapper;

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

//	@Override
//	public void insert(NoticeDTO dto) {
//		mapper.insert(dto);		
//	}

//	@Override
//	public void delete(Long notice_no) {
//		mapper.delete(notice_no);		
//	}

	@Override
	public void reset() {
		mapper.reset();
	}

//	@Override
//	public void update(NoticeDTO dto) {
//		mapper.update(dto);		
//	}

	
	
	/* 파일 업로드 */
	
	@Override
	public List<NoticeAttachDTO> getNoticeAttachList(Long notice_no) {
//		System.out.println("impl 내 notice_no ================> " + notice_no);
		return attachMapper.findByNotice_no(notice_no);
	}

	@Transactional
	@Override
	public void insert(NoticeDTO dto) {
		mapper.insert(dto);
		
		if(dto.getNoticeAttachList() == null || dto.getNoticeAttachList().size() <= 0) {
			return;
		}
		
		dto.getNoticeAttachList().forEach(attach -> {
			attach.setNotice_no(dto.getNotice_no());
			attachMapper.insert(attach);
		});
	}

	@Transactional
	@Override
	public boolean update(NoticeDTO dto) {
		
		attachMapper.deleteAllByNotice_no(dto.getNotice_no());
		
		boolean updateResult = mapper.update(dto);
		
		if(updateResult && dto.getNoticeAttachList() != null && dto.getNoticeAttachList().size() > 0 ) {
			dto.getNoticeAttachList().forEach(attach -> {
				attach.setNotice_no(dto.getNotice_no());
				attachMapper.insert(attach);
			});
		}
		
		return updateResult;
	}
	
	@Transactional
	@Override
	public void delete(Long notice_no) {
		
		attachMapper.deleteAllByNotice_no(notice_no);
		mapper.delete(notice_no);
	}
	

}
