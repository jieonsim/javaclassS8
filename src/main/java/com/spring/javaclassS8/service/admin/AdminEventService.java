package com.spring.javaclassS8.service.admin;

import com.spring.javaclassS8.vo.event.EventVO;

public interface AdminEventService {

	void imgCheck(String content);

	int insertEvent(EventVO event);


}
