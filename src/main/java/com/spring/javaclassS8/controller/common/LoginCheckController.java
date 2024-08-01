package com.spring.javaclassS8.controller.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.vo.member.MemberVO;

@Controller
public class LoginCheckController {
	
	@GetMapping("/checkLogin")
	@ResponseBody
	public Map<String, Boolean> checkLogin(HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		Map<String, Boolean> response = new HashMap<>();
		response.put("loggedIn", member != null);
		return response;
	}
}
