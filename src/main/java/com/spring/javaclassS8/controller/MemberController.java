package com.spring.javaclassS8.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

	// 디폴트 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "member/login/login";
	}

	// 디폴트 로그인2 (뷰 테스트)
	@RequestMapping(value = "/login2", method = RequestMethod.GET)
	public String login2() {
		return "member/login/login2";
	}

	// 회원가입 선택
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup() {
		return "member/signup/signup";
	}

	// 회원가입 약관동의
	@RequestMapping(value = "/signup/agreement", method = RequestMethod.GET)
	public String signupAgreement() {
		return "member/signup/agreement";
	}

	// 회원가입 폼
	@RequestMapping(value = "/signup/form", method = RequestMethod.GET)
	public String signupForm() {
		return "member/signup/form";
	}
	
	// 회원가입 성공
	@RequestMapping(value = "/signup/completed", method = RequestMethod.GET)
	public String signupCompleted() {
		return "member/signup/completed";
	}
}
