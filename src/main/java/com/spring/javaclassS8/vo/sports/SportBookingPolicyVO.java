package com.spring.javaclassS8.vo.sports;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SportBookingPolicyVO {
	private int id;
	private int sportId;
	private int bookingOpenDaysBefore;
	private String bookingOpenTime;
	private int bookingCloseMinutesAfterStart;
	private int cancellationDeadlineMinutesBeforeStart;
	private int maxTicketsPerBooking;
	private int maxTotalTickets;
	private int bookingFeePerTicket;
	private int cancellationFeeRate;
	private boolean fullRefundUntilMidnight;
	private Timestamp createdAt;
	private Timestamp updatedAt;
}
