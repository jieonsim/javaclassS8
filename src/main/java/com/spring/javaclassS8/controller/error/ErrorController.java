package com.spring.javaclassS8.controller.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorController {
	
	// 일반적인 에러 페이지
	@GetMapping("/common")
	public String commonError() {
		return "error/common";
	}
	
	// 예매 시 세션 만료 에러
	@GetMapping("/reserve")
	public String reserveError() {
		return "error/reserve";
	}

	// 어드민 권한없음 에러 페이지
	@GetMapping("/accessDenied")
	public String accessDenied() {
		return "error/accessDenied";
	}
	
	// 404 에러 페이지
	@GetMapping("/404")
	public String error404() {
		return "error/404";
	}
	
	// 405 에러 페이지
	@GetMapping("/405")
	public String error405() {
		return "error/405";
	}
	
	// 500 에러 페이지
	@GetMapping("/500")
	public String error500() {
		return "error/500";
	}
}
