package com.spring.javaclassS8.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.javaclassS8.vo.member.LoginRequest;
import com.spring.javaclassS8.vo.member.LoginResult;

public interface LoginService {

	// 로그인
	LoginResult login(LoginRequest loginRequest, HttpServletRequest request, HttpServletResponse response);

	// 로그아웃
	void logout(HttpServletRequest request, HttpServletResponse response);

	// 자동 로그인
	LoginResult autoLogin(HttpServletRequest request, HttpServletResponse response);
}
