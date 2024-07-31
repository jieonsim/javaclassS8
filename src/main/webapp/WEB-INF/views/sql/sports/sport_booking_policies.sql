
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

desc sport_booking_policies;
 Field                                  Type          Null Key Default           Extra
 -------------------------------------- ------------- ---- --- ----------------- ---------------------------
 id                                     int(11)       NO   PRI NULL              auto_increment
 sportId                                int(11)       NO   UNI NULL              
 bookingOpenDaysBefore                  int(11)       NO       7                 
 bookingOpenTime                        time          NO       11:00:00          
 bookingCloseMinutesAfterStart          int(11)       NO       60                
 cancellationDeadlineMinutesBeforeStart int(11)       NO       120               
 maxTicketsPerBooking                   int(11)       NO       8                 
 maxTotalTickets                        int(11)       NO       16                
 bookingFeePerTicket                    decimal(10,2) NO       1000.00           
 cancellationFeeRate                    decimal(5,2)  NO       10.00             
 fullRefundUntilMidnight                tinyint(1)    NO       1                 
 createdAt                              timestamp     NO       CURRENT_TIMESTAMP 
 updatedAt                              timestamp     NO       CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
select * from sport_booking_policies;
