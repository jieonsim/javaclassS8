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

//	public enum Status {
//		ACTIVE("active"), DELETED("deleted");
//
//	    private final String displayName;
//
//	    Status(String displayName) {
//	        this.displayName = displayName;
//	    }
//
//	    public String getDisplayName() {
//	        return displayName;
//	    }
//
//	    public static Status fromString(String text) {
//	        for (Status status : Status.values()) {
//	            if (status.name().equalsIgnoreCase(text)) {
//	                return status;
//	            }
//	        }
//	        throw new IllegalArgumentException("No constant with text " + text + " found");
//	    }
//	}
}
