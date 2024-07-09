package com.spring.javaclassS8.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	// 어드민 메인
	@RequestMapping(value = "/admin/main", method = RequestMethod.GET)
	public String admin() {
		return "admin/main";
	}
}
