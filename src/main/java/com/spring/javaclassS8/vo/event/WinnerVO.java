package com.spring.javaclassS8.vo.event;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class WinnerVO {
	private int id;
	private int eventId;
	private int memberId;
	private int advanceTicketId;
	private TicketSentStatus ticketSentStatus;
	private boolean isAnnounced;
	private Timestamp drawAt;
	private Timestamp emailSentAt;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	
	private int numOfWinners;

	public enum TicketSentStatus {
		PENDING("발송 전"), SENT("발송 완료"), FAILED("발송 실패");

		private final String displayName;

		TicketSentStatus(String displayName) {
			this.displayName = displayName;
		}

		public String getDisplayName() {
			return displayName;
		}

		public static TicketSentStatus fromString(String text) {
			for (TicketSentStatus ticketSentStatu : TicketSentStatus.values()) {
				if (ticketSentStatu.name().equalsIgnoreCase(text) || ticketSentStatu.getDisplayName().equals(text)) {
					return ticketSentStatu;
				}
			}
			throw new IllegalArgumentException("No constant with text " + text + " found");
		}
	}

}
