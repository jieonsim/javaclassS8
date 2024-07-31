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
	private String gameDate;
	private String gameTime;
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
	private String bookingOpenTime;
	
    // 추가
    private String formattedGameDate; // "yyyy.MM.dd(E)" 형식의 경기 날짜
    private String formattedGameTime; // "HH:mm" 형식의 경기 시간
    private String openDate; // "yyyy.MM.dd(E)" 형식의 예매 오픈 날짜
    private String openTime; // "HH:mm" 형식의 예매 오픈 시간
    private boolean OpenForBooking; // 현재 예매 가능 여부
    
    // bookingOpenMinutesBefore를 계산하는 메서드
    public long getBookingOpenMinutesBefore() {
        return (long) bookingOpenDaysBefore * 24 * 60; // 일 단위를 분 단위로 변환
    }
}
