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
	public List<MemberVO> getAllMembers(int offset, int pageSize) {
		return sqlSession.getMapper(AdminMemberDAO.class).getAllMembers(offset, pageSize);
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
	
	// 회원 조건 검색
	@Override
	public List<MemberVO> searchMembers(String keyword, Integer status, String role) {
		return sqlSession.getMapper(AdminMemberDAO.class).searchMembers(keyword, status, role);
	}
	
	// 전체 회원 수 가져오기(페이징)
	@Override
	public int getTotalMembersCount() {
		return sqlSession.getMapper(AdminMemberDAO.class).getTotalMembersCount();
	}

}
