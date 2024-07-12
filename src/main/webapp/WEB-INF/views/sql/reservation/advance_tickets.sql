/* 예매권 */
CREATE TABLE advance_tickets (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '예매권 고유번호',
    adminId INT NOT NULL COMMENT '예매권 생성한 관리자 고유번호',
    advanceTicketNumber VARCHAR(16) NOT NULL COMMENT '예매권 번호',
    used BOOLEAN DEFAULT FALSE COMMENT '예매권 사용 여부',
    expiresAt TIMESTAMP NOT NULL COMMENT '예매권 만료일시',
    issuedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '예매권 발행일시',
    usedAt TIMESTAMP NULL COMMENT '예매권 사용일시',
    usedByMemberId INT NULL COMMENT '예매권 사용한 회원 고유번호',
    FOREIGN KEY (adminId) REFERENCES members(id),
    FOREIGN KEY (usedByMemberId) REFERENCES members(id),
    UNIQUE KEY (advanceTicketNumber)
);
