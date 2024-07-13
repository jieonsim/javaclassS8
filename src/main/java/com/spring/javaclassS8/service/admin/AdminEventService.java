package com.spring.javaclassS8.service.admin;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS8.vo.event.EventVO;

public interface AdminEventService {

	// 이벤트 업로드
	void uploadEvent(EventVO event, MultipartFile thumbnail) throws Exception;

	// 이벤트 업로드 시 사진 처리
	Map<String, Object> uploadImage(MultipartFile file);
}
