package com.spring.javaclassS8.service.member;

import java.sql.Timestamp;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.dao.member.MemberDAO;
import com.spring.javaclassS8.vo.member.AutoLoginTokenVO;
import com.spring.javaclassS8.vo.member.LoginRequest;
import com.spring.javaclassS8.vo.member.LoginResult;
import com.spring.javaclassS8.vo.member.MemberVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	// 로그인 처리
	@Override
	public LoginResult login(LoginRequest loginRequest, HttpServletRequest request, HttpServletResponse response) {
		MemberVO member = memberDAO.findByEmail(loginRequest.getEmail());
		if (member != null && passwordEncoder.matches(loginRequest.getPassword(), member.getPassword())) {
			if(member.getStatus() != 1) {
				return new LoginResult(false, "현재 로그인할 수 없는 계정입니다.");
			}
			member.setLastLoginAt(new Timestamp(System.currentTimeMillis()));
			memberDAO.updateLastLoginAt(member);

			if (loginRequest.isSaveSession()) {
				createAndSaveAutoLoginToken(member, response);
			}
			return new LoginResult(true, "로그인 성공", member);
		}
		return new LoginResult(false, "아이디 또는 비밀번호가 맞지 않아요. 다시 확인해 주세요.");
	}

	// 로그아웃
	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("autoLoginToken".equals(cookie.getName())) {
					memberDAO.deleteAutoLoginToken(cookie.getValue());
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
					break;
				}
			}
		}
		request.getSession().invalidate();
	}

	// 자동 로그인 처리
	@Override
	public LoginResult autoLogin(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("autoLoginToken".equals(cookie.getName())) {
					AutoLoginTokenVO tokenVO = memberDAO.findAutoLoginToken(cookie.getValue());
					if (tokenVO != null && tokenVO.getExpiresAt().after(new Timestamp(System.currentTimeMillis()))) {
						MemberVO member = memberDAO.findById(tokenVO.getMemberId());
						if (member != null && member.getStatus() == 1) {
							member.setLastLoginAt(new Timestamp(System.currentTimeMillis()));
							memberDAO.updateLastLoginAt(member);

							// 기존 토큰 삭제 후 새 토큰 생성
							memberDAO.deleteAutoLoginToken(cookie.getValue());
							createAndSaveAutoLoginToken(member, response);

							return new LoginResult(true, "자동 로그인 성공", member);
						}
					}
					// 토큰이 유효하지 않으면 삭제
					memberDAO.deleteAutoLoginToken(cookie.getValue());
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
					break;
				}
			}
		}
		return new LoginResult(false, "자동 로그인 실패");
	}

	// 자동 로그인 생성 및 저장
	private void createAndSaveAutoLoginToken(MemberVO member, HttpServletResponse response) {
		String token = UUID.randomUUID().toString();
		AutoLoginTokenVO tokenVO = new AutoLoginTokenVO();
		tokenVO.setMemberId(member.getId());
		tokenVO.setToken(token);
		tokenVO.setExpiresAt(new Timestamp(System.currentTimeMillis() + (30L * 24 * 60 * 60 * 1000))); // 30일
		tokenVO.setCreatedAt(new Timestamp(System.currentTimeMillis()));
		memberDAO.saveAutoLoginToken(tokenVO);

		Cookie cookie = new Cookie("autoLoginToken", token);
		cookie.setMaxAge(30 * 24 * 60 * 60); // 30일
		cookie.setPath("/");
		response.addCookie(cookie);

		// HttpOnly 속성 수동 설정
		response.setHeader("Set-Cookie",
				"autoLoginToken=" + token + "; HttpOnly; Max-Age=" + (30 * 24 * 60 * 60) + "; Path=/");
	}
}
