package com.spring.javaclassS8.controller.my.memberInfo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.service.my.memberInfo.MemberInfoService;
import com.spring.javaclassS8.vo.member.MemberVO;

@Controller
@RequestMapping("/my/memberInfo")
public class MemberInfoController {

	@Autowired
	private MemberInfoService memberInfoService;

	// 마이페이지 회원정보수정의 회원정보 뷰
	@GetMapping("/info")
	public String getMemberInfo(HttpSession session, Model model) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "redirect:/login";
		}
		model.addAttribute("member", loginMember);
		return "my/memberInfo/info";
	}

	// 회원정보수정 비밀번호 확인 폼
	@GetMapping("/matchPassword")
	public String getMatchPassword() {
		return "my/memberInfo/matchPassword";
	}

	// 회원정보수정 비밀번호 확인 처리
	@PostMapping("/matchPassword")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> matchPassword(@RequestBody Map<String, String> payload, HttpSession session) {
		String password = payload.get("password");
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		boolean isMatch = memberInfoService.matchPassword(loginMember.getId(), password);

		Map<String, Object> response = new HashMap<>();
		response.put("success", isMatch);

		return ResponseEntity.ok(response);
	}

	// 회원정보수정 폼
	@GetMapping("/modify")
	public String getModify(HttpSession session, Model model) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "redirect:/login";
		}
		model.addAttribute("member", loginMember);
		return "my/memberInfo/modify";
	}

	// 회원정보수정 처리
	@PostMapping("/modify")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> modifyMemberInfo(@ModelAttribute MemberVO member, HttpSession session) {
		Map<String, Object> response = new HashMap<>();

		try {
			MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
			if (loginMember == null) {
				response.put("success", false);
				response.put("message", "로그인이 필요합니다.");
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
			}

			member.setId(loginMember.getId());
			boolean result = memberInfoService.updateMemberInfo(member);

			if (result) {
				// 세션 정보 업데이트
				MemberVO updatedMember = memberInfoService.getMemberById(loginMember.getId());
				session.setAttribute("loginMember", updatedMember);

				response.put("success", true);
				response.put("message", "회원 정보가 성공적으로 수정되었습니다.");
			} else {
				response.put("success", false);
				response.put("message", "회원 정보 수정에 실패했습니다.");
			}
		} catch (Exception e) {
			response.put("success", false);
			response.put("message", "오류가 발생했습니다: " + e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
		return ResponseEntity.ok(response);
	}

	// 비밀번호 변경 폼
	@GetMapping("/changePassword")
	public String getChangePassword() {
		return "my/memberInfo/changePassword";
	}
}
