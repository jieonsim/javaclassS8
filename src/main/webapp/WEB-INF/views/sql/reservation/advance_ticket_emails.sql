
/* 예매권 메일 발송 테이블*/
CREATE TABLE advance_ticket_emails (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '메일 발송 고유번호',
    advanceTicketId INT NOT NULL COMMENT '예매권 고유번호',
    recipientEmail VARCHAR(255) NOT NULL COMMENT '예매권 수신자 이메일',
    recipientMemberId INT NULL COMMENT '예매권 수신자 회원 고유번호',
    status ENUM('SENT', 'FAILED', 'PENDING') NOT NULL DEFAULT 'PENDING' COMMENT '메일 발송 상태',
    retryCount INT NOT NULL DEFAULT 0 COMMENT '메일 발송 재시도 횟수',
    sentAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '메일 발송 일시',
    lastAttemptAt TIMESTAMP NULL COMMENT '마지막 발송 시도 일시',
    emailContent TEXT COMMENT '발송된 이메일 내용',
    FOREIGN KEY (advanceTicketId) REFERENCES advance_tickets(id),
    FOREIGN KEY (recipientMemberId) REFERENCES members(id),
    INDEX idx_advanceTicketId (advanceTicketId),
    INDEX idx_recipientEmail (recipientEmail),
    INDEX idx_sentAt (sentAt)
);