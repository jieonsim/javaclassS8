package com.spring.javaclassS8.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	// 어드민 메인
	@GetMapping("/admin/main")
	public String adminMain() {
		
		return "admin/main";
	}
}
