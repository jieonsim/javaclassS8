package com.spring.javaclassS8.service.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.javaclassS8.dao.admin.AdminDAO;
import com.spring.javaclassS8.vo.event.EventVO;

@Service
public class AdminEventServiceImpl implements AdminEventService {

	@Autowired
	private AdminDAO adminDAO;

	@Value("${file.upload.path}")
	private String fileUploadPath;

	@Override
	public void uploadEvent(EventVO event, MultipartFile thumbnail) throws Exception {
		// 1. 썸네일 이미지 저장
		String thumbnailPath = saveThumbnail(thumbnail);
		event.setThumbnail(thumbnailPath);

		// 2. 컨텐츠 이미지 처리
		String content = processContentImages(event.getContent());
		event.setContent(content);

		// 3. 이벤트 정보 저장
		adminDAO.insertEvent(event);
	}

	@Override
	public Map<String, Object> uploadImage(MultipartFile file) {
		Map<String, Object> result = new HashMap<>();
		try {
			String fileName = file.getOriginalFilename();
			String filePath = fileUploadPath + "/ckeditor/event/" + fileName;
			File dest = new File(filePath);
			file.transferTo(dest);

			result.put("uploaded", 1);
			result.put("fileName", fileName);
			result.put("url", "/data/ckeditor/event/" + fileName);
		} catch (IOException e) {
			result.put("uploaded", 0);
			Map<String, String> errorMap = new HashMap<>();
			errorMap.put("message", "파일 업로드에 실패했습니다.");
			result.put("error", errorMap);
		}
		return result;
	}

	private String saveThumbnail(MultipartFile thumbnail) throws IOException {
		String fileName = thumbnail.getOriginalFilename();
		String filePath = fileUploadPath + "/event/thumbnail/" + fileName;
		File dest = new File(filePath);
		thumbnail.transferTo(dest);
		return "/data/event/thumbnail/" + fileName;
	}

	private String processContentImages(String content) throws IOException {
		Document doc = Jsoup.parse(content);
		Elements imgs = doc.select("img");
		for (Element img : imgs) {
			String src = img.attr("src");
			if (src.startsWith("/data/ckeditor/event/")) {
				String fileName = src.substring(src.lastIndexOf("/") + 1);
				File source = new File(fileUploadPath + "/ckeditor/event/" + fileName);
				File dest = new File(fileUploadPath + "/event/content/" + fileName);
				Files.copy(source.toPath(), dest.toPath(), StandardCopyOption.REPLACE_EXISTING);
				img.attr("src", "/data/event/content/" + fileName);
			}
		}
		return doc.body().html();
	}
}
