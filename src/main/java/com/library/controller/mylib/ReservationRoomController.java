package com.library.controller.mylib;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.service.mylib.ReservationRoomService;

@Controller
@RequestMapping("/mylib/*")
public class ReservationRoomController {
	
	@Autowired
	private ReservationRoomService resService;
	
	@GetMapping("/reservationRoomPage")
	public String sub3MainPage(Model model) {
		
		int nbUsingSeat = resService.nbUsingSeat();
		model.addAttribute("nbUsingSeat", nbUsingSeat);
		
		int nbUsedSeat = resService.nbUsedSeat();
		model.addAttribute("nbUsedSeat", nbUsedSeat);
		
		return "/mylib/sub3/reservationRoomPage";
	}

}
