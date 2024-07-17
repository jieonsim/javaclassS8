
/* 예매권 메일 발송 테이블*/
CREATE TABLE advance_ticket_emails (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '메일 발송 고유번호',
    advanceTicketId INT NOT NULL COMMENT '예매권 고유번호',
    adminId INT NOT NULL COMMENT '메일 발송한 관리자 고유번호',
    recipientEmail VARCHAR(255) NOT NULL COMMENT '예매권 수신자 이메일',
    recipientMemberId INT NULL COMMENT '예매권 수신자 회원 고유번호',
    sentAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '메일 발송 일시',
    FOREIGN KEY (advanceTicketId) REFERENCES advance_tickets(id),
    FOREIGN KEY (adminId) REFERENCES members(id),
    FOREIGN KEY (recipientMemberId) REFERENCES members(id)
);