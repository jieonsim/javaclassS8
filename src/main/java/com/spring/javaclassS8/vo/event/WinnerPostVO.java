package com.spring.javaclassS8.vo.event;

import java.sql.Timestamp;

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
}
