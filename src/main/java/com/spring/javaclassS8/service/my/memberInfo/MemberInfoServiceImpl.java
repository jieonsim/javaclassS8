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

	// 비밀번호 변경 처리
	@Override
	public String changePassword(int memberId, String oldPassword, String newPassword) {
		MemberVO member = memberDAO.findById(memberId);
		if (member == null) {
			return "USER_NOT_FOUND";
		}
		if (!passwordEncoder.matches(oldPassword, member.getPassword())) {
			return "INCORRECT_OLD_PASSWORD";
		}
		if (oldPassword.equals(newPassword)) {
			return "SAME_PASSWORD";
		}
		String encodedNewPassword = passwordEncoder.encode(newPassword);
		if(memberDAO.updatePassword(memberId, encodedNewPassword) > 0) {
			return "SUCCESS";
		}

		return "UPDATE_FAILED";
	}
}
