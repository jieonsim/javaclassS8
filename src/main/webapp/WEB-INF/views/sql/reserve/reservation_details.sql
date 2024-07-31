
CREATE TABLE reservation_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reservationId INT NOT NULL,
    seatId INT NOT NULL,
    ticketTypeId INT NOT NULL,
    seatBlock INT NOT NULL,  -- 101~109 사이의 블록 번호
    seatRow INT NOT NULL,    -- 1~10 사이의 열 번호
    seatNumber INT NOT NULL, -- 1~99 사이의 좌석 번호
    ticketPrice INT NOT NULL,
    FOREIGN KEY (reservationId) REFERENCES reservations(id),
    FOREIGN KEY (seatId) REFERENCES seats(id),
    FOREIGN KEY (ticketTypeId) REFERENCES ticket_types(id)
);

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


select seatId from reservation_details where reservationId = 35;