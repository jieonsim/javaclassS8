package com.spring.javaclassS8.service.admin.event;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS8.vo.event.EventDrawSummaryVO;
import com.spring.javaclassS8.vo.event.EventVO;
import com.spring.javaclassS8.vo.event.WinnerDetailVO;
import com.spring.javaclassS8.vo.event.WinnerPostVO;

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

	// 이벤트 참여자 수 가져오기
	int getParticipantCount(int eventId);

	// 이벤트 참여자 중 랜덤 추첨
	boolean drawWinners(int eventId, int numOfWinners);

	// 이벤트 추첨 리스트
	List<EventDrawSummaryVO> getEventDrawSummaries(int page, int pageSize);

	// 이벤트 당첨자 디테일
	List<WinnerDetailVO> getWinnerDetails(int eventId);

	// 이벤트 아이디로 이벤트 정보 가져오기
	EventVO getEventById(int eventId);

	// 이벤트 당첨자 발표 포스팅하기
	boolean createWinnerPost(WinnerPostVO winnerPost);

	// 이벤트 당첨자 대상으로 당첨 안내 및 예매권 번호 메일 발송
	boolean sendWinnerEmails(int eventId, String drawAt) throws MessagingException;

	// 이벤트 고유번호와 이벤트 추첨일시로 이벤트 당첨자 디테일 가져오기
	List<WinnerDetailVO> getWinnerDetailsByDrawAt(int eventId, Timestamp drawAt);

	// 이벤트 고유번호와 이벤트 추첨일시로 이벤트 당첨 발표여부 확인
	// boolean isEventAnnouncedByDrawAt(int eventId, Timestamp drawAt);

	// 전체 이벤트 가져오기
	List<EventVO> getAllEvents(int page, int pageSize);
	
	// 전체 이벤트 개수 가져오기 (페이징)
	int getTotalEventsCount();
	
	// 전체 이벤트 추첨 개수 가져오기 (페이징)
	int getTotalDrawCount();
}
