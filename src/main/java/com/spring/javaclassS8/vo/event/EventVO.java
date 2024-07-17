package com.spring.javaclassS8.vo.event;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EventVO {
	private int id;
	private int adminId;
	private EventCategory eventCategory;
	private String title;
	private String content;
	private String thumbnail;
	private String startDate;
	private String endDate;
	private Status status;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private MultipartFile thumbnailFile;

	public enum EventCategory {
		예매권("예매권"), 기타("기타");

		private final String displayName;

		EventCategory(String displayName) {
			this.displayName = displayName;
		}

		public String getDisplayName() {
			return displayName;
		}

		public static EventCategory fromString(String text) {
			for (EventCategory category : EventCategory.values()) {
				if (category.name().equalsIgnoreCase(text) || category.getDisplayName().equals(text)) {
					return category;
				}
			}
			throw new IllegalArgumentException("No constant with text " + text + " found");
		}
	}

	public enum Status {
		ONGOING("진행 중"), ENDED("종료"), UPCOMING("예정");

		private final String displayName;

		Status(String displayName) {
			this.displayName = displayName;
		}

		public String getDisplayName() {
			return displayName;
		}

		public static Status fromString(String text) {
			for (Status status : Status.values()) {
				if (status.name().equalsIgnoreCase(text)) {
					return status;
				}
			}
			throw new IllegalArgumentException("No constant with text " + text + " found");
		}
	}
}
