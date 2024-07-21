package com.spring.javaclassS8.controller.my.memberInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/my/memberInfo")
public class MemberInfoController {

	// 마이페이지 회원정보수정
	@GetMapping("/info")
	public String getMemberInfo() {
		return "my/memberInfo/info";
	}
}
