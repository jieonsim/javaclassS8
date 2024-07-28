package com.spring.javaclassS8.vo.reserve;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class ReservationResponse {
    private boolean success;
    private String reservationNumber;
    private String message;
    private List<Map<String, Object>> seatDetails;
    private int totalAmount;
    private int bookingFee;

    // 기본 생성자
    public ReservationResponse() {}

    // 모든 필드를 초기화하는 생성자
    public ReservationResponse(boolean success, String reservationNumber, String message, 
                               List<Map<String, Object>> seatDetails, int totalAmount, int bookingFee) {
        this.success = success;
        this.reservationNumber = reservationNumber;
        this.message = message;
        this.seatDetails = seatDetails;
        this.totalAmount = totalAmount;
        this.bookingFee = bookingFee;
    }

    // success, reservationNumber, message만을 받는 생성자
    public ReservationResponse(boolean success, String reservationNumber, String message) {
        this(success, reservationNumber, message, null, 0, 0);
    }

    // reservationNumber와 message만을 받는 생성자 (success는 false로 설정)
    public ReservationResponse(String reservationNumber, String message) {
        this(false, reservationNumber, message);
    }
}