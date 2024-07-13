package com.spring.javaclassS8.service.admin;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS8.vo.event.EventVO;

public interface AdminEventService {
	
	// 이벤트 업로드
	int insertEvent(EventVO event);

	// 이벤트 업로드 컨텐츠 이미지 처리
	void imgCheck(String content);

	// 이벤트 업로드 썸네일 저장
	String saveThumbnail(MultipartFile thumbnailFile) throws IOException;
}
