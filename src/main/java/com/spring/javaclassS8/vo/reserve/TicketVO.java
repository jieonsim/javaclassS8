package com.spring.javaclassS8.vo.reserve;

import lombok.Data;

@Data
public class TicketVO {
    private String type;
    private int quantity;
    private int price;
    private int ticketTypeId;
    
    // 추가
    private String seatBlock;
    private String seatRow;
    private String seatNumber;
}
