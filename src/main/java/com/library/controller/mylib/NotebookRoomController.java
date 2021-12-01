package com.library.controller.mylib;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.model.mylib.NoteBookRoomDTO;
import com.library.service.mylib.NotebookRoomService;

@Controller
@RequestMapping("/mylib/*")
public class NotebookRoomController {

	@Autowired
	private NotebookRoomService nbService;

	/* 전체 좌석 출력(NotebookRoom) */
	@GetMapping("/notebookRoom")
	public String notebookRoomList(Model model, Principal principal) {

		List<NoteBookRoomDTO> notebookRoomlist = nbService.nb_list_all();
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
			model.addAttribute("room2_info", nbRoom_info);
		}
		
		return "/mylib/sub3/notebookRoom";

	}

}
