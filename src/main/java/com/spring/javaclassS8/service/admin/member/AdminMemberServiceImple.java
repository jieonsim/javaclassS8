package com.spring.javaclassS8.service.admin.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.javaclassS8.dao.admin.member.AdminMemberDAO;
import com.spring.javaclassS8.vo.member.MemberUpdateRequest;
import com.spring.javaclassS8.vo.member.MemberVO;

@Service
public class AdminMemberServiceImple implements AdminMemberService {

	@Autowired
	private AdminMemberDAO adminMemberDAO;
	
	// 회원 리스트 - 모든 회원 정보 가져오기
	@Override
	public List<MemberVO> getAllMembers() {
		return adminMemberDAO.getAllMembers();
	}
	
	// 회원 정보(회원 등급 / 활동 상태 ) 업데이트
    @Override
    @Transactional
    public boolean updateMembers(MemberUpdateRequest request) {
        try {
        	// 회원 활동 상태 변경
            if (request.getStatus() != null) {
                adminMemberDAO.updateMembersStatus(request.getMemberIds(), request.getStatus());
            }
            // 회원 등급 변경
            if (request.getRole() != null) {
                adminMemberDAO.updateMembersRole(request.getMemberIds(), request.getRole());
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 회원 리스트에서 검색 기능
    @Override
    public List<MemberVO> searchMembers(String keyword, Integer status, String role) {
        return adminMemberDAO.searchMembers(keyword, status, role);
    }
}
