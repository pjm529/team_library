package com.library.controller.board;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.library.model.board.NoticeAttachDTO;
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
		List<NoticeDTO> posts = noticeService.getPrevAndNextPost(notice_no);
		
		model.addAttribute("noticeContent", noticeContent);
		model.addAttribute("cri", cri);
		model.addAttribute("posts", posts);

		return "/board/sub1/noticeContent";
	}

	@GetMapping("/insertNoticeForm")
	public String insertNoticeForm() {

		return "/board/sub1/insertNoticeForm";
	}

//	@PostMapping("/insertNotice")
//	public String insertNotice(NoticeDTO dto, @RequestParam("notice_img") MultipartFile[] uploadFile) {
//
//		noticeService.insert(dto);
//
//		return "redirect:/board/noticeList";
//	}
	
	@PostMapping("/insertNotice")
	public String insertNotice(NoticeDTO dto, RedirectAttributes rttr) {
		
		if(dto.getNoticeAttachList() != null) {
			dto.getNoticeAttachList().forEach(attach -> System.out.println(attach));
		}
		
		noticeService.insert(dto);

		rttr.addFlashAttribute("result", dto.getNotice_no());
		
		return "redirect:/board/noticeList";
	}
	
	
	@GetMapping(value = "/getNoticeAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<NoticeAttachDTO>> getNoticeAttachList(Long notice_no){
		
		List<NoticeAttachDTO> a = noticeService.getNoticeAttachList(notice_no);
		return new ResponseEntity<>(noticeService.getNoticeAttachList(notice_no), HttpStatus.OK);
	}
	
	
	@GetMapping("/deleteNotice")
	public String deleteNotice(Criteria cri, @RequestParam("notice_no") String n_notice_no, RedirectAttributes rttr, 
			@RequestParam("uuid") String uuid, @RequestParam("file_type") String file_type) {

		String keyword;

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
			
			List<NoticeAttachDTO> attachList = noticeService.getNoticeAttachList(Long.parseLong(n_notice_no));
			deleteNoticeFiles(attachList);
			rttr.addFlashAttribute("result", "success");
			
			fileDelete(uuid, file_type);
			
			
		} catch (UnsupportedEncodingException e) {
			return "redirect:/board/noticeList";
		}
		
		Long notice_no = Long.parseLong(n_notice_no);
		noticeService.delete(notice_no);
		noticeService.reset();
		return "redirect:/board/noticeList?amount=" + cri.getAmount() + "&page=" + cri.getPage() + "&keyword="
				+ keyword + "&type=" + cri.getType();
	}
	
	private void deleteNoticeFiles(List<NoticeAttachDTO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		attachList.forEach(attach -> {
			
			try {
				Path file = Paths.get("C:\\notice_file\\" + attach.getUuid() + "_" + attach.getFile_name());
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbnail = Paths.get("C:\\notice_file\\" + "\\s_" + attach.getUuid() + "_" + attach.getFile_name());
					Files.delete(thumbnail);
				}
			} catch (Exception e) {
				System.out.println("파일 삭제 실패 ============= " + e.getMessage());
			}

		});
		
	}
	
	/* 폴더 내 파일 삭제 */
	public void fileDelete(String uuid, String type) {
		
		System.out.println(uuid);
		System.out.println(type);
	
		String filePath = "C:\\notice_file\\";
		File deleteFileName = new File(filePath + uuid);
		
		if(type.equals("image")) {
			String thumb = "s_" + uuid;
			File deleteThumbFileName = new File(filePath + thumb);
			deleteFileName.delete();
			deleteThumbFileName.delete();
			System.out.println("이미지 파일 삭제 완료");
		}else {
			deleteFileName.delete();
			System.out.println("파일 삭제 완료");
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

//	@GetMapping("/deleteNotice")
//	public String deleteNotice(Criteria cri, @RequestParam("notice_no") String n_notice_no) {
//
//		String keyword;
//
//		try {
//			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			return "redirect:/board/noticeList";
//		}
//		
//		Long notice_no = Long.parseLong(n_notice_no);
//		noticeService.delete(notice_no);
//		noticeService.reset();
//		return "redirect:/board/noticeList?amount=" + cri.getAmount() + "&page=" + cri.getPage() + "&keyword="
//				+ keyword + "&type=" + cri.getType();
//	}

	@GetMapping("/updateNoticeForm")
	public String updateNoticeForm(Criteria cri, Model model, @RequestParam("notice_no") String n_notice_no) {

		Long notice_no = Long.parseLong(n_notice_no);

		NoticeDTO noticeContent = noticeService.noticeContent(notice_no);
		model.addAttribute("noticeContent", noticeContent);
		model.addAttribute("cri", cri);

		return "/board/sub1/updateNoticeForm";
	}

//	@PostMapping("/updateNotice")
//	public String updateNotice(Criteria cri, NoticeDTO dto) {
//
//		String keyword;
//
//		try {
//			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			return "redirect:/board/noticeList";
//		}
//
//		noticeService.update(dto);
//
//		return "redirect:/board/noticeContent?amount=" + cri.getAmount() + "&page=" + cri.getPage() + "&keyword=" + keyword
//				+ "&type=" + cri.getType() + "&notice_no=" + dto.getNotice_no();
//	}
	
	
	@PostMapping("/updateNotice")
	public String updateNotice(Criteria cri, NoticeDTO dto, RedirectAttributes rttr) {

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
