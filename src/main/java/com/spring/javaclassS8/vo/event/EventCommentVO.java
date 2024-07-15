package com.spring.javaclassS8.vo.event;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class EventCommentVO {
	private int id;
	private int eventId;
	private int memberId;
	private String comment;
	private Status status;
	private Timestamp createdAt;
	private Timestamp updatedAt;

	private String email; // 이벤트 컨텐츠 디테일 페이지에 email 뿌리기 위해 추가
	
	public enum Status {
		ACTIVE, DELETED
	}
}
