package com.spring.javaclassS8.controller.admin.event;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.javaclassS8.service.admin.AdminEventService;
import com.spring.javaclassS8.vo.event.EventVO;

@Controller
@RequestMapping("/admin/event")
public class AdminEventController {

	@Autowired
	private AdminEventService adminEventService;
	
	// 이벤트 업로드 폼
	@GetMapping("/upload")
	public String eventUpload(Model model) {
		model.addAttribute("categories", EventVO.EventCategory.values());
		return "admin/event/upload";
	}
	
}