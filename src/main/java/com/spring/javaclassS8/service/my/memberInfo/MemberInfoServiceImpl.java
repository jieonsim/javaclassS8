package com.spring.javaclassS8.service.my.memberInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.dao.member.MemberDAO;
import com.spring.javaclassS8.vo.member.MemberVO;

@Service
public class MemberInfoServiceImpl implements MemberInfoService {

	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	// 회원정보수정 비밀번호 확인 처리
	@Override
	public boolean matchPassword(int memberId, String password) {
		MemberVO member = memberDAO.findById(memberId);
		return passwordEncoder.matches(password, member.getPassword());
	}

	// 회원정보수정 처리
	@Override
	public boolean updateMemberInfo(MemberVO member) {
		return memberDAO.updateMemberInfo(member) > 0;
	}

	// 회원 고유번호로 회원 정보 조회
	@Override
	public MemberVO getMemberById(int memberId) {
		return memberDAO.findById(memberId);
	}

}
