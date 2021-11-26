package com.library.controller.mylib;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.library.model.search.BookDTO;
import com.library.service.mylib.HopeService;

@Controller
@RequestMapping("/mylib")
public class HopeController {

	@Autowired
	private HopeService hopeService;
	
	@GetMapping("/hope")
	public String hopeGET(Model model) {

		System.out.println("도서신청 폼 진입");

		return "/mylib/sub2/hope";

	}
	
	@PostMapping("/hope")
	public String hopePOST(BookDTO book, Principal principal) {
		
		System.out.println("도서신청 post");
		book.setUser_id(principal.getName());
		
		hopeService.insert_hope(book);
		
		return "redirect:/mylib/hope";
	}
}
