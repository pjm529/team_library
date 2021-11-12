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
import org.springframework.web.multipart.MultipartFile;

import com.library.model.board.NoticeDTO;
import com.library.page.Criteria;
import com.library.page.ViewPage;
import com.library.service.board.NoticeService;


@Controller
@RequestMapping("/board/*")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@GetMapping("/noticeList")
	public String noticeList(Model model, Criteria cri) {

		List<NoticeDTO> noticeList = noticeService.getListPaging(cri);
		model.addAttribute("noticeList", noticeList);

		int total = noticeService.getTotal(cri);

		model.addAttribute("total", total);
		ViewPage vp = new ViewPage(cri, total);
		model.addAttribute("pageMaker", vp);

		return "/board/sub1/noticeList";
	}

	@GetMapping("/noticeContent")
	public String noticeContent(Criteria cri, Model model, @RequestParam("notice_no") String n_notice_no) {

		Long notice_no = Long.parseLong(n_notice_no);

		noticeService.updateNoticeViews(notice_no);

		NoticeDTO noticeContent = noticeService.noticeContent(notice_no);
		model.addAttribute("noticeContent", noticeContent);
		model.addAttribute("cri", cri);

		return "/board/sub1/noticeContent";
	}

	@GetMapping("/insertNoticeForm")
	public String insertNoticeForm() {

		return "/board/sub1/insertNoticeForm";
	}

	@PostMapping("/insertNotice")
	public String insertNotice(NoticeDTO dto, @RequestParam("notice_img") MultipartFile[] uploadFile) {

		noticeService.insert(dto);

		return "redirect:/board/noticeList";
	}

	@GetMapping("/deleteNotice")
	public String deleteNotice(Criteria cri, @RequestParam("notice_no") String n_notice_no) {

		String keyword;

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/board/noticeList";
		}
		
		
		Long notice_no = Long.parseLong(n_notice_no);
		noticeService.delete(notice_no);
		noticeService.reset();
		return "redirect:/board/noticeList?amount=" + cri.getAmount() + "&page=" + cri.getPage() + "&keyword="
				+ keyword + "&type=" + cri.getType();
	}

	@GetMapping("/updateNoticeForm")
	public String updateNoticeForm(Criteria cri, Model model, @RequestParam("notice_no") String n_notice_no) {

		Long notice_no = Long.parseLong(n_notice_no);

		NoticeDTO noticeContent = noticeService.noticeContent(notice_no);
		model.addAttribute("noticeContent", noticeContent);
		model.addAttribute("cri", cri);

		return "/board/sub1/updateNoticeForm";
	}

	@PostMapping("/updateNotice")
	public String updateNotice(Criteria cri, NoticeDTO dto) {

		String keyword;

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/board/noticeList";
		}

		noticeService.update(dto);

		return "redirect:/board/noticeContent?amount=" + cri.getAmount() + "&page=" + cri.getPage() + "&keyword=" + keyword
				+ "&type=" + cri.getType() + "&notice_no=" + dto.getNotice_no();
	}

}
