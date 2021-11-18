package com.library.controller.mylib;

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
	
	@GetMapping("/notebookRoom")
	public String seatsList(Model model) {
		
		List<NoteBookRoomDTO> notebookRoomlist = nbService.seats_list_all();
		model.addAttribute("notebookRoomlist", notebookRoomlist);
		
		return "/mylib/sub3/notebookRoom";
	}
	
	
}
