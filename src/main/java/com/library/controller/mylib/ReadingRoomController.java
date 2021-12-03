package com.library.controller.mylib;

import java.security.Principal;
import java.text.SimpleDateFormat;
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

import com.library.model.mylib.ReadingRoomDTO;
import com.library.service.mylib.ReadingRoomService;

@Controller
@RequestMapping("/mylib/*")
public class ReadingRoomController {

	@Autowired
	private ReadingRoomService readingRoomService;

	@GetMapping("/readingRoom")
	public String getSeatsList(Model model, Principal principal) {

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

//		List<ReadingRoomDTO> seatsList = readingRoomService.getSeatsList();
//		model.addAttribute("seatsList", seatsList);

		List<ReadingRoomDTO> seatsList = readingRoomService.getReadingRoom1SeatsList();
		model.addAttribute("seatsList", seatsList);

		String user_id = principal.getName();
		model.addAttribute("login_id", user_id);

		ReadingRoomDTO mySeatInfo = readingRoomService.mySeatInfo(user_id);

		if (mySeatInfo == null) {
			return "/mylib/sub3/readingRoom";
		} else {
			Date now = new Date();
			mySeatInfo.setDiff_time(mySeatInfo.getCheckout_time().getTime() - now.getTime());
			model.addAttribute("mySeatInfo", mySeatInfo);
		}
		return "/mylib/sub3/readingRoom";

	}

	// 좌석 예약
	@PostMapping("/bookingSeat")
	public String bookingSeat(ReadingRoomDTO dto, Principal principal) {

		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		String nowTime = fmt.format(now);

		// 현재 시간
		int hours = Integer.parseInt(nowTime.substring(11, 13));
		
		// 현재 시간이 9~17시 일경우 예약
		if (hours > 8 && hours < 18) {
			String user_id = principal.getName();
			dto.setUser_id(user_id);

			readingRoomService.bookingSeat(dto);
		}

		return "redirect:/mylib/readingRoom";
	}

	// 열람실 좌석 상태 체크
	@ResponseBody
	@PostMapping("/seat_check")
	public String seat_check(@RequestParam String seat_no) {

		int result = readingRoomService.seat_check(seat_no);

		if (result == 1) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 열람실 퇴실
	@PostMapping("/returnSeat")
	public String returnSeat(Principal principal) {

		String user_id = principal.getName();
		readingRoomService.returnSeat(user_id);

		return "redirect:/mylib/readingRoom";
	}

	// 좌석 이동
	@PostMapping("/moveSeat")
	public String moveSeat(ReadingRoomDTO dto, Principal principal) {

		String user_id = principal.getName();
		dto.setUser_id(user_id);
		readingRoomService.returnSeat(user_id);
		readingRoomService.bookingSeat(dto);

		return "redirect:/mylib/readingRoom";
	}

	// 좌석 연장
	@PostMapping("/extendSeat")
	public String extendSeat(Principal principal) {

		String user_id = principal.getName();
		readingRoomService.extendSeat(user_id);

		return "redirect:/mylib/readingRoom";
	}

}
