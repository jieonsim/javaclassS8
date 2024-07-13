package com.spring.javaclassS8.controller.admin.event;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS8.service.admin.AdminEventService;
import com.spring.javaclassS8.vo.event.EventVO;
import com.spring.javaclassS8.vo.event.EventVO.EventCategory;
import com.spring.javaclassS8.vo.member.MemberVO;

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
	
	// 이벤트 업로드 시 ckeditor 이미지 업로드 처리
	@RequestMapping(value = "/imageUpload")
	public void imageUploadGet(MultipartFile upload, HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/ckeditor/event/");
		String oFileName = upload.getOriginalFilename();

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		oFileName = sdf.format(date) + "_" + oFileName;

		FileOutputStream fos = new FileOutputStream(new File(realPath + oFileName));
		fos.write(upload.getBytes());

		PrintWriter out = response.getWriter();
		String fileUrl = request.getContextPath() + "/data/ckeditor/event/" + oFileName;
		out.println("{\"originalFilename\":\"" + oFileName + "\",\"uploaded\":1,\"url\":\"" + fileUrl + "\"}");

		out.flush();
		fos.close();
	}
	
	// 이벤트 업로드 처리
	@PostMapping("/upload")
	@ResponseBody
	public ResponseEntity<?> uploadEvent(@ModelAttribute EventVO event, HttpSession session) {
		try {
			MemberVO admin = (MemberVO) session.getAttribute("loginMember");
			if (admin == null) {
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Collections.singletonMap("error", "로그인이 필요합니다."));
			}
			event.setAdminId(admin.getId());

			// 썸네일 처리
			if (event.getThumbnailFile() != null && !event.getThumbnailFile().isEmpty()) {
			    String thumbnailFileName = adminEventService.saveThumbnail(event.getThumbnailFile());
			    event.setThumbnail(thumbnailFileName);
			}
			
			// 컨텐츠 이미지 처리
			if (event.getContent().indexOf("src=\"/") != -1) {
				adminEventService.imgCheck(event.getContent());
			}
			event.setContent(event.getContent().replace("/data/ckeditor/", "/data/event/content"));

			int res = adminEventService.insertEvent(event);

			if (res != 0) {
				return ResponseEntity.ok(Collections.singletonMap("message", "이벤트가 성공적으로 업로드되었습니다."));
			} else {
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.singletonMap("error", "이벤트 업로드에 실패했습니다."));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.singletonMap("error", "이벤트 업로드 중 오류가 발생했습니다: " + e.getMessage()));
		}
	}
}