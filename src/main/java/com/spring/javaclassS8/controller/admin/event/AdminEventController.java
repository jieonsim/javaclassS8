package com.spring.javaclassS8.controller.admin.event;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/event")
public class AdminEventController {

	// 이벤트 업로드
	@GetMapping("/upload")
	public String eventUpload() {
		return "admin/event/upload";
	}
}