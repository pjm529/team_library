package com.library.controller.mylib;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.model.mylib.NoteBookRoomDTO;
import com.library.service.mylib.NotebookRoomService;

@Controller
@RequestMapping("/mylib/*")
public class NotebookRoomController {

	@Autowired
	private NotebookRoomService nbService;

	/* 전체 좌석 출력(NotebookRoom) | 로그인 된 아이디와 비교 */
	@GetMapping("/notebookRoom")
	public String notebookRoomList(Model model, Principal principal) {

		List<NoteBookRoomDTO> notebookRoomlist = nbService.nbRoom_list_all();
		model.addAttribute("notebookRoomlist", notebookRoomlist);

		/* 로그인 된 ID */
		String user_id = principal.getName();
		model.addAttribute("login_id", user_id);

		NoteBookRoomDTO nbRoom_info = nbService.nbRoom_info(user_id);
		
		if(nbRoom_info == null) {
			return "/mylib/sub3/notebookRoom";
		}else {
			Date now = new Date();
			nbRoom_info.setDiff_time(nbRoom_info.getCheckout_time().getTime() - now.getTime());
			model.addAttribute("nbRoom_info", nbRoom_info);
		}
		
		return "/mylib/sub3/notebookRoom";

	}
	
	
	
	/* 예약 | 좌석 이동 | 반납 | 좌석 시간 연장 */
	/* 좌석 예약 */
	@PostMapping("/nbRoom_booking")
	public String nbRoom_booking(NoteBookRoomDTO dto, Principal principal) {

		String user_id = principal.getName();
		dto.setUser_id(user_id);
		
		nbService.nbRoom_booking(dto);
		
		return "redirect:/mylib/notebookRoom";
	}
	
	@ResponseBody
	@PostMapping("/nb_seat_check")
	public String nb_seat_check(@RequestParam String seat_no) {
		int result = nbService.nb_seat_check(seat_no);
		
		if(result == 1) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	/* 좌석 이동 */
	@PostMapping("nbRoom_moveSaet")
	public String nbRoom_moveSaet(NoteBookRoomDTO dto, Principal principal) {
		
		String user_id = principal.getName();
		
		dto.setUser_id(user_id);
		nbService.nbRoom_delete(user_id);
		nbService.nbRoom_booking(dto);
		
		return "redirect:/mylib/notebookRoom";
	}
	
	
	/* 좌석 반납 */
	@PostMapping("nbRoom_delete")
	public String nbRoom_delete(Principal principal) {

		String user_id = principal.getName();
		nbService.nbRoom_delete(user_id);
		
		return "redirect:/mylib/notebookRoom";
	}
	
	
	/* 좌석 연장 */
	@PostMapping("/nbRoom_extend")
	public String nbRoom_extend(Principal principal) {
		
		String user_id = principal.getName();
		
		nbService.nbRoom_extend(user_id);
		
		return "redirect:/mylib/notebookRoom";
		
	}
	
	
	
	

}
