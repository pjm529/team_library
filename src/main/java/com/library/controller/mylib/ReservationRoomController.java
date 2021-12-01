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
	public String reservationRoomPage(Model model) {
		
		int nbRoom_usingSeat = resService.nbRoom_usingSeat();
		System.out.println(nbRoom_usingSeat);
		model.addAttribute("nbRoom_usingSeat", nbRoom_usingSeat);
		
		int nbRoom_usedSeat = resService.nbRoom_usedSeat();
		model.addAttribute("nbRoom_usedSeat", nbRoom_usedSeat);
		
		return "/mylib/sub3/reservationRoomPage";
	}

}
