package com.spring.javaclassS8.service.my.memberInfo;

import com.spring.javaclassS8.vo.member.MemberVO;

public interface MemberInfoService {

	// 회원정보수정 비밀번호 확인 처리
	boolean matchPassword(int memberId, String password);

	//회원정보수정 처리
	boolean updateMemberInfo(MemberVO member);

	// 회원 고유번호로 회원 정보 가져오기
	MemberVO getMemberById(int memberId);

}
