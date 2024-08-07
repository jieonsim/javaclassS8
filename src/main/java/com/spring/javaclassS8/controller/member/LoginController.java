package com.spring.javaclassS8.controller.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.spring.javaclassS8.vo.member.MemberVO;

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

	// 자동로그인 처리를 위한 로그인 상태 확인
	@GetMapping("/checkLoginStatus")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> checkLoginStatus(HttpServletRequest request, HttpSession session) {
	    Map<String, Object> response = new HashMap<>();
	    MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
	    if (loginMember != null) {
	        response.put("isLoggedIn", true);
	        response.put("email", loginMember.getEmail());
	        response.put("role", loginMember.getRole());
	        
	        // 자동로그인 성공 여부 확인
	        Boolean autoLoginSuccess = (Boolean) request.getAttribute("autoLoginSuccess");
	        if(autoLoginSuccess != null && autoLoginSuccess) {
	        	response.put("autoLoginSuccess", true);
	        }
	    } else {
	        response.put("isLoggedIn", false);
	    }
	    return ResponseEntity.ok(response);
	}
	
	// 로그인 인터셉터 처리를 위한 로그인 상태 확인
	@GetMapping("/checkLogin")
	@ResponseBody
	public Map<String, Boolean> checkLogin(HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		Map<String, Boolean> response = new HashMap<>();
		response.put("loggedIn", member != null);
		return response;
	}
}