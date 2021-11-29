package com.library.controller.mylib;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.model.mylib.ReadingRoomDTO;
import com.library.service.mylib.ReadingRoom2Service;

@Controller
@RequestMapping("/mylib/*")
public class ReadingRoom2Controller {

	@Autowired
	private ReadingRoom2Service readingRoom2Service;

	// 제2열람실 좌석 리스트 출력
	@GetMapping("/readingRoom2")
	public String readingRoomRental(Model model, Principal principal) {

		List<ReadingRoomDTO> readingRoomlist = readingRoom2Service.list_all();
		model.addAttribute("readingRoomlist", readingRoomlist);

		// 로그인 된 아이디
		String user_id = principal.getName();

		model.addAttribute("login_id", user_id);

		ReadingRoomDTO room2_info = readingRoom2Service.room2_info(user_id);

		// 제2열람실 좌석 정보
		if (room2_info == null) {

			return "/mylib/sub3/readingRoom2";

		} else {

			Date now = new Date();

			room2_info.setDiff_time(room2_info.getCheckout_time().getTime() - now.getTime());

			model.addAttribute("room2_info", room2_info);

		}

		return "/mylib/sub3/readingRoom2";

		// 컨트롤러에서 서비스단으로 넘긴다.(모델이라는 객체 이용하면 뷰단으로 쉽게 빼낼 수 있음)
	}

	// 제2열람실 예약
	@PostMapping("/room2_booking")
	public String room2booking(ReadingRoomDTO dto, Principal principal) {

		String user_id = principal.getName();
		
		dto.setUser_id(user_id);

		readingRoom2Service.room2_booking(dto);

		return "redirect:/mylib/readingRoom2";
	}
	
	@ResponseBody
	@PostMapping("/seat2_check")
	public String seat2_check(@RequestParam String seat_no) {
		int result = readingRoom2Service.seat2_check(seat_no);
		
		if (result == 1) {
			return "success";
		} else {
			return "fail";
		}
		
	}

	// 제2열람실 퇴실
	@PostMapping("/room2_delete")
	public String room2_delete(Principal principal) {
		String user_id = principal.getName();
		
		readingRoom2Service.room2_delete(user_id);
		
		return "redirect:/mylib/readingRoom2";

	}

	// 좌석 연장
	@PostMapping("/room2_extend")
	public String room2extend(Principal principal) {
		String user_id = principal.getName();
		
		readingRoom2Service.room2_extend(user_id);

		return "redirect:/mylib/readingRoom2";

		// 컨트롤러에서 서비스단으로 넘긴다.(모델이라는 객체 이용하면 뷰단으로 쉽게 빼낼 수 있음)
	}

	// 좌석 이동
	@PostMapping("/moveSeat2")
	public String moveSeat2(ReadingRoomDTO dto, Principal principal) {
		String user_id = principal.getName();
		
		dto.setUser_id(user_id);
		readingRoom2Service.room2_delete(user_id);
		readingRoom2Service.room2_booking(dto);

		return "redirect:/mylib/readingRoom2";
	}

}
