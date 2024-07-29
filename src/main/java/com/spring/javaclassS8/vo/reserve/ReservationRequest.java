package com.spring.javaclassS8.vo.reserve;

import java.util.List;

import lombok.Data;

@Data
public class ReservationRequest {
	private int memberId;
	private int gameId;
	private int seatId;
	private int totalAmount;
	private int ticketAmount;
	private int bookingFee;
	private List<Integer> advanceTicketIds;
	private List<String> advanceTicketNumbers;
	private List<TicketTypeRequest> ticketTypes;
	private List<SeatInfo> seats;
	
	// 서버에서 설정할 필드들
	private int sportId;
	private int teamId;
	private int venueId;
}
