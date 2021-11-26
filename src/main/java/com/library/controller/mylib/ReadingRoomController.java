package com.library.controller.mylib;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.model.mylib.ReadingRoomDTO;
import com.library.service.mylib.ReadingRoomService;

@Controller
@RequestMapping("/mylib/*")
public class ReadingRoomController {

	@Autowired
	private ReadingRoomService readingRoomService;

	@GetMapping("/readingRoom")
	public String getSeatsList(Model model, Principal principal) {
		
		readingRoomService.updateReading_Room1Table();
		readingRoomService.updateReading_Room1_RentalTable();

//		List<ReadingRoomDTO> seatsList = readingRoomService.getSeatsList(0, 10);
//		model.addAttribute("seatsList1", seatsList);
//		
//		List<ReadingRoomDTO> seatsList2 = readingRoomService.getSeatsList(10, 10);
//		model.addAttribute("seatsList2", seatsList2);
//		
//		List<ReadingRoomDTO> seatsList3 = readingRoomService.getSeatsList(20, 8);
//		model.addAttribute("seatsList3", seatsList3);
//		
//		List<ReadingRoomDTO> seatsList4 = readingRoomService.getSeatsList(28, 10);
//		model.addAttribute("seatsList4", seatsList4);
//		
//		List<ReadingRoomDTO> seatsList5 = readingRoomService.getSeatsList(38, 16);
//		model.addAttribute("seatsList5", seatsList5);
		
		List<ReadingRoomDTO> seatsList = readingRoomService.getSeatsList();
		model.addAttribute("seatsList", seatsList);

//		// 로그인 된 user_id 받아오기
//		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		System.out.println(principal);
//		
//		UserDetails userDetails = (UserDetails) principal;
//		String user_id = userDetails.getUsername();
//		
//		System.out.println(user_id);
		
		if(principal == null) {
			return "/mylib/sub3/readingRoom";
		}else {
			String user_id = principal.getName();
			
			ReadingRoomDTO mySeatInfo = readingRoomService.mySeatInfo(user_id);

			Date now = new Date();

			mySeatInfo.setDiff_time(mySeatInfo.getReturn_time().getTime() - now.getTime());

			model.addAttribute("mySeatInfo", mySeatInfo);
			model.addAttribute("login_id", user_id);
		}
		
		return "/mylib/sub3/readingRoom";
		
		
		
//		System.out.println(user_id);
//
//		if (readingRoomService.mySeatInfo(user_id) == null) {
//
//			return "/mylib/sub3/readingRoom";
//		} else {
//			ReadingRoomDTO mySeatInfo = readingRoomService.mySeatInfo(user_id);
//
//			Date now = new Date();
//
//			mySeatInfo.setDiff_time(mySeatInfo.getReturn_time().getTime() - now.getTime());
//
//			model.addAttribute("mySeatInfo", mySeatInfo);
//			model.addAttribute("login_id", user_id);
//		}
//
//		return "/mylib/sub3/readingRoom";
	}

	@GetMapping("/bookingSeat")
	public String bookingSeat(ReadingRoomDTO dto) {

		dto.setUser_id("khi29");

		readingRoomService.bookingSeat(dto);
		readingRoomService.updateStatusToOccupied(dto);

		return "redirect:/mylib/readingRoom";
	}

	@GetMapping("/returnSeat")
	public String returnSeat(ReadingRoomDTO dto) {

		readingRoomService.returnSeat(dto);
		readingRoomService.updateStatusToVacant(dto);

		return "redirect:/mylib/readingRoom";
	}

	@GetMapping("/moveSeat") 
	public String moveSeat(ReadingRoomDTO dto, @RequestParam("newSeat_no") int newSeat_no) {
		
		readingRoomService.returnSeat(dto);
		readingRoomService.updateStatusToVacant(dto);
		
		dto.setUser_id("khi29"); 
		dto.setSeat_no(newSeat_no);
		
		readingRoomService.bookingSeat(dto);
		readingRoomService.updateStatusToOccupied(dto);
		
		return "redirect:/mylib/readingRoom";
	}
	

	@GetMapping("/extendSeat")
	public String extendSeat(ReadingRoomDTO dto) {

		readingRoomService.extendSeat(dto);

		return "redirect:/mylib/readingRoom";
	}

}
