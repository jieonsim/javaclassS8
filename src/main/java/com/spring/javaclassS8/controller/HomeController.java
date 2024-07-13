package com.spring.javaclassS8.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomeController {

	// 유저 메인
	@GetMapping("/")
	public String home() {
		return "home";
	}

	// 어드민 메인
	@GetMapping("/admin/main")
	public String adminMain() {
		return "admin/main";
	}

	// 메일 테스트
	@GetMapping("/advanceTicketMail")
	public String advanceTicketMail() {
		return "mail/advanceTicketMail";
	}
	
	// ckeditor 이미지 업로드
	@RequestMapping(value = "/imageUpload")
	public void imageUploadGet(MultipartFile upload, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/ckeditor/");
		String oFileName = upload.getOriginalFilename();

		// 파일명 중복방지를 위한 이름 설정하기(날짜로 분류처리...)
		Date date = new Date();
		// 날짜만 하면 같은 날짜가 있을 수 있기 때문에 시분초까지 추가
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		oFileName = sdf.format(date) + "_" + oFileName;

		FileOutputStream fos = new FileOutputStream(new File(realPath + oFileName));
		fos.write(upload.getBytes());

		PrintWriter out = response.getWriter();
		String fileUrl = request.getContextPath() + "/data/ckeditor/" + oFileName;
		out.println(
				"{\"originalFilename\":\"" + oFileName + "\",\"uploaded\":1,\"url\":\"" + fileUrl + "\"}");

		out.flush();
		fos.close();
	}
}
