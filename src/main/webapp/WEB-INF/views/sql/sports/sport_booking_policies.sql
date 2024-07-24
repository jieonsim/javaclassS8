
/* 스포츠별 예매 정책 */
CREATE TABLE sport_booking_policies (
    id INT NOT NULL AUTO_INCREMENT COMMENT '정책 고유번호',
    sportId INT NOT NULL COMMENT '스포츠 고유번호',
    bookingOpenDaysBefore INT NOT NULL DEFAULT 7 COMMENT '예매 오픈일',
    bookingOpenTime TIME NOT NULL DEFAULT '11:00:00' COMMENT '예매 오픈 시간',
    bookingCloseMinutesAfterStart INT NOT NULL DEFAULT 60 COMMENT '예매 마감 시간(경기 시작 후 분)',
    cancellationDeadlineMinutesBeforeStart INT NOT NULL DEFAULT 120 COMMENT '취소 가능 시간(경기 시작 전 분)',
    maxTicketsPerBooking INT NOT NULL DEFAULT 8 COMMENT '1회 예매 시 최대 구매 가능 티켓 수',
    maxTotalTickets INT NOT NULL DEFAULT 16 COMMENT '경기당 총 구매 가능 티켓 수',
    bookingFeePerTicket DECIMAL(10,2) NOT NULL DEFAULT 1000 COMMENT '예매수수료',
    cancellationFeeRate DECIMAL(5,2) NOT NULL DEFAULT 10 COMMENT '취소수수료',
    fullRefundUntilMidnight BOOLEAN NOT NULL DEFAULT TRUE COMMENT '예매 당일 자정까지 전액 환불 가능 여부',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '정책 생성 일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '정책 수정 일시',
    PRIMARY KEY (id),
    FOREIGN KEY (sportId) REFERENCES sports(id),
    UNIQUE KEY (sportId)
);
