package com.library.controller.mylib;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.model.mylib.ReadingRoom2DTO;
import com.library.service.mylib.ReadingRoom2Service;


@Controller
@RequestMapping("/mylib/*")
public class ReadingRoom2Controller {
	
	@Autowired
	private ReadingRoom2Service readingRoom2Service;
	
	// 제2열람실 좌석 리스트 출력
	@GetMapping("/readingRoom2")
	public String readingRoomRental(Model model, Principal principal) {
		
		// 반납 시간 지난 자리 자동 비움
		readingRoom2Service.updateReading_Room2Table();
		readingRoom2Service.updateReading_Room2_RentalTable();

		List<ReadingRoom2DTO> readingRoomlist = readingRoom2Service.list_all();		
		model.addAttribute("readingRoomlist", readingRoomlist);
		
		//String user_id = "user123"; //세션 아이디
		
		// 로그인 된 아이디
		String user_id = principal.getName();
		
		model.addAttribute("login_id", user_id);
		
		ReadingRoom2DTO room2_info = readingRoom2Service.room2_info(user_id);
		
		// 제2열람실 좌석 정보
		if(room2_info == null) {
			
			return "/mylib/sub3/readingRoom2";
			
		}else {
			
			Date now = new Date();
			
			room2_info.setDiff_time(room2_info.getReturn_time().getTime() - now.getTime());
						
			model.addAttribute("room2_info", room2_info);	
			
			
		}


		return "/mylib/sub3/readingRoom2";
		
		//컨트롤러에서 서비스단으로 넘긴다.(모델이라는 객체 이용하면 뷰단으로 쉽게 빼낼 수 있음)
	}
		// 제2열람실 퇴실
	  @GetMapping("/room2_delete")
	  public String room2_delete(@RequestParam("seat_no") String seat_no) {
		  
		  readingRoom2Service.room2_delete(seat_no);
		  readingRoom2Service.updateStatusVacant(seat_no);
		  
		  return "redirect:/mylib/readingRoom2";
		  
	  }
	 
	  	// 제2열람실 예약
		@GetMapping("/room2_booking")
		public String room2booking(ReadingRoom2DTO dto, Principal principal) {
				
	
			String user_id = principal.getName();
			
			dto.setUser_id(user_id);
			
			readingRoom2Service.room2_booking(dto);
			readingRoom2Service.updateStatusOccupied(dto);
	
			return "redirect:/mylib/readingRoom2";
		}
	
		// 좌석 연장
		@GetMapping("/room2_extend")
		public String room2extend(@RequestParam("seat_no") String seat_no) {
			
			 
			readingRoom2Service.room2_extend(seat_no);
	
			return "redirect:/mylib/readingRoom2";
			
			//컨트롤러에서 서비스단으로 넘긴다.(모델이라는 객체 이용하면 뷰단으로 쉽게 빼낼 수 있음)
		}
	
		// 좌석 이동
		@GetMapping("/moveSeat2")
		public String moveSeat2(ReadingRoom2DTO dto, @RequestParam("newSeat_no") int newSeat_no, Principal principal) {
			
			readingRoom2Service.room2_delete(dto);
			readingRoom2Service.updateStatusVacant(dto);
			
			String user_id = principal.getName();
			dto.setUser_id(user_id); 
			dto.setSeat_no(newSeat_no);
			
			readingRoom2Service.room2_booking(dto);
			readingRoom2Service.updateStatusOccupied(dto);
			
	
			return "redirect:/mylib/readingRoom2";
		}

}
	



