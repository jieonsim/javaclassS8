package com.spring.javaclassS8.service.member;

import java.util.Map;

import javax.mail.MessagingException;

import com.spring.javaclassS8.vo.member.MemberVO;

public interface SignupService {

	// 이메일 아이디 유무 및 탈퇴여부 확인
	public Map<String, Object> checkEmail(String email);

	// 인증번호 메일 발송
	public String sendCertification(String email) throws MessagingException;

	// 인증번호 일치여부 확인
	public boolean verifyCertification(String email, String certificationNumber);

	// 회원가입 처리
	public boolean registerMember(MemberVO member);

}
