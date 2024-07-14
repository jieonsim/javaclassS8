package com.spring.javaclassS8.dao.event;

import java.util.List;

import com.spring.javaclassS8.vo.event.EventVO;

public interface EventDAO {
	
	// 전체 이벤트 목록 가져오기
	public List<EventVO> getAllEvents();

	// 이벤트 아이디로 이벤트 데이터 가져오기
	public EventVO getEventId(int id);
}
