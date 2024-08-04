
/* 예매권 등록*/
CREATE TABLE registered_advance_tickets (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '등록 고유번호',
    memberId INT NOT NULL COMMENT '예매권 등록한 회원 고유번호',
    advanceTicketId INT NOT NULL COMMENT '예매권 고유번호',
    registeredAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '예매권 등록일시',
    FOREIGN KEY (memberId) REFERENCES members(id),d
    FOREIGN KEY (advanceTicketId) REFERENCES advance_tickets(id),
    UNIQUE KEY (advanceTicketId)
);

desc registered_advance_tickets;
 Field           Type      Null Key Default           Extra
 --------------- --------- ---- --- ----------------- --------------
 id              int(11)   NO   PRI NULL              auto_increment
 memberId        int(11)   NO   MUL NULL              
 advanceTicketId int(11)   NO   UNI NULL              
 registeredAt    timestamp NO       CURRENT_TIMESTAMP 

