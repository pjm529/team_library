package com.library.controller.mylib;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/mylib/*")
public class SeminarRoomController {
	
	@GetMapping("/seminarRoomService")
	public String seminarRoomService(@RequestParam("nowDate") String unowDate, Model model) {
		
		String nowDate = unowDate;
		model.addAttribute("nowDate", nowDate);
		
		return "/mylib/sub3/seminarRoomService";
	}

}
