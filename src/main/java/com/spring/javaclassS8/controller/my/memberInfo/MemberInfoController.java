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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.service.my.memberInfo.MemberInfoService;
import com.spring.javaclassS8.vo.member.MemberVO;

@Controller
@RequestMapping("/my/memberInfo")
public class MemberInfoController {

	@Autowired
	private MemberInfoService memberInfoService;

	// 마이페이지 >  회원정보관리 > 회원정보수정 뷰
	@GetMapping("/info")
	public String getMemberInfo(HttpSession session, Model model) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "redirect:/login";
		}
		model.addAttribute("member", loginMember);
		return "my/memberInfo/info";
	}

	// 마이페이지 >  회원정보관리 > 회원정보수정 > 비밀번호 확인 폼
	@GetMapping("/matchPassword")
	public String getMatchPassword() {
		return "my/memberInfo/matchPassword";
	}

	// 마이페이지 >  회원정보관리 > 회원정보수정 > 비밀번호 확인 처리
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

	// 마이페이지 > 회원정보관리 > 회원정보수정 처리 폼
	@GetMapping("/modify")
	public String getModify(HttpSession session, Model model) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "redirect:/login";
		}
		model.addAttribute("member", loginMember);
		return "my/memberInfo/modify";
	}

	// 마이페이지 > 회원정보관리 > 회원정보수정 처리
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

	// 마이페이지 > 회원정보관리 > 회원정보수정 > 비밀번호 변경 폼
	@GetMapping("/changePassword")
	public String getChangePassword() {
		return "my/memberInfo/changePassword";
	}

	// 마이페이지 > 회원정보관리 > 회원정보수정 > 비밀번호 변경 처리
	@PostMapping("/changePassword")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> ChangePassword(@RequestParam String oldPassword, @RequestParam String newPassword, HttpSession session) {

		Map<String, Object> response = new HashMap<>();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");

		if (loginMember == null) {
			response.put("success", false);
			response.put("message", "UNAUTHORIZED");
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
		}

		try {
			String result = memberInfoService.changePassword(loginMember.getId(), oldPassword, newPassword);
			if (result.equals("SUCCESS")) {
				response.put("success", true);
				response.put("message", "비밀번호가 성공적으로 변경되었습니다.");
			} else {
				response.put("success", false);
				response.put("error", result);
			}
		} catch (Exception e) {
			response.put("success", false);
			response.put("error", "SERVER_ERROR");
		}
		return ResponseEntity.ok(response);
	}
	

	// 마이페이지 >  회원정보관리 > 회원탈퇴 뷰
	@GetMapping("/withdrawal")
	public String getWithdrawal(HttpSession session, Model model) {
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "redirect:/login";
		}
		
		// memberId로 오늘 날짜로부터 관람일이 경과하지 않은 예매완료 건 가져오기
		Map<String, Object> result = memberInfoService.getAvailableReservationListByMemberId(loginMember.getId());
		model.addAttribute("reservations", result.get("reservations"));
		return "my/memberInfo/withdrawal";
	}
	
    @PostMapping("/withdraw")
    @ResponseBody
    public ResponseEntity<?> withdraw(HttpSession session) {
        MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
        if (loginMember == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        }
        
        boolean success = memberInfoService.withdrawMember(loginMember.getId());
        if (success) {
            session.invalidate();
        }
        return ResponseEntity.ok(Map.of("success", success));
    }
}
