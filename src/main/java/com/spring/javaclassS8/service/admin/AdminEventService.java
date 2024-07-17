package com.spring.javaclassS8.service.admin;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS8.vo.event.EventVO;

public interface AdminEventService {

	// 이벤트 업로드
	int insertEvent(EventVO event);

	// 이벤트 업로드 컨텐츠 이미지 처리
	void imgCheck(String content);

	// 이벤트 업로드 썸네일 저장
	String saveThumbnail(MultipartFile thumbnailFile) throws IOException;

	// 이벤트 수정하기 폼 접속 시 기존 컨텐츠 내 이미지가 존재한다면
	// 현재 폴더(event/content)의 이미지를 ckeditor/event로 복사 처리
	void imgBackup(String content);

	// 이벤트 컨텐츠 수정 처리
	int updateEvent(EventVO event) throws IOException;

	// 기존 이벤트 컨텐츠의 이미지 삭제
	void deleteExistingImages(String content);
	
	// 기존 썸네일 이미지 삭제
	void deleteExistingThumbnail(String thumbnailPath);
	
	// 이벤트 리스트 조건 검색
	List<EventVO> filterEvents(String eventCategory, String status, String startDate, String endDate, String keyword);
}
