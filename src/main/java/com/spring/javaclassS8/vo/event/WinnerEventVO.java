package com.spring.javaclassS8.vo.event;

import lombok.Data;

@Data
public class WinnerEventVO {
    private int winnerPostId;
    private String eventCategory;
    private String title;
    private String startDate;
    private String endDate;
}
