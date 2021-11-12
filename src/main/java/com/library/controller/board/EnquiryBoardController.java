package com.library.controller.board;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.model.board.EnquiryBoardDTO;
import com.library.page.Criteria;
import com.library.page.ViewPage;
import com.library.service.board.EnquiryBoardService;

@Controller
@RequestMapping("/board/*")
public class EnquiryBoardController {
	
	@Autowired
	private EnquiryBoardService eBoardService;
	
	
	/* 묻고답하기 게시판 */
	@GetMapping("/qnaBoardList")
	public String qnaBoardList(Model model, Criteria cri) {
		
		List<EnquiryBoardDTO> qnaBoardList = eBoardService.getListPage(cri);
		model.addAttribute("qnaBoardList", qnaBoardList);
		
		int total = eBoardService.getTotal(cri);
		model.addAttribute("total", total);
		ViewPage vp = new ViewPage(cri, total);
		model.addAttribute("pageMaker", vp);
		
		return "/board/sub3/qnaBoardList";
	}
	
	
	/* 게시물 본문 */
	@GetMapping("/qnaBoardContent")
	public String qnaBoardContent(@RequestParam("enquiry_no")String uenquiry_no, Model model){
		
		Long enquiry_no = Long.parseLong(uenquiry_no);
		eBoardService.updateView(enquiry_no);
		EnquiryBoardDTO dto = eBoardService.enquiryContent(enquiry_no);	
		model.addAttribute("dto", dto);
		
		return "/board/sub3/qnaBoardContent";
	}
	

	/* 게시물 등록 page */
	@GetMapping("/qnaBoardWrite")
	public String qnaBoardWrite(){
		
		return "/board/sub3/qnaBoardWrite";
	}
	
	/* 게시물 등록 */
	@PostMapping("/qnaBoardInsert")
	public String qnaBoardInsert(EnquiryBoardDTO dto) {
		eBoardService.enquiryBoardInsert(dto);
		
		return "redirect:/board/qnaBoardList";
	}
	
	
	/* 게시물 삭제 */
	@GetMapping("/qnaBoardDelete")
	public String qnaBoardDelete(Criteria cri, @RequestParam("enquiry_no") String uenquiry_no) {

		String keyword;

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/board/qnaBoardList";
		}
		
		Long enquiry_no = Long.parseLong(uenquiry_no);
		eBoardService.enquiryBoardDelete(enquiry_no);
		eBoardService.reset();
		return "redirect:/board/qnaBoardList?amount=" + cri.getAmount() + "&page=" + cri.getPage() + "&keyword="
				+ keyword + "&type=" + cri.getType();
	}
	

	
//	/* �Խù� ���� ������ */
//	@GetMapping("/qnaBoardEdit")
//	public String qnaBoardEdit(@RequestParam("enquiry_no")String uenquiry_no, Model model) {
//		
//		Long enquiry_no = Long.parseLong(uenquiry_no);
//		EnquiryBoardDTO dto = eBoardService.enquiryContent(enquiry_no);	
//		model.addAttribute("dto", dto);
//		
//		return "qnaBoardEdit";
//	}
//	
//	
//	/* �Խù� ���� */
//	@PostMapping("/qnaBoardUpdate")
//	public String qnaBoardUpdate(EnquiryBoardDTO dto, @RequestParam("enquiry_no")String uenquiry_no) {
//		Long enquiry_no = Long.parseLong(uenquiry_no);
//		eBoardService.enquiryBoardUpdate(dto);
//		
//		return "redirect:/qnaBoardContent?enquiry_no=" + enquiry_no;
//	}
//	
	
}
