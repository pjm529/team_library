package com.library.controller.mylib;

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
	
	@GetMapping("/notebookRoom")
	public String seatsList(Model model) {
		
		List<NoteBookRoomDTO> notebookRoomlist = nbService.seats_list_all();
		model.addAttribute("notebookRoomlist", notebookRoomlist);
		
		// 세션 id
		String user_id = "id";
		
		if(nbService.reservation_info(user_id) == null){
			
			return "/mylib/sub3/notebookRoom";
			
		}else {
			NoteBookRoomDTO reservation_info = nbService.reservation_info(user_id);
			
			Date now = new Date();
			
			reservation_info.setDiff_time(reservation_info.getReturn_time().getTime() - now.getTime());
			
			model.addAttribute("reservation_info", reservation_info);
		}
		
		
		return "/mylib/sub3/notebookRoom";
	}
	
	
	@GetMapping("/nb_seat_booking")
	public String notebookRoom_booking(NoteBookRoomDTO dto) {
		
		dto.setUser_id("id3");
		
		nbService.nb_seat_booking(dto);
		nbService.updateStatusOccupied(dto);
		
		return "redirect:/mylib/notebookRoom";
	}
	
	
	
	
}
