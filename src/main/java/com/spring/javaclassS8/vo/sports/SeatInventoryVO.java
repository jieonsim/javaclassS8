package com.spring.javaclassS8.vo.sports;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SeatInventoryVO {
    private int id;
    private int gameId;
    private int seatId;
    private int totalCapacity;
    private int availableCapacity;
    private Timestamp lastUpdated;
    
    private String seatName;
    private String seatColor;
}
