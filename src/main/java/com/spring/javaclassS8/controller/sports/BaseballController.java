package com.spring.javaclassS8.controller.sports;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BaseballController {
	
	// 야구 메인
	@RequestMapping(value = "/sports/baseball", method = RequestMethod.GET)
	public String baseball(Model model) {
		model.addAttribute("currentPage", "baseball");
		
		return "sports/baseball/main";
	}
}
