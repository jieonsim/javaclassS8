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

	public List<MemberVO> findByNameAndPhone(String name, String phone) {
		return sqlSession.getMapper(MemberDAO.class).findByNameAndPhone(name, phone);
	}
}
