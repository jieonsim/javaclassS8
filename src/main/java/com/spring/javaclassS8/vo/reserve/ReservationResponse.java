package com.spring.javaclassS8.vo.reserve;

import java.util.List;
import lombok.Data;

@Data
public class ReservationResponse {
    private boolean success;
    private Integer reservationId;
    private String reservationNumber;
    private String message;
    private List<SeatDetailVO> seatDetails;
    private int totalAmount;
    private int bookingFee;

    public ReservationResponse(boolean success, Integer reservationId, String reservationNumber, String message) {
        this.success = success;
        this.reservationId = reservationId;
        this.reservationNumber = reservationNumber;
        this.message = message;
    }

    public ReservationResponse(Integer reservationId, String reservationNumber, String message) {
        this(true, reservationId, reservationNumber, message);
    }
}