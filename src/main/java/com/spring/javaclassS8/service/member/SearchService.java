package com.spring.javaclassS8.service.member;

import java.util.Map;

public interface SearchService {
	
	// 이름 + 휴대폰 번호 조합으로 이메일 아이디 찾기
	Map<String, Object> findEmailByNameAndPhone(String name, String phone);



}
