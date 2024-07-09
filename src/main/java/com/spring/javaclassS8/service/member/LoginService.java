package com.spring.javaclassS8.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.spring.javaclassS8.vo.member.LoginRequest;
import com.spring.javaclassS8.vo.member.LoginResult;

public interface LoginService {

	LoginResult login(LoginRequest loginRequest, HttpServletRequest request, HttpServletResponse response);

	void logout(HttpServletRequest request, HttpServletResponse response);

	LoginResult autoLogin(HttpServletRequest request, HttpServletResponse response);
}
