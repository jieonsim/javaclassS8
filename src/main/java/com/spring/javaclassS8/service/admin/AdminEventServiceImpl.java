package com.spring.javaclassS8.service.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS8.dao.admin.AdminDAO;
import com.spring.javaclassS8.dao.event.EventDAO;
import com.spring.javaclassS8.vo.event.EventVO;

@Service
public class AdminEventServiceImpl implements AdminEventService {

	@Autowired
	private AdminDAO adminDAO;

	@Autowired
	private EventDAO eventDAO;

	@Autowired
	private ServletContext servletContext;

	// 이벤트 업로드 처리
	@Override
	public int insertEvent(EventVO event) {
		return adminDAO.insertEvent(event);
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

		return adminDAO.updateEvent(event);
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
}