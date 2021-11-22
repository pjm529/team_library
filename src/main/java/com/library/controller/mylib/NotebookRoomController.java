package com.library.controller.mylib;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.library.model.mylib.NoteBookRoomDTO;
import com.library.service.mylib.NotebookRoomService;

@Controller
@RequestMapping("/mylib/*")
public class NotebookRoomController {

	@Autowired
	private NotebookRoomService nbService;
	
	@GetMapping("/sub3MainPage")
	public String sub3MainPage() {
		return "/mylib/sub3/sub3MainPage";
	}

	/* 좌석 리스트 출력 */
	@GetMapping("/notebookRoom")
	public String seatsList(Model model) {
		
		/* 반납 시간 지난 자리 자동 비움 */
		nbService.updateNotebook_RoomTable();
		nbService.updateNotebook_Room_RentalTable();

		List<NoteBookRoomDTO> notebookRoomlist = nbService.seats_list_all();
		model.addAttribute("notebookRoomlist", notebookRoomlist);

		// 세션 id
		String user_id = "id";

		if (nbService.reservation_info(user_id) == null) {

			return "/mylib/sub3/notebookRoom";

		} else {
			NoteBookRoomDTO reservation_info = nbService.reservation_info(user_id);

			Date now = new Date();

			reservation_info.setDiff_time(reservation_info.getReturn_time().getTime() - now.getTime());

			model.addAttribute("reservation_info", reservation_info);
		}

		return "/mylib/sub3/notebookRoom";
	}

	/* 좌석 예약 */
	@GetMapping("/nb_seat_booking")
	public String notebookRoom_booking(NoteBookRoomDTO dto) {

		dto.setUser_id("id");

		nbService.nb_seat_booking(dto);
		nbService.updateStatusOccupied(dto);

		return "redirect:/mylib/notebookRoom";
	}
	
	
	/* 좌석 자리 이동 */
	@GetMapping("/moveSeat")
	public String moveSeat(NoteBookRoomDTO dto, @RequestParam("newSeat_no") int newSeat_no) {
		
		nbService.nb_seat_return(dto);
		nbService.updateStatusVacant(dto);
		
		dto.setUser_id("id3");
		dto.setSeat_no(newSeat_no);
		
		nbService.nb_seat_booking(dto);
		nbService.updateStatusOccupied(dto);
		
		return "redirect:/mylib/notebookRoom";
	}


	/* 좌석 반납&퇴실 */
	@GetMapping("/nb_seat_return")
	public String nb_seat_return(NoteBookRoomDTO dto) {

		nbService.nb_seat_return(dto);
		nbService.updateStatusVacant(dto);

		return "redirect:/mylib/notebookRoom";
	}

	/* 좌석 연장 */
	@GetMapping("/nb_seat_extend")
	public String nb_seat_extend(NoteBookRoomDTO dto) {

		nbService.nb_seat_extend(dto);

		return "redirect:/mylib/notebookRoom";
	}

}
