package com.spring.javaclassS8.controller.member;

import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.service.member.SignupService;
import com.spring.javaclassS8.vo.member.MemberVO;

@Controller
@RequestMapping("/signup")
public class SignupController {
	@Autowired
	SignupService signupService;
	
	// 회원가입 선택
	@GetMapping("/choice")
	public String signupChoice() {
		return "member/signup/choice";
	}

	// 회원가입 약관동의
	@GetMapping("/agreement")
	public String signupAgreement() {
		return "member/signup/agreement";
	}

	// 회원가입 폼
	@GetMapping("/form")
	public String getSignupForm() {
		return "member/signup/form";
	}

	// 회원가입 처리 (ajax 호출 : member/signup/form.js)
	@PostMapping("/form")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> postSignup(@ModelAttribute MemberVO member) {
		Map<String, Object> response = new HashMap<>();
		try {
			boolean result = signupService.registerMember(member);
			response.put("success", result);
		} catch (Exception e) {
			e.printStackTrace(); // 에러 로그 출력.
			response.put("success", false);
		}
		return ResponseEntity.ok(response);
	}

	// 회원가입 성공
	@GetMapping("/complete")
	public String getSignupCompleted() {
		return "member/signup/complete";
	}

	// 이메일 아이디 유무 및 탈퇴여부 확인 (ajax 호출 : member/signup/form.js)
	@PostMapping("/checkEmail")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> checkEmail(@RequestParam String email) {
		Map<String, Object> response = signupService.checkEmail(email);
		return ResponseEntity.ok(response);
	}

	// 인증번호 메일 발송 (ajax 호출 : member/signup/form.js)
	@PostMapping("/sendCertification")
	@ResponseBody
	public ResponseEntity<String> sendCertification(@RequestParam String email) throws MessagingException {
		String certificationNumber = signupService.sendCertification(email);
		return ResponseEntity.ok(certificationNumber);
	}

	// 인증번호 일치여부 확인 (ajax 호출 : member/signup/form.js)
	@PostMapping("/verifyCertification")
	@ResponseBody
	public ResponseEntity<Boolean> verifyCertification(@RequestParam String email, @RequestParam String certificationNumber) {
		boolean isValid = signupService.verifyCertification(email, certificationNumber);
		return ResponseEntity.ok(isValid);
	}
}
