package com.spring.javaclassS8.service.my.memberInfo;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.javaclassS8.dao.member.MemberDAO;
import com.spring.javaclassS8.dao.reserve.ReservationDAO;
import com.spring.javaclassS8.vo.member.MemberVO;
import com.spring.javaclassS8.vo.reserve.ReservationVO;

@Service
public class MemberInfoServiceImpl implements MemberInfoService {

	@Autowired
	private MemberDAO memberDAO;

	@Autowired
	private ReservationDAO reservationDAO;

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
		if (memberDAO.updatePassword(memberId, encodedNewPassword) > 0) {
			return "SUCCESS";
		}

		return "UPDATE_FAILED";
	}

	// memberId로 오늘 날짜로부터 관람일이 경과하지 않은 예매완료 건 가져오기
	@Override
	public Map<String, Object> getAvailableReservationListByMemberId(int memberId) {

		List<ReservationVO> reservations = reservationDAO.getAvailableReservationListByMemberId(memberId);

		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy.MM.dd(E)");
		DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");

		for (ReservationVO reservation : reservations) {
			if (reservation.getGameDate() != null) {
				LocalDate date = LocalDate.parse(reservation.getGameDate());
				reservation.setGameDate(date.format(dateFormatter));
			}

			if (reservation.getGameTime() != null) {
				LocalTime time = LocalTime.parse(reservation.getGameTime());
				reservation.setGameTime(time.format(timeFormatter));
			}
		}

		Map<String, Object> result = new HashMap<>();
		result.put("reservations", reservations);

		return result;
	}

	// 회원 탈퇴 처리
	@Override
	@Transactional
	public boolean withdrawMember(int memberId) {
		return memberDAO.updateMemberStatus(memberId, 3);
	}
}
