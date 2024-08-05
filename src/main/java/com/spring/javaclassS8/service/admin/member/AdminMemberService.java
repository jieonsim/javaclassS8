package com.spring.javaclassS8.service.admin.member;

import java.util.List;

import com.spring.javaclassS8.vo.member.MemberUpdateRequest;
import com.spring.javaclassS8.vo.member.MemberVO;

public interface AdminMemberService {
	
	// 회원 리스트 - 모든 회원 정보 가져오기
	List<MemberVO> getAllMembers(int page, int pageSize);
	
	// 회원 정보(회원 등급 / 활동 상태 ) 업데이트
	boolean updateMembers(MemberUpdateRequest request);
	
	// 회원 리스트에서 검색 처리
	List<MemberVO> searchMembers(String keyword, Integer status, String role);
	
	// 전체 회원 수 가져오기(페이징)
	int getTotalMembersCount();

}
