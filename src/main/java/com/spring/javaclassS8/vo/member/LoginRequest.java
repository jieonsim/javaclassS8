package com.spring.javaclassS8.vo.member;

import lombok.Data;

@Data
public class LoginRequest {
	private String email;
	private String password;
	private boolean saveSession;
}
