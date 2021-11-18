package com.library.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.library.mapper.board.ArticleMapper;
import com.library.mapper.board.ArticleAttachMapper;
import com.library.model.board.ArticleAttachDTO;
import com.library.model.board.ArticleDTO;
import com.library.page.Criteria;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleMapper mapper;
	
	@Autowired
	private ArticleAttachMapper attachMapper;
	
//	@Override
//	public void insert(UserDTO dto) {
//		
//		mapper.insert(dto);				
//	}
	@Override
	public List<ArticleDTO> list_all(){
		return mapper.list_all();
		
		//impl에서 xml로 넘긴다.(mapper 자바도 가서 만들어줘야함)
	}
//	@Override
//	public void delete(Long bno) {
//		mapper.delete(bno);
//		
//	}

	@Override
	public ArticleDTO articleContent(Long article_no) {
		return mapper.articleContent(article_no);
	}

	@Transactional
	@Override
	public void articleInsert(ArticleDTO dto) {
		mapper.articleInsert(dto);
		System.out.println("no===================================== "+dto.getArticle_no());
		
		if (dto.getAttachList() == null || dto.getAttachList().size() <= 0) {
			return;
		}
		
		dto.getAttachList().forEach(attach -> {

			attach.setArticle_no(dto.getArticle_no());
			
			
			attachMapper.insert(attach);
		});
		
		
		
		
	}

	@Override
	public void articleDelete(Long article_no) {
		mapper.articleDelete(article_no);
		
	}

	@Override
	public void articleUpdate(ArticleDTO dto) {
		mapper.articleUpdate(dto);
		
	}



	@Override
	public void articleViewsCount(Long article_no) {
		mapper.articleViewsCount(article_no);
		
	}

	@Override
	public List<ArticleDTO> getListPaging(Criteria cri) {
		
		return mapper.getListPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotal(cri);
	}

	@Override
	public void reset() {
		mapper.reset();
		
	}

	@Override
	public List<ArticleAttachDTO> getAttachList(Long article_no) {
		
		System.out.println("impl내 article_no============ "+article_no);
		
		return attachMapper.findByArticle_no(article_no);
	}



//	@Override
//	public ArticleDTO userInfo(Long uno) {
//		
//		return mapper.userInfo(uno);
//	}
//
//	@Override
//	public void userDelete(Long uno) {
//		mapper.userDelete(uno);
//		
//	}
//
//	@Override
//	public void userInsert(ArticleDTO dto) {
//		mapper.userInsert(dto);
//		
//	}
//
//	@Override
//	public void userUpdate(ArticleDTO dto) {
//		mapper.userUpdate(dto);
//		
//	}

//	@Override
//	public void update(UserDTO dto) {
//		mapper.update(dto);
//		
//	}
	
	

}
