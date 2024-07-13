package com.spring.javaclassS8.vo.event;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class EventVO {
	private int id;
	private int adminId;
	private EventCategory eventCategory;
	private String title;
	private String content;
	private String thumbnail;
	private Timestamp startDate;
	private Timestamp endDate;
	private Status status;
	private Timestamp createdAt;
	private Timestamp updatedAt;

	public enum EventCategory {
		예매권("예매권"), 기타("기타");

		private final String displayName;

		EventCategory(String displayName) {
			this.displayName = displayName;
		}

		public String getDisplayName() {
			return displayName;
		}
	}

	public enum Status {
		ONGOING("진행중"), ENDED("종료"), UPCOMING("예정");

		private final String displayName;

		Status(String displayName) {
			this.displayName = displayName;
		}

		public String getDisplayName() {
			return displayName;
		}
	}
}
