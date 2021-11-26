package com.library.controller.mylib;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.model.mylib.SeminarRoomDTO;
import com.library.service.mylib.SeminarRoomService;

@Controller
@RequestMapping("/mylib/*")
public class SeminarRoomController {
	
	@Autowired
	private SeminarRoomService smService;
	
	@GetMapping("/seminarRoom")
	public String seminarRoom(@RequestParam("nowDate") String unowDate, Model model) {
		
		
		String nowDate = unowDate;
		model.addAttribute("nowDate", nowDate);
		
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		String id = userDetails.getUsername();
		model.addAttribute("user_id", id);
		
		
		return "/mylib/sub3/seminarRoom";
	}
	
	
	@PostMapping("/sm_Room_booking")
	@ResponseBody
	public int sm_Room_booking(@RequestBody SeminarRoomDTO dto) {
		System.out.println(dto);
		smService.updateStatusOccupied(dto);
		
		return smService.sm_Room_booking(dto);
		
	}

}
