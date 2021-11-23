package com.library.controller.mylib;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.model.mylib.ReadingRoom2DTO;
import com.library.service.mylib.ReadingRoom2Service;


@Controller
@RequestMapping("/mylib/*")
public class ReadingRoom2Controller {
	
	@Autowired
	private ReadingRoom2Service readingRoom2Service;
	
	
	@GetMapping("/readingRoom2")
	public String readingRoomRental(Model model) {
		
		readingRoom2Service.updateReading_Room2Table();
		readingRoom2Service.updateReading_Room2_RentalTable();
		

		List<ReadingRoom2DTO> readingRoomlist = readingRoom2Service.list_all();		
		model.addAttribute("readingRoomlist", readingRoomlist);
		

		String user_id = "user123"; //세션 아이디
		
		if(readingRoom2Service.room2_info(user_id) == null) {
			
			return "/mylib/sub3/readingRoom2";
		}else {
			ReadingRoom2DTO room2_info = readingRoom2Service.room2_info(user_id);
			
			Date now = new Date();
			
			room2_info.setDiff_time(room2_info.getReturn_time().getTime() - now.getTime());
						
			model.addAttribute("room2_info", room2_info);
		}

		return "/mylib/sub3/readingRoom2";
		
		//컨트롤러에서 서비스단으로 넘긴다.(모델이라는 객체 이용하면 뷰단으로 쉽게 빼낼 수 있음)
	}
	
	  @GetMapping("/room2_delete")
	  public String room2_delete(@RequestParam("seat_no") String seat_no) {
		  
		  readingRoom2Service.room2_delete(seat_no);
		  readingRoom2Service.updateStatusVacant(seat_no);
		  
		  return "redirect:/mylib/readingRoom2";
		  
	  }
	 

	@GetMapping("/room2_booking")
	public String room2booking(ReadingRoom2DTO dto) {
			
		dto.setUser_id("user123"); //세션아이디 없어서 강제로 주입

		readingRoom2Service.room2_booking(dto);
		readingRoom2Service.updateStatusOccupied(dto);

		return "redirect:/mylib/readingRoom2";
	}
	
	@GetMapping("/room2_extend")
	public String room2extend(@RequestParam("seat_no") String seat_no) {
		
		 
		readingRoom2Service.room2_extend(seat_no);

		return "redirect:/mylib/readingRoom2";
		
		//컨트롤러에서 서비스단으로 넘긴다.(모델이라는 객체 이용하면 뷰단으로 쉽게 빼낼 수 있음)
	}
	
	@GetMapping("/moveSeat2")
	public String moveSeat2(ReadingRoom2DTO dto, @RequestParam("newSeat_no") int newSeat_no) {
		
		readingRoom2Service.room2_delete(dto);
		readingRoom2Service.updateStatusVacant(dto);
		
		dto.setUser_id("user123"); //세션아이디 없어서 강제로 주입
		dto.setSeat_no(newSeat_no);
		
		readingRoom2Service.room2_booking(dto);
		readingRoom2Service.updateStatusOccupied(dto);
		

		return "redirect:/mylib/readingRoom2";
	}

}
	
//	@GetMapping("/articleList")
//	public String articleList(Model model, Criteria cri) {
//		
//		List<ArticleDTO> articleList = articleService.getListPaging(cri);
//		model.addAttribute("articleList", articleList); 
//		
//		int total = articleService.getTotal(cri);
//		model.addAttribute("total", total);
//		ViewPage vp = new ViewPage(cri, total);
//		model.addAttribute("pageMaker", vp);
//		
//		return "/board/sub4/articleList";
//		//return "redirect:/articleList?amount="+cri.getAmount()+"&page="+cri.getPage();
//		
//		//컨트롤러에서 서비스단으로 넘긴다.(모델이라는 객체 이용하면 뷰단으로 쉽게 빼낼 수 있음)
//	}
//		
//	@GetMapping("/articleInsertForm")
//	public String goArticleInsert() {
//		
//		return "/board/sub4/articleInsertForm";
//	}
//	
//	@PostMapping("/articleInsertForm")
//	public String articleInsert(ArticleDTO dto) {
//		
//		articleService.articleInsert(dto);
//		
//		return "redirect:/articleList";
//	}
//	@GetMapping("/articleContent")
//	public String articleContent(Criteria cri, @RequestParam("article_no")String a_article_no, Model model) {
//		
//		Long article_no = Long.parseLong(a_article_no);
//		articleService.articleViewsCount(article_no);
//		ArticleDTO dto = articleService.articleContent(article_no);
//		model.addAttribute("dto", dto);
//		model.addAttribute("cri", cri);
//		
//		return "/board/sub4/articleContent";
//	}
//	
//	@GetMapping("/articleDelete")
//	public String articleDelete(Criteria cri, @RequestParam("article_no") String a_article_no) { 
//		
//		String keyword;
//		
//		try {
//			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			return "redirect:/articleList";
//		}
//				
//		Long article_no = Long.parseLong(a_article_no); //들어오는 스트링값이 롱값으로 변환됌
//		articleService.articleDelete(article_no);
//		articleService.reset();
//		
//		return "redirect:/articleList?amount=" + cri.getAmount() + "&page=" + cri.getPage() + "&keyword=" + keyword + "&type" + cri.getType(); //리다이렉트로 새로고침된 값을 뿌린다.
//	}
//	
//	@GetMapping("/articleModifyForm")
//	public String modifyForm(@RequestParam("article_no")String a_article_no, Model model, Criteria cri) {		
//		
//		Long article_no = Long.parseLong(a_article_no);
//		ArticleDTO dto = articleService.articleContent(article_no);
//		model.addAttribute("dto", dto);
//		model.addAttribute("cri", cri);
//		
//		return "/board/sub4/articleModifyForm";
//		
//	}
//		
//	@PostMapping("/articleModify")
//	public String userModify(ArticleDTO dto, Criteria cri) {
//		
//		String keyword;
//		
//		try {
//			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			return "redirect:/articleList";
//		}
//		
//		articleService.articleUpdate(dto);
//		
//		return "redirect:/articleContent?amount=" + cri.getAmount() + "&page=" + cri.getPage() + "&keyword=" + keyword + "&type" + cri.getType() + "&article_no=" + dto.getArticle_no(); //리다이렉트할때는 위에 매핑주소를 따라간다.
//	}
	
	
//	@GetMapping("/userInsert")
//	public String goUserInsert() {
//		
//		return "userInsert";
//	}
		
//	@PostMapping("/userInsert")
//	public String userInsert(UserDTO dto) {
//		//System.out.println(dto); 콘솔창에 값 들어오는지 확인		
//		userService.userInsert(dto);
//		return "redirect:/userList"; // 리다이렉트의 슬러시 의미는 @GetMapping("/") 주소로 가라
//	}
//	@GetMapping("/articleList")
//	public String articleList(Model model) {
//		
//		List<ArticleDTO> articleList = articleService.list_all();
//		model.addAttribute("articleList", articleList); 
//		
//		return "articleList";
//		
//		//컨트롤러에서 서비스단으로 넘긴다.(모델이라는 객체 이용하면 뷰단으로 쉽게 빼낼 수 있음)
//	}
//	@GetMapping("/userDelete")
//	public String delete(@RequestParam("uno")String u_no) { 
//		
//		Long uno = Long.parseLong(u_no); //들어오는 스트링값이 롱값으로 변환됌
//		userService.userDelete(uno);
//		
//		
//		return "redirect:/userList"; //리다이렉트로 새로고침된 값을 뿌린다.
//	}

//	@GetMapping("/userModifyForm")
//	public String modifyForm(@RequestParam("uno")String u_no, Model model) {		
//		
//		Long uno = Long.parseLong(u_no);
//		UserDTO dto = userService.userInfo(uno);
//		model.addAttribute("dto", dto);
//		
//		return "userModifyForm";
//		
//	}
//	@PostMapping("/userModify")
//	public String userModify(UserDTO dto, @RequestParam("uno") String uno ) {
//		
//		userService.userUpdate(dto);
//		return "redirect:/userInfo?uno="+uno;
//	}
//		
	


