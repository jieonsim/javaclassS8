package com.spring.javaclassS8.service.my.memberInfo;

import java.util.Map;

import com.spring.javaclassS8.vo.member.MemberVO;

public interface MemberInfoService {

	// 회원정보수정 비밀번호 확인 처리
	boolean matchPassword(int memberId, String password);

	// 회원정보수정 처리
	boolean updateMemberInfo(MemberVO member);

	// 회원 고유번호로 회원 정보 가져오기
	MemberVO getMemberById(int memberId);

	// 비밀번호 변경 처리
	String changePassword(int id, String oldPassword, String newPassword);

	// memberId로 오늘 날짜로부터 관람일이 경과하지 않은 예매완료 건 가져오기
	Map<String, Object> getAvailableReservationListByMemberId(int memberId);
	
	// 탈퇴 가능여부 체크
	// boolean canWithdraw(int memberId);
	
	// 회원 탈퇴 처리
	boolean withdrawMember(int memberId);

}
