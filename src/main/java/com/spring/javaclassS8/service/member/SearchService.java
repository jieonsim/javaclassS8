package com.spring.javaclassS8.service.member;

import java.util.Map;

import javax.mail.MessagingException;

public interface SearchService {
	
	// 이름 + 휴대폰 번호 조합으로 이메일 아이디 찾기
	Map<String, Object> findEmailByNameAndPhone(String name, String phone);
	
	// 비밀번호 찾기 - 이름 + 이메일 조합으로 회원 정보 확인 후 인증번호 발송
	Map<String, Object> sendCertification(String name, String email) throws MessagingException;

	// 비밀번호 찾기 - 발송된 인증번호와 입력한 인증번호 일치여부 확인
	Map<String, Object> verifyCertification(String name, String email, String certificationNumber);

	// 비밀번호 찾기 - 비밀번호 재설정 처리
	Map<String, Object> resetPassword(String email, String newPassword);

}
