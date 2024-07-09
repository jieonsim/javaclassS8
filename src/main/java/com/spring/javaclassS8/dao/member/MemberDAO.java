package com.spring.javaclassS8.dao.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS8.vo.member.AutoLoginTokenVO;
import com.spring.javaclassS8.vo.member.MemberVO;

public interface MemberDAO {

	// 이메일로 회원 조회
	public MemberVO findByEmail(String email);

	// 회원 고유번호로 회원 조회
	public MemberVO findById(int memberId);
	
	// 회원 가입
	public void insertMember(MemberVO member);

	// 마지막 로그인 일시 업데이트
	void updateLastLoginAt(MemberVO member);

	// 자동 로그인 토큰 저장
	void saveAutoLoginToken(AutoLoginTokenVO tokenVO);

	// 자동 로그인 토큰 삭제
	void deleteAutoLoginToken(String token);

	// 자동 로그인 토큰 조회
	AutoLoginTokenVO findAutoLoginToken(String token);

	// 이름 + 휴대폰 번호 조합으로 이메일 아이디 찾기
	public List<MemberVO> findByNameAndPhone(String name, String phone);

	// 이름 + 이메일 조합으로 회원 정보 찾기
	public MemberVO findByNameAndEmail(@Param("name") String name, @Param("email") String email);

	// 비밀번호 찾기 - 비밀번호 재설정 처리
	public boolean updatePassword(MemberVO member);
}
