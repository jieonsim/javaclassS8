package com.spring.javaclassS8.dao.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.member.AutoLoginTokenVO;
import com.spring.javaclassS8.vo.member.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	// 이메일로 회원 조회
	@Override
	public MemberVO findByEmail(String email) {
		return sqlSession.getMapper(MemberDAO.class).findByEmail(email);
	}

	// 회원 고유번호로 회원 조회
	@Override
	public MemberVO findById(int memberId) {
		return sqlSession.getMapper(MemberDAO.class).findById(memberId);
	}

	// 회원가입
	@Override
	public void insertMember(MemberVO member) {
		sqlSession.getMapper(MemberDAO.class).insertMember(member);
	}

	// 마지막 로그인 일시 업데이트
	@Override
	public void updateLastLoginAt(MemberVO member) {
		sqlSession.getMapper(MemberDAO.class).updateLastLoginAt(member);

	}

	// 자동 로그인 토큰 저장
	@Override
	public void saveAutoLoginToken(AutoLoginTokenVO tokenVO) {
		sqlSession.getMapper(MemberDAO.class).saveAutoLoginToken(tokenVO);

	}

	// 자동 로그인 토큰 삭제
	@Override
	public void deleteAutoLoginToken(String token) {
		sqlSession.getMapper(MemberDAO.class).deleteAutoLoginToken(token);

	}

	// 자동 로그인 토큰 찾기
	@Override
	public AutoLoginTokenVO findAutoLoginToken(String token) {
		return sqlSession.getMapper(MemberDAO.class).findAutoLoginToken(token);
	}

	// 이름 + 휴대폰번호 조합으로 회원 리스트 찾기
	public List<MemberVO> findByNameAndPhone(String name, String phone) {
		return sqlSession.getMapper(MemberDAO.class).findByNameAndPhone(name, phone);
	}

	// 이름 + 이메일 조합으로 회원 정보 찾기
	@Override
	public MemberVO findByNameAndEmail(String name, String email) {
		return sqlSession.getMapper(MemberDAO.class).findByNameAndEmail(name, email);
	}

	// 비밀번호 찾기 - 새로운 비밀번호로 변경
	@Override
	public boolean resetPassword(MemberVO member) {
		return sqlSession.getMapper(MemberDAO.class).resetPassword(member);
	}

	// 마이페이지 회원 정보 변경 처리
	@Override
	public int updateMemberInfo(MemberVO member) {
		return sqlSession.getMapper(MemberDAO.class).updateMemberInfo(member);
	}

	// 마이페이지 비밀번호 변경 처리
	@Override
	public int updatePassword(int memberId, String newPassword) {
		return sqlSession.getMapper(MemberDAO.class).updatePassword(memberId, newPassword);
	}

	// 회원 탈퇴 처리
	@Override
	public boolean updateMemberStatus(int memberId, int status) {
		return sqlSession.getMapper(MemberDAO.class).updateMemberStatus(memberId, status);
	}
}
