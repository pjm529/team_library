package com.library.controller.intro;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/intro")
public class IntroController {

	@GetMapping("/history")
	public String openingHours() {

		return "/intro/sub2/history";
	}


}
