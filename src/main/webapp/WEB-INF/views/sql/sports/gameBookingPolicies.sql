
/* 경기별 예매 정책 (팀 정책과 다를 경우에만 사용) */
CREATE TABLE gameBookingPolicies (
    id INT NOT NULL AUTO_INCREMENT COMMENT '정책 고유번호',
    gameId INT NOT NULL COMMENT '게임 고유번호',
    bookingOpenDaysBefore INT NOT NULL COMMENT '예매 오픈일',
    bookingOpenTime TIME NOT NULL COMMENT '예매 오픈 시간',
    bookingCloseMinutesBeforeStart INT NOT NULL COMMENT '예매 마감 시간(분)',
    cancellationDeadlineMinutesBeforeStart INT NOT NULL COMMENT '취소 가능 시간(분)',
    maxBookingCount INT NOT NULL COMMENT '최대 예매 가능 횟수',
    maxTicketsPerBooking INT NOT NULL COMMENT '1회 예매 시 최대 구매 가능 티켓 수',
    maxTotalTickets INT NOT NULL COMMENT '경기당 총 구매 가능 티켓 수',
    bookingFeePerTicket DECIMAL(10,2) NOT NULL DEFAULT '1000' COMMENT '예매수수료',
    cancellationFeeRate DECIMAL(5,2) NOT NULL DEFAULT '10' COMMENT '취소수수료',
    cancellationDeadlineHours INT NOT NULL DEFAULT '24' COMMENT '전액 환불 기한',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '정책 생성 일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '정책 수정 일시',
    PRIMARY KEY (id),
    FOREIGN KEY (gameId) REFERENCES games(id),
    UNIQUE KEY (gameId)
);