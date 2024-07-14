package com.spring.javaclassS8.dao.event;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.event.EventVO;

@Repository
public class EventDAOImpl implements EventDAO {

	@Autowired
	private SqlSession sqlSession;

	// 이벤트 전체 목록 가져오기
	@Override
	public List<EventVO> getAllEvents() {
		return sqlSession.getMapper(EventDAO.class).getAllEvents();
	}

	// 이벤트 아이디로 이벤트 데이터 가져오기
	@Override
	public EventVO getEventId(int id) {
		return sqlSession.getMapper(EventDAO.class).getEventId(id);
	}
}
