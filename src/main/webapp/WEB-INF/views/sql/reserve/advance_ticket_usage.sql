
/* 예매권 사용하여 예매된 티켓 */
CREATE TABLE advance_ticket_usage (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '예매권 사용 고유번호',
    reservationId INT NOT NULL COMMENT '예매 고유번호',
    advanceTicketId INT NOT NULL COMMENT '예매권 고유번호',
    usedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '사용 일시',
    FOREIGN KEY (reservationId) REFERENCES reservations(id),
    FOREIGN KEY (advanceTicketId) REFERENCES advance_tickets(id)
);

desc advance_ticket_usage;
 Field           Type      Null Key Default           Extra
 --------------- --------- ---- --- ----------------- --------------
 id              int(11)   NO   PRI NULL              auto_increment
 reservationId   int(11)   NO   MUL NULL              
 advanceTicketId int(11)   NO   MUL NULL              
 usedAt          timestamp NO       CURRENT_TIMESTAMP 