package com.spring.javaclassS8.controller.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.service.member.LoginService;
import com.spring.javaclassS8.vo.member.LoginRequest;
import com.spring.javaclassS8.vo.member.LoginResult;

@Controller
public class LoginController {
	@Autowired
	LoginService loginService;

	// 로그인 폼
	@GetMapping("/login")
	public String getLoginForm(Model model, HttpSession session) {
		String selectedEmail = (String) session.getAttribute("selectedEmail");
		if (selectedEmail != null) {
			model.addAttribute("selectedEmail", selectedEmail);
		}
		return "member/login/login";
	}

	// 로그인 처리
	@PostMapping("/login")
	@ResponseBody
	public LoginResult login(@RequestBody LoginRequest loginRequest, HttpServletRequest request,
			HttpServletResponse response) {
		LoginResult result = loginService.login(loginRequest, request, response);
		if (result.isSuccess()) {
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", result.getMember());
			System.out.println("로그인 성공: " + result.getMember());
			
			// 로그인 성공 후 selectedEmail 세션 삭제
			session.removeAttribute("selectedEmail");
		}
		return result;
	}

	// 로그아웃
	@GetMapping("/logout")
	@ResponseBody
	public ResponseEntity<Map<String, String>> logout(HttpServletRequest request, HttpServletResponse response) {
	    loginService.logout(request, response);
	    Map<String, String> result = new HashMap<>();
	    result.put("message", "로그아웃 성공");
	    return ResponseEntity.ok(result);
	}

	// 자동 로그인
	@GetMapping("/autoLogin")
	@ResponseBody
	public ResponseEntity<LoginResult> autoLogin(HttpServletRequest request, HttpServletResponse response) {
		try {
			LoginResult result = loginService.autoLogin(request, response);
			if (result.isSuccess()) {
				HttpSession session = request.getSession();
				session.setAttribute("loginMember", result.getMember());
			}
			return ResponseEntity.ok(result);
		} catch (Exception e) {
			e.printStackTrace(); // 로그를 출력
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body(new LoginResult(false, "자동 로그인 처리 중 오류가 발생했습니다."));
		}
	}
}
