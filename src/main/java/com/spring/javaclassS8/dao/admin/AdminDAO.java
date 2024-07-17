package com.spring.javaclassS8.dao.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.javaclassS8.vo.admin.AdvanceTicketVO;
import com.spring.javaclassS8.vo.event.EventVO;

public interface AdminDAO {

	// 예매권 발행하기 처리
	void insertAdvanceTicket(AdvanceTicketVO ticket);

	// 이벤트 업로드 처리
	int insertEvent(EventVO event);

	// 이벤트 컨텐츠 수정 처리
	int updateEvent(EventVO event);

	// 이벤트 리스트 조건 검색
	List<EventVO> filterEvents(@Param("eventCategory") String eventCategory, @Param("status") String status, @Param("startDate") String startDate, @Param("endDate") String endDate,
			@Param("keyword") String keyword);
}
