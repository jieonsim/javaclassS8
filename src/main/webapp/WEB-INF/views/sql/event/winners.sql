show tables;

/* 이벤트 당첨자 */
CREATE TABLE winners (
    id INT NOT NULL AUTO_INCREMENT COMMENT '이벤트 당첨 고유번호',
    eventId INT NOT NULL COMMENT '이벤트 고유번호',
    memberId INT NOT NULL COMMENT '당첨자 회원 고유번호',
    advanceTicketId INT NOT NULL COMMENT '예매권 고유번호',
    ticketSentStatus ENUM('PENDING', 'SENT', 'FAILED') NOT NULL DEFAULT 'PENDING' COMMENT '예매권 발송 상태',
    isAnnounced BOOLEAN NOT NULL DEFAULT FALSE COMMENT '당첨자 발표 여부',
    drawAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '당첨자 추첨 일시',
    emailSentAt TIMESTAMP NULL COMMENT '예매권 이메일 발송 일시',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '레코드 생성 일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '레코드 수정 일시',
    PRIMARY KEY (id),
    FOREIGN KEY (eventId) REFERENCES events(id),
    FOREIGN KEY (memberId) REFERENCES members(id),
    FOREIGN KEY (advanceTicketId) REFERENCES advance_tickets(id),
    INDEX idx_event_member (eventId, memberId)
);

DESC winners;