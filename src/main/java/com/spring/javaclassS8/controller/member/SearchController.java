package com.spring.javaclassS8.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/search")
public class SearchController {
	// 아이디 찾기 - 이름 + 휴대폰번호 조합으로 찾기
	@RequestMapping(value = "/matchId", method = RequestMethod.GET)
	public String matchId() {
		return "member/search/matchId";
	}

	// 아이디 찾기 성공
	@RequestMapping(value = "/showFoundId", method = RequestMethod.GET)
	public String showFoundId() {
		return "member/search/showFoundId";
	}

	// 비밀번호 찾기 - 이메일 아이디 확인
	@RequestMapping(value = "/checkId", method = RequestMethod.GET)
	public String checkId() {
		return "member/search/checkId";
	}

	// 비밀번호 찾기 - 이메일 아이디 + 이름으로 찾기 및 인증번호 받기
	@RequestMapping(value = "/matchPassword", method = RequestMethod.GET)
	public String matchPassword() {
		return "member/search/matchPassword";
	}

	// 비밀번호 찾기 - 비밀번호 재설정
	@RequestMapping(value = "/search/resetPassword", method = RequestMethod.GET)
	public String resetPassword() {
		return "member/search/resetPassword";
	}
}
