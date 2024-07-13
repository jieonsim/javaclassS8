package com.spring.javaclassS8.controller.admin.event;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.javaclassS8.service.admin.AdminEventService;
import com.spring.javaclassS8.vo.event.EventVO;
import com.spring.javaclassS8.vo.event.EventVO.EventCategory;

@Controller
@RequestMapping("/admin/event")
public class AdminEventController {

	@Autowired
	private AdminEventService adminEventService;

	@GetMapping("/upload")
	public String showUploadForm(Model model) {
		model.addAttribute("categories", EventCategory.values());
		return "admin/event/upload";
	}

	@PostMapping("/upload")
	public String uploadEvent(EventVO event) {
		// 1.만약 content에 이미지가 저장되어 있다면, 저장된 이미지만 골라서 event폴더에 따로
		// 보관시켜준다.('/data/ckeditor'폴더에서 '/data/board'폴더로 복사처리)
		if (event.getContent().indexOf("src=\"/") != -1) {
			adminEventService.imgCheck(event.getContent());
		}

		// 2.이미지 작업(복사작업)을 모두 마치면, ckeditor폴더경로를 board폴더 경로로 변경처리한다.
		event.setContent(event.getContent().replace("/data/ckeditor/", "/data/event/"));

		// 3.content안의 그림에 대한 정리와 내용정리가 끝나면 변경된 내용을 vo에 담은후 DB에 저장한다.
		int res = adminEventService.insertEvent(event);

		if (res != 0) {
			return "redirect:/admin/main";
		}
		return "redirect:/event/main";
	}
}