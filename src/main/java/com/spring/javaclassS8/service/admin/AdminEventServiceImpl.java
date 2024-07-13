package com.spring.javaclassS8.service.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS8.dao.admin.AdminDAO;
import com.spring.javaclassS8.vo.event.EventVO;
import com.spring.javaclassS8.vo.event.EventVO.EventCategory;

@Service
public class AdminEventServiceImpl implements AdminEventService {

	@Autowired
	private AdminDAO adminDAO;
	
	@Autowired
	private ServletContext servletContext;

	// 이벤트 업로드 처리
	@Override
	public int insertEvent(EventVO event) {
		// eventCategory 처리
		if (event.getEventCategory() == null) {
			event.setEventCategory(EventCategory.예매권); // 기본값 설정
		}
		return adminDAO.insertEvent(event);
	}

	
	// 이벤트 업로드 컨텐츠 이미지 처리
	@Override
	public void imgCheck(String content) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/");

		// src="/javaclassS/data/ckeditor/event/240626093722_5.jpg"
		// s에서 0부터 시작 / event의 e: 37 
		int position = 37;
		String nextImg = content.substring(content.indexOf("src=\"/") + position);
		boolean sw = true;

		while (sw) {
			String imgFile = nextImg.substring(0, nextImg.indexOf("\""));

			String origFilePath = realPath + "ckeditor/event" + imgFile;
			String copyFilePath = realPath + "event/content/" + imgFile;

			fileCopyCheck(origFilePath, copyFilePath);

			if (nextImg.indexOf("src=\"/") == -1)
				sw = false;
			else
				nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
		}
	}

	// data/ckeditor/event > data/event/content로 이미지 파일 복사 처리
	private void fileCopyCheck(String origFilePath, String copyFilePath) {
		try {
			FileInputStream fis = new FileInputStream(new File(origFilePath));
			FileOutputStream fos = new FileOutputStream(new File(copyFilePath));

			byte[] b = new byte[2048];
			int cnt = 0;
			while ((cnt = fis.read(b)) != -1) {
				fos.write(b, 0, cnt);
			}
			fos.flush();
			fos.close();
			fis.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 썸네일 저장
	@Override
	public String saveThumbnail(MultipartFile file) throws IOException {
		String realPath = servletContext.getRealPath("/resources/data/event/thumbnails/");
		String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

		File saveFile = new File(realPath, fileName);
		file.transferTo(saveFile);

		return fileName;
	}

}