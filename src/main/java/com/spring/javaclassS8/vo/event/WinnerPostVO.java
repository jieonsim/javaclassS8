package com.spring.javaclassS8.vo.event;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class WinnerPostVO {
	private int id;
	private int eventId;
	private int adminId;
	private String title;
	private String content;
	private boolean isPublished;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private Timestamp publishedAt;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd'T'HH:mm:ss.S", timezone = "Asia/Seoul")
    private String drawAt;
}
