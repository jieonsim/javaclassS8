package com.spring.javaclassS8.controller.my.memberInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WithdrawalCompletedController {

	// 회원 탈퇴 완료 뷰
	@GetMapping("/withdrawalCompleted")
	public String getWidthdrawalCompleted() {
		return "my/memberInfo/withdrawalCompleted";
	}
}
