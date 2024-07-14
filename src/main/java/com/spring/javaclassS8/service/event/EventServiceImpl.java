package com.spring.javaclassS8.service.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.dao.event.EventDAO;
import com.spring.javaclassS8.vo.event.EventVO;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventDAO eventDAO;

	// 전체 이벤트 목록 가져오기
	@Override
	public List<EventVO> getAllEvents() {
		return eventDAO.getAllEvents();
	}

	// 이벤트 아이디로 이벤트 데이터 가져오기
	@Override
	public EventVO getEventId(int id) {
		return eventDAO.getEventId(id);
	}
}
