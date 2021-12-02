package com.library.controller.mylib;

import java.security.Principal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.model.mylib.NoteBookRoomDTO;
import com.library.model.mylib.SeminarRoomDTO;
import com.library.service.mylib.NotebookRoomService;
import com.library.service.mylib.ReservationRoomService;
import com.library.service.mylib.SeminarRoomService;

@Controller
@RequestMapping("/mylib/*")
public class ReservationRoomController {
	
	@Autowired
	private ReservationRoomService resService;
	
	@Autowired // 노트북실
	private NotebookRoomService nbService;
	
	@Autowired // 세미나실
	private SeminarRoomService smService;
	
	@GetMapping("/reservationRoomPage")
	public String reservationRoomPage(Model model) {
		
		/* 열람실1 현황 */
		int rd1Room_usingSeat = resService.rd1Room_usingSeat();
		model.addAttribute("rd1Room_usingSeat", rd1Room_usingSeat);
		int rd1Room_usedSeat = resService.rd1Room_usedSeat();
		model.addAttribute("rd1Room_usedSeat", rd1Room_usedSeat);
		
		
		/* 열람실2 현황 */
		int rd2Room_usingSeat = resService.rd2Room_usingSeat();
		model.addAttribute("rd2Room_usingSeat", rd2Room_usingSeat);
		int rd2Room_usedSeat = resService.rd2Room_usedSeat();
		model.addAttribute("rd2Room_usedSeat", rd2Room_usedSeat);
		
		
		/* 노트북실 현황 */
		int nbRoom_usingSeat = resService.nbRoom_usingSeat();
		model.addAttribute("nbRoom_usingSeat", nbRoom_usingSeat);
		int nbRoom_usedSeat = resService.nbRoom_usedSeat();
		model.addAttribute("nbRoom_usedSeat", nbRoom_usedSeat);
		
		return "/mylib/sub3/reservationRoomPage";
	}
	
	@GetMapping("/myReservationInfo")
	public String myReservationInfo(Model model, Principal principal) {
		/* 로그인 된 ID */
		String user_id = principal.getName();
		model.addAttribute("login_id", user_id);

		NoteBookRoomDTO nbRoom_info = nbService.nbRoom_info(user_id);
		SeminarRoomDTO smRoom_info = smService.smRoom_info(user_id);
		
		if(nbRoom_info == null && smRoom_info == null) {
			return "/mylib/sub3/myReservationInfo";
		}else {
			Date now = new Date();
			nbRoom_info.setDiff_time(nbRoom_info.getCheckout_time().getTime() - now.getTime());
			model.addAttribute("nbRoom_info", nbRoom_info);
			model.addAttribute("smRoom_info", smRoom_info);
		}
		
		
		return "/mylib/sub3/myReservationInfo";
	}

}
