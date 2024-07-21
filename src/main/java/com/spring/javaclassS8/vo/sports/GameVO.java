package com.spring.javaclassS8.vo.sports;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class GameVO {
	private int id;
	private int sportId;
	private int homeTeamId;
	private int awayTeamId;
	private int venueId;
	/* @DateTimeFormat(pattern = "yyyy-MM-dd") */
	/* @JsonFormat(pattern = "yyyy-MM-dd") */
	/* private LocalDate gameDate; */
	private String gameDate;
	/* @DateTimeFormat(pattern = "HH:mm") */
	/* @JsonFormat(pattern = "HH:mm:ss") */
	/* private LocalTime gameTime; */
	private String gameTime;
	private Status status;
	private Timestamp createdAt;
	private Timestamp updatedAt;

	// 추가 필드
	private String sportName;
	private String homeTeamName;
	private String homeTeamShortName;
	private String awayTeamName;
	private String awayTeamShortName;
	private String venueName;

	// 새로 추가한 필드
	private int bookingOpenDaysBefore;
	private int bookingCloseMinutesAfterStart;

	public enum Status {
		판매예정, 판매중, 판매종료
	}

    // bookingOpenMinutesBefore를 계산하는 메서드
    public long getBookingOpenMinutesBefore() {
        return (long) bookingOpenDaysBefore * 24 * 60; // 일 단위를 분 단위로 변환
    }
}
