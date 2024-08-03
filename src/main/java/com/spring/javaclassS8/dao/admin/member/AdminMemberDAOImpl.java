package com.spring.javaclassS8.dao.admin.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.member.MemberVO;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO {

	@Autowired
	private SqlSession sqlSession;

	// 회원 리스트 - 모든 회원 정보 가져오기
	@Override
	public List<MemberVO> getAllMembers() {
		return sqlSession.getMapper(AdminMemberDAO.class).getAllMembers();
	}

	// 회원 활동 상태 변경
	@Override
	public void updateMembersStatus(List<Integer> memberIds, Integer status) {
		sqlSession.getMapper(AdminMemberDAO.class).updateMembersStatus(memberIds, status);
	}

	// 회원 등급 변경
	@Override
	public void updateMembersRole(List<Integer> memberIds, String role) {
		sqlSession.getMapper(AdminMemberDAO.class).updateMembersRole(memberIds, role);
	}

	@Override
	public List<MemberVO> searchMembers(String keyword, Integer status, String role) {
		return sqlSession.getMapper(AdminMemberDAO.class).searchMembers(keyword, status, role);
	}
	
}
