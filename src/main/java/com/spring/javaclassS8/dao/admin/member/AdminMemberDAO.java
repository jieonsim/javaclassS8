package com.spring.javaclassS8.dao.admin.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS8.vo.member.MemberVO;

public interface AdminMemberDAO {

	// 회원 리스트 - 모든 회원 정보 가져오기
	List<MemberVO> getAllMembers();

	// 회원 활동 상태 변경
	void updateMembersStatus(@Param("memberIds") List<Integer> memberIds, @Param("status") Integer status);

	// 회원 등급 변경
	void updateMembersRole(@Param("memberIds") List<Integer> memberIds, @Param("role") String role);
	
	List<MemberVO> searchMembers(@Param("keyword") String keyword, @Param("status") Integer status, @Param("role") String role);

}
