package com.spring.javaclassS8.controller.member;

import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.service.member.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {

	@Autowired
	SearchService searchService;

	// 이름 + 휴대폰 번호 조합으로 이메일 아이디 찾기
	@GetMapping("/matchEmail")
	public String matchId() {
		return "member/search/matchEmail";
	}

	// 이름 + 휴대폰 번호 조합으로 이메일 아이디 찾기
	@PostMapping("/matchEmail")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> findEmailByNameAndPhone(@RequestParam("name") String name,
			@RequestParam("phone") String phone) {
		Map<String, Object> result = searchService.findEmailByNameAndPhone(name, phone);
		return ResponseEntity.ok(result);
	}

	// 이메일 아이디 찾기 성공 화면
	@GetMapping("/showFoundEmail")
	public String showFoundEmail(Model model, HttpSession session) {
		@SuppressWarnings("unchecked")
		Map<String, Object> result = (Map<String, Object>) session.getAttribute("searchResult");
		if (result != null && (boolean) result.get("exists")) {
			@SuppressWarnings("unchecked")
			List<Map<String, Object>> members = (List<Map<String, Object>>) result.get("members");
			model.addAttribute("members", members);
			return "member/search/showFoundEmail";
		} else {
			// 결과가 없거나 정상적이지 않은 경우, 다른 화면으로 이동하는 등의 처리 필요
			return "redirect:/search/matchEmail";
		}
	}

	// 아이디 찾기 후 선택한 이메일 아이디로 로그인하기
	@PostMapping("/saveSelectedEmail")
	public ResponseEntity<Void> saveSelectedEmail(@RequestParam("selectedEmail") String selectedEmail,
			HttpSession session) {
		session.setAttribute("selectedEmail", selectedEmail);
		return ResponseEntity.ok().build();
	}

	// 비밀번호 찾기 - 이메일 아이디 + 이름으로 회원 정보 확인
	@GetMapping("/matchPassword")
	public String matchPassword() {
		return "member/search/matchPassword";
	}

	// 비밀번호 찾기 - 이메일 아이디 + 이름으로 회원 정보 확인 처리 및 인증 메일 발송
	@PostMapping("/sendPasswordCertification")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> sendPasswordCertification(@RequestBody Map<String, String> request) throws MessagingException {
		String name = request.get("name");
		String email = request.get("email");

		Map<String, Object> response = searchService.sendPasswordCertification(name, email);
		return ResponseEntity.ok(response);
	}
	
	// 비밀번호 찾기 - 인증번호 일치여부 확인
	@PostMapping("/verifyPasswordCertification")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> verifyPasswordCertification(@RequestBody Map<String, String> request) {
		String name = request.get("name");
		String email = request.get("email");
		String certificationNumber = request.get("certificationNumber");
		Map<String, Object> response = searchService.verifyPasswordCertification(name, email, certificationNumber);
		return ResponseEntity.ok(response);
	}

	// 비밀번호 찾기 - 비밀번호 재설정
	@GetMapping("/resetPassword")
	public String resetPassword() {
		return "member/search/resetPassword";
	}
}
