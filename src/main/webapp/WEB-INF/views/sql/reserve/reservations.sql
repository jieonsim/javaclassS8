/* 예매 테이블 */
CREATE TABLE reservations (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '예매 고유번호',
    reservationNumber CHAR(10) NOT NULL COMMNET '예매번호',  -- 10자리 고정 길이 숫자
    memberId INT NOT NULL COMMENT '예매자 회원 고유번호',
    gameId INT NOT NULL COMMENT '경기 고유번호',
    totalAmount INT NOT NULL COMMENT '총 결제금액',
    ticketAmount INT NOT NULL COMMENT '총 티켓매수',
    bookingFee INT NOT NULL COMMENT '총 예매수수료',
    status ENUM('예매완료', '취소완료') NOT NULL COMMENT '예매상태',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '예매일시',
    canceledAt TIMESTAMP NULL COMMENT '취소일시',
    FOREIGN KEY (memberId) REFERENCES members(id),
    FOREIGN KEY (gameId) REFERENCES games(id),
    UNIQUE KEY (reservationNumber)
);
desc reservations;
 Field             Type                Null Key Default           Extra
 ----------------- ------------------- ---- --- ----------------- --------------
 id                int(11)             NO   PRI NULL              auto_increment
 reservationNumber char(10)            NO   UNI NULL              
 memberId          int(11)             NO   MUL NULL              
 gameId            int(11)             NO   MUL NULL              
 totalAmount       int(11)             NO       NULL              
 ticketAmount      int(11)             NO       NULL              
 bookingFee        int(11)             NO       NULL              
 status            enum('예매완료','취소완료') NO       NULL              
 createdAt         timestamp           NO       CURRENT_TIMESTAMP 
 canceledAt        timestamp           YES      NULL              

 
 desc reservation_details;
  Field         Type    Null Key Default Extra
 ------------- ------- ---- --- ------- --------------
 id            int(11) NO   PRI NULL    auto_increment
 reservationId int(11) NO   MUL NULL    
 seatId        int(11) NO   MUL NULL    
 ticketTypeId  int(11) NO   MUL NULL    
 seatBlock     int(11) NO       NULL    
 seatRow       int(11) NO       NULL    
 seatNumber    int(11) NO       NULL    
 ticketPrice   int(11) NO       NULL    