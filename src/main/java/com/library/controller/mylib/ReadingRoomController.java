package com.library.controller.mylib;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.model.mylib.ReadingRoomDTO;
import com.library.service.mylib.ReadingRoomService;

@Controller
@RequestMapping("/mylib/*")
public class ReadingRoomController {

	@Autowired
	private ReadingRoomService readingRoomService;

	@GetMapping("/readingRoom")
	public String getSeatsList(Model model) {

		List<ReadingRoomDTO> seatsList = readingRoomService.getSeatsList();
		model.addAttribute("seatsList", seatsList);

//		HttpSession session = request.getSession();
//		session.setAttribute("user_id", "khi29");
//		String user_id = (String) session.getAttribute("user_id");

		String user_id = "khi29"; // 세션아이디

		if (readingRoomService.mySeatInfo(user_id) == null) {

			return "/mylib/sub3/readingRoom";
		} else {
			ReadingRoomDTO mySeatInfo = readingRoomService.mySeatInfo(user_id);

			Date now = new Date();

			mySeatInfo.setDiff_time(mySeatInfo.getReturn_time().getTime() - now.getTime());

			model.addAttribute("mySeatInfo", mySeatInfo);
		}

		return "/mylib/sub3/readingRoom";
	}

	@GetMapping("/readingRoomOrigin")
	public String readingRoomOrigin(Model model) {

		List<ReadingRoomDTO> seatsList = readingRoomService.getSeatsList();
		model.addAttribute("seatsList", seatsList);

		String user_id = "khi29"; // 세션아이디

		if (readingRoomService.mySeatInfo(user_id) == null) {

			return "/mylib/sub3/readingRoom_origin";
		} else {
			ReadingRoomDTO mySeatInfo = readingRoomService.mySeatInfo(user_id);

			Date now = new Date();

			mySeatInfo.setDiff_time(mySeatInfo.getReturn_time().getTime() - now.getTime());

			model.addAttribute("mySeatInfo", mySeatInfo);
		}

		return "/mylib/sub3/readingRoom_origin";
	}

//	@PostMapping("/bookingSeat")
//	public String bookingSeat(ReadingRoomDTO dto) {
//		
//		readingRoomService.bookingSeat(dto);
//		readingRoomService.updateStatusToOccupied(dto);
//		
//		return "redirect:/mylib/readingRoom";
//	}
//	
//	@PostMapping("/returnSeat")
//	public String returnSeat(ReadingRoomDTO dto) {
//		
//		readingRoomService.returnSeat(dto);
//		readingRoomService.updateStatusToVacant(dto);
//		
//		return "redirect:/mylib/readingRoom";
//	}

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

	@GetMapping("/extendSeat")
	public String extendSeat(ReadingRoomDTO dto) {

		readingRoomService.extendSeat(dto);

		return "redirect:/mylib/readingRoom";
	}

}
