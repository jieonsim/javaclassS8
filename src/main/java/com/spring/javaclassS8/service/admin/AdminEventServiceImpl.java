package com.spring.javaclassS8.service.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.spring.javaclassS8.dao.admin.AdminDAO;
import com.spring.javaclassS8.vo.event.EventVO;

@Service
public class AdminEventServiceImpl implements AdminEventService {

	@Autowired
	private AdminDAO adminDAO;

	// content에 이미지가 있다면 이미지를 'ckeditor'폴더에서 'event'폴더로 복사처리한다.
	@Override
	public void imgCheck(String content) {
		//                0         1         2         3
		//                01234567890123456789012345678901234567890
		// <p><img alt="" src="/javaclassS/data/ckeditor/240626093722_5.jpg" style="height:433px; width:700px" /></p>

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/");

		int position = 31;
		String nextImg = content.substring(content.indexOf("src=\"/") + position);
		boolean sw = true;

		while (sw) {
			String imgFile = nextImg.substring(0, nextImg.indexOf("\""));

			String origFilePath = realPath + "ckeditor/" + imgFile;
			String copyFilePath = realPath + "event/" + imgFile;

			fileCopyCheck(origFilePath, copyFilePath); // ckeditor폴더의 그림파일을 event폴더위치로 복사처리하는 메소드.

			if (nextImg.indexOf("src=\"/") == -1)
				sw = false;
			else
				nextImg = nextImg.substring(nextImg.indexOf("src=\"/") + position);
		}
	}

	// 파일 복사처리
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

		@Override
		public int insertEvent(EventVO event) {
			return adminDAO.insertEvent(event);
		}

}