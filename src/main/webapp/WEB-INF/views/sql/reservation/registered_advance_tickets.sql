
/* 예매권 등록*/
CREATE TABLE registered_advance_tickets (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '등록 고유번호',
    memberId INT NOT NULL COMMENT '예매권 등록한 회원 고유번호',
    advanceTicketId INT NOT NULL COMMENT '예매권 고유번호',
    registeredAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '예매권 등록일시',
    FOREIGN KEY (memberId) REFERENCES members(id),
    FOREIGN KEY (advanceTicketId) REFERENCES advance_tickets(id),
    UNIQUE KEY (advanceTicketId)
);