package com.spring.javaclassS8.controller.admin.event;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS8.service.admin.AdminEventService;
import com.spring.javaclassS8.vo.event.EventVO;
import com.spring.javaclassS8.vo.member.MemberVO;

@Controller
@RequestMapping("/admin/event")
public class AdminEventController {

	@Autowired
	private AdminEventService adminEventService;

	// 이벤트 업로드 폼
	@GetMapping("/upload")
	public String getUploadEvent(Model model) {
		model.addAttribute("categories", EventVO.EventCategory.values());
		return "admin/event/upload";
	}

	// 이벤트 업로드 처리하기
//	@PostMapping("/upload")
//	@ResponseBody
//	public ResponseEntity<Map<String, Object>> uploadEvent(@ModelAttribute EventVO event,
//	        @RequestParam("thumbnail") MultipartFile thumbnail) {
//	    Map<String, Object> response = new HashMap<>();
//	    try {
//	        adminEventService.uploadEvent(event, thumbnail);
//	        response.put("status", "success");
//	        response.put("message", "이벤트가 성공적으로 업로드되었습니다.");
//	        return ResponseEntity.ok(response);
//	    } catch (Exception e) {
//	        response.put("status", "error");
//	        response.put("message", "이벤트 업로드 중 오류가 발생했습니다: " + e.getMessage());
//	        return ResponseEntity.badRequest().body(response);
//	    }
//	}
//	@PostMapping("/upload")
//	@ResponseBody
//	public Map<String, Object> uploadEvent(@ModelAttribute EventVO event,
//			@RequestParam("thumbnail") MultipartFile thumbnail) {
//
//		Map<String, Object> response = new HashMap<>();
//		try {
//			adminEventService.uploadEvent(event, thumbnail);
//			response.put("status", "success");
//			response.put("message", "이벤트가 성공적으로 업로드되었습니다.");
//		} catch (Exception e) {
//			response.put("status", "error");
//			response.put("message", "이벤트 업로드 중 오류가 발생했습니다." + e.getMessage());
//		}
//
//		return response;
//	}
	
	
	@PostMapping("/upload")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> uploadEvent(@ModelAttribute EventVO event,
            @RequestParam("thumbnail") MultipartFile thumbnail,
            HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            // 세션에서 관리자 ID를 가져옵니다.
            MemberVO adminMember = (MemberVO) session.getAttribute("loginMember");
            if (adminMember == null) {
                throw new Exception("관리자 로그인이 필요합니다.");
            }
            
            // EventVO에 관리자 ID 설정
            event.setAdminId(adminMember.getId());
            
            adminEventService.uploadEvent(event, thumbnail);
            response.put("status", "success");
            response.put("message", "이벤트가 성공적으로 업로드되었습니다.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "이벤트 업로드 중 오류가 발생했습니다: " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        }
    }

	@PostMapping("/imageUpload")
	@ResponseBody
	public Map<String, Object> imageUpload(@RequestParam("upload") MultipartFile file) {
		return adminEventService.uploadImage(file);
	}

}