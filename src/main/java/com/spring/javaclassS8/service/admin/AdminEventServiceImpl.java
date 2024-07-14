package com.spring.javaclassS8.service.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS8.dao.admin.AdminDAO;
import com.spring.javaclassS8.vo.event.EventVO;

@Service
public class AdminEventServiceImpl implements AdminEventService {

	@Autowired
	private AdminDAO adminDAO;

	@Autowired
	private ServletContext servletContext;

	// 이벤트 업로드 처리
	@Override
	public int insertEvent(EventVO event) {
		return adminDAO.insertEvent(event);
	}

	// 이벤트 업로드 컨텐츠 이미지 처리
	@Override
	public void imgCheck(String content) {
	    HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
	    String realPath = request.getSession().getServletContext().getRealPath("/resources/data/");

	    int startIndex = 0;
	    while (true) {
	        int srcIndex = content.indexOf("src=\"/", startIndex);
	        if (srcIndex == -1) break; // 더 이상 이미지가 없으면 종료

	        int pathStartIndex = content.indexOf("/data/", srcIndex);
	        int pathEndIndex = content.indexOf("\"", pathStartIndex);
	        
	        if (pathStartIndex == -1 || pathEndIndex == -1) break; // 올바른 경로를 찾지 못하면 종료

	        String imgPath = content.substring(pathStartIndex + 6, pathEndIndex); // "/data/" 이후의 경로
	        
	        String origFilePath = realPath + imgPath;
	        String copyFilePath = realPath + "event/content/" + imgPath.substring(imgPath.lastIndexOf("/") + 1);

	        fileCopyCheck(origFilePath, copyFilePath);

	        startIndex = pathEndIndex; // 다음 검색을 위해 인덱스 업데이트
	    }
	}

	// data/ckeditor/event 에서 data/event/content로 이미지 파일 복사 처리
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
//		String realPath = servletContext.getRealPath("/resources/data/event/thumbnails/");
//		String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
//
//		File saveFile = new File(realPath, fileName);
//		file.transferTo(saveFile);

		String realPath = servletContext.getRealPath("/resources/data/event/thumbnails/");

		// 현재 날짜와 시간을 이용하여 파일 이름 생성
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String fileName = sdf.format(date) + "_" + file.getOriginalFilename();

		// 파일 저장
		File saveFile = new File(realPath, fileName);
		file.transferTo(saveFile);

		return fileName;
	}

}