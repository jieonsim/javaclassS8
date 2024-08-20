package com.spring.javaclassS8.service.admin.event;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS8.dao.admin.event.AdminEventDAO;
import com.spring.javaclassS8.dao.event.EventDAO;
import com.spring.javaclassS8.service.admin.reserve.AdminReserveService;
import com.spring.javaclassS8.utils.EventAdvanceTicketEmailService;
import com.spring.javaclassS8.vo.event.EventDrawSummaryVO;
import com.spring.javaclassS8.vo.event.EventVO;
import com.spring.javaclassS8.vo.event.WinnerDetailVO;
import com.spring.javaclassS8.vo.event.WinnerPostVO;
import com.spring.javaclassS8.vo.event.WinnerVO;
import com.spring.javaclassS8.vo.reserve.AdvanceTicketVO;

@Service
public class AdminEventServiceImpl implements AdminEventService {

	@Autowired
	private AdminEventDAO adminEventDAO;

	@Autowired
	private EventDAO eventDAO;

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private AdminReserveService adminReserveService;

	@Autowired
	private EventAdvanceTicketEmailService eventEmailService;

	// 이벤트 업로드 처리
	@Override
	public int insertEvent(EventVO event) {
		return adminEventDAO.insertEvent(event);
	}

	// 이벤트 업로드 컨텐츠 이미지 처리
	public void imgCheck(String content) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/");

		Pattern pattern = Pattern.compile("src=\"/[^\"]+/([^\"]+)\"");
		Matcher matcher = pattern.matcher(content);

		while (matcher.find()) {
			String fileName = matcher.group(1);
			String origFilePath = realPath + "ckeditor/event/" + fileName;
			String copyFilePath = realPath + "event/content/" + fileName;

			fileCopyCheck(origFilePath, copyFilePath);
		}
	}

	// 파일 복사 메소드
	private void fileCopyCheck(String origFilePath, String copyFilePath) {
		try {
			File origFile = new File(origFilePath);
			File copyFile = new File(copyFilePath);

			if (!copyFile.exists()) {
				FileInputStream fis = new FileInputStream(origFile);
				FileOutputStream fos = new FileOutputStream(copyFile);

				byte[] buffer = new byte[1024];
				int length;
				while ((length = fis.read(buffer)) > 0) {
					fos.write(buffer, 0, length);
				}

				fis.close();
				fos.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 썸네일 저장
	@Override
	public String saveThumbnail(MultipartFile file) throws IOException {
		String realPath = servletContext.getRealPath("/resources/data/event/thumbnails/");

		// 원본 파일 이름 가져오기
		String originalFileName = file.getOriginalFilename();

		// 파일 이름과 확장자 분리
		String baseName = FilenameUtils.getBaseName(originalFileName);
		String extension = FilenameUtils.getExtension(originalFileName);

		// 현재 날짜와 시간을 이용하여 파일 이름 생성
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String fileName = sdf.format(date) + "_" + baseName + "." + extension;

		// 파일 저장
		File saveFile = new File(realPath, fileName);
		file.transferTo(saveFile);

		return fileName;
	}

	// 이벤트 수정하기 폼 접속 시 기존 컨텐츠 내 이미지가 존재한다면
	// 현재 폴더(event/content)의 이미지를 ckeditor/event로 복사 처리
	@Override
	public void imgBackup(String content) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/");

		int position = content.indexOf("/data/event/content/");
		while (position != -1) {
			int endPosition = content.indexOf("\"", position);
			if (endPosition == -1)
				break;

			String imgPath = content.substring(position + 6, endPosition); // "/data/" 이후의 경로
			String origFilePath = realPath + imgPath;
			String copyFilePath = realPath + "ckeditor/event/" + imgPath.substring(imgPath.lastIndexOf("/") + 1);

			fileCopyCheck(origFilePath, copyFilePath);

			position = content.indexOf("/data/event/content/", endPosition);
		}
	}

	// 이벤트 컨텐츠 수정 처리
	@Override
	public int updateEvent(EventVO event) throws IOException {
		EventVO originalEvent = eventDAO.getEventById(event.getId());

		// 썸네일 처리
		if (event.getThumbnailFile() != null && !event.getThumbnailFile().isEmpty()) {
			deleteExistingThumbnail(originalEvent.getThumbnail());
			String thumbnailFileName = saveThumbnail(event.getThumbnailFile());
			event.setThumbnail(thumbnailFileName);
		} else {
			event.setThumbnail(originalEvent.getThumbnail());
		}

		// 컨텐츠 처리
		if (event.getContent() != null && !event.getContent().isEmpty()) {
			// 기존 /resources/data/event/content/ 폴더의 그림 삭제
			deleteExistingImages(originalEvent.getContent());

			// 새로운 이미지 처리
			if (event.getContent().indexOf("src=\"/") != -1) {
				event.setContent(event.getContent().replace("/data/event/content/", "/data/ckeditor/event/"));
				imgCheck(event.getContent());
				event.setContent(event.getContent().replace("/data/ckeditor/event/", "/data/event/content/"));
			}
		} else {
			event.setContent(originalEvent.getContent());
		}

		return adminEventDAO.updateEvent(event);
	}

	// 기존 이벤트 컨텐츠 이미지 삭제
	@Override
	public void deleteExistingImages(String content) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/event/content/");

		Pattern pattern = Pattern.compile("src=\"/[^\"]+/([^\"]+)\"");
		Matcher matcher = pattern.matcher(content);

		while (matcher.find()) {
			String fileName = matcher.group(1);
			File file = new File(realPath + fileName);
			if (file.exists()) {
				file.delete();
			}
		}
	}

	// 기존 썸네일 이미지 삭제
	@Override
	public void deleteExistingThumbnail(String thumbnailPath) {
		if (thumbnailPath != null && !thumbnailPath.isEmpty()) {
			String realPath = servletContext.getRealPath("/resources/data/event/thumbnails/");
			File file = new File(realPath + thumbnailPath);
			if (file.exists()) {
				file.delete();
			}
		}
	}

	// 이벤트 리스트 조건 검색
	@Override
	public List<EventVO> filterEvents(String eventCategory, String status, String startDate, String endDate, String keyword) {
		return adminEventDAO.filterEvents(eventCategory, status, startDate, endDate, keyword);
	}

	// 이벤트 참여자 수 가져오기
	@Override
	public int getParticipantCount(int eventId) {
		return adminEventDAO.getParticipantCount(eventId);
	}

	// 이벤트 참여자 중 랜덤 추첨 + 당첨자들 대상으로 예매권 발행하기
	@Override
	@Transactional
	public boolean drawWinners(int eventId, int numOfWinners) {
		List<Integer> participants = adminEventDAO.getActiveParticipants(eventId);
		if (participants.size() < numOfWinners) {
			//return false;
			throw new IllegalArgumentException("참여자 수보다 당첨자 수가 많을 수 없습니다.");
		}

		// 랜덤 추첨
		Collections.shuffle(participants);
		List<Integer> winners = participants.subList(0, numOfWinners);

		// 예매권 발행
		List<AdvanceTicketVO> tickets = adminReserveService.issueAdvanceTickets(numOfWinners);

		for (int i = 0; i < numOfWinners; i++) {
			AdvanceTicketVO ticket = tickets.get(i);
			// 여기서 ticket이 null이 아닌지, 그리고 id가 제대로 설정되어 있는지 확인
			if (ticket == null || ticket.getId() == 0) {
				throw new RuntimeException("Failed to create advance ticket");
			}

			WinnerVO winner = new WinnerVO();
			winner.setEventId(eventId);
			winner.setMemberId(winners.get(i));
			winner.setAdvanceTicketId(ticket.getId());
			adminEventDAO.insertWinner(winner);
		}

		return true;
	}

	// 이벤트 추첨 리스트
	@Override
	public List<EventDrawSummaryVO> getEventDrawSummaries(int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		return adminEventDAO.getEventDrawSummaries(offset, pageSize);
	}

	// 이벤트 당첨자 디테일
	@Override
	public List<WinnerDetailVO> getWinnerDetails(int eventId) {
		return adminEventDAO.getWinnerDetails(eventId);
	}

	// 이벤트 아이디로 이벤트 가져오기
	@Override
	public EventVO getEventById(int eventId) {
		return adminEventDAO.getEventById(eventId);
	}

	// 이벤트 당첨자 발표 포스팅하기
	@Override
	@Transactional
	public boolean createWinnerPost(WinnerPostVO winnerPost) {
	    try {
	        System.out.println("Creating winner post for eventId: " + winnerPost.getEventId() + ", drawAt: " + winnerPost.getDrawAt());
	        adminEventDAO.insertWinnerPost(winnerPost);
	        
	        // String을 Timestamp로 변환
	        Timestamp drawAt = Timestamp.valueOf(winnerPost.getDrawAt().replace('T', ' '));
	        
	        System.out.println("Updating isAnnounced for eventId: " + winnerPost.getEventId() + ", drawAt: " + drawAt);
	        int updatedRows = adminEventDAO.updateWinnerIsAnnounced(winnerPost.getEventId(), drawAt);
	        System.out.println("Updated " + updatedRows + " rows");
	        return updatedRows > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	// 당첨자 대상으로 메일 보내기
	@Override
	@Transactional
	public boolean sendWinnerEmails(int eventId, String drawAt) throws MessagingException {
	    System.out.println("Sending emails for eventId: " + eventId + ", drawAt: " + drawAt);
	    
	    if (drawAt == null || drawAt.isEmpty()) {
	        throw new IllegalArgumentException("drawAt is null or empty");
	    }

	    EventVO event = eventDAO.getEventById(eventId);
	    if (event == null) {
	        throw new IllegalArgumentException("Event not found for id: " + eventId);
	    }

	    Timestamp drawAtTimestamp;
	    try {
	        drawAtTimestamp = Timestamp.valueOf(drawAt.replace('T', ' '));
	    } catch (IllegalArgumentException e) {
	        throw new IllegalArgumentException("Invalid drawAt format: " + drawAt, e);
	    }

	    List<WinnerDetailVO> winners = adminEventDAO.getWinnerDetailsByDrawAt(eventId, drawAtTimestamp);
	    System.out.println("Found " + winners.size() + " winners");

	    if (winners.isEmpty()) {
	        throw new IllegalStateException("No winners found for eventId: " + eventId + " and drawAt: " + drawAt);
	    }

	    for (WinnerDetailVO winner : winners) {
	        try {
	            System.out.println("Sending email to: " + winner.getEmail());
	            eventEmailService.sendAdvanceTicketEmail(winner.getEmail(), event.getTitle(), winner.getAdvanceTicketNumber(), winner.getExpiresAt());
	            adminEventDAO.updateEmailSentAt(winner.getWinnerId());
	        } catch (Exception e) {
	            System.out.println("Error sending email to " + winner.getEmail() + ": " + e.getMessage());
	            e.printStackTrace();
	        }
	    }

	    return true;
	}

	// 이벤트 고유번호와 이벤트 추첨일시로 이벤트 당첨자 디테일 가져오기
	@Override
	public List<WinnerDetailVO> getWinnerDetailsByDrawAt(int eventId, Timestamp drawAt) {
		return adminEventDAO.getWinnerDetailsByDrawAt(eventId, drawAt);
	}

	// 이벤트 고유번호와 이벤트 추첨일시로 이벤트 당첨 발표여부 확인
//	@Override
//	public boolean isEventAnnouncedByDrawAt(int eventId, Timestamp drawAt) {
//		return adminEventDAO.isEventAnnouncedByDrawAt(eventId, drawAt);
//	}

	// 이벤트 전체 리스트 가져오기 
	@Override
	public List<EventVO> getAllEvents(int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		return adminEventDAO.getAllEvents(offset, pageSize);
	}
	
	// 전체 이벤트 개수 가져오기 (페이징)
	@Override
	public int getTotalEventsCount() {
		return adminEventDAO.getTotalEventsCount();
	}
	
	// 전체 이벤트 추첨 개수 가져오기 (페이징)
	@Override
	public int getTotalDrawCount() {
		return adminEventDAO.getTotalDrawCount();
	}
}