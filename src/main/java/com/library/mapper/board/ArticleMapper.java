package com.library.mapper.board;

import java.util.List;

import com.library.model.board.ArticleDTO;
import com.library.page.Criteria;

public interface ArticleMapper {
		
	public List<ArticleDTO> list_all();
	
	public ArticleDTO articleContent(Long article_no);

	public void articleInsert(ArticleDTO dto);

	public void articleDelete(Long article_no);
	
	public boolean articleUpdate(ArticleDTO dto);
	
	public void articleViewsCount(Long article_no);

	public List<ArticleDTO> getListPaging(Criteria cri);

	public int getTotal(Criteria cri);

	public void reset();
	
	
	

//	public ArticleDTO userInfo(Long uno);

//	public void userDelete(Long uno);
//
//	public void userInsert(ArticleDTO dto);
//
//	public void userUpdate(ArticleDTO dto);
	
}
