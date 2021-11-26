package com.library.controller.intro;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/intro")
public class RoadController {

	@GetMapping("/road")
	public String openingHours() {

		return "/intro/sub3/road";
	}


}
