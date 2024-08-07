/* 좌석 등급 */
CREATE TABLE seats (
    id INT NOT NULL AUTO_INCREMENT COMMENT '좌석 등급 고유번호',
    sportId INT NOT NULL COMMENT '스포츠 고유번호',
    teamId INT NOT NULL COMMENT '팀 고유번호',
    venueId INT NOT NULL COMMENT '경기장 고유번호',
    seatName VARCHAR(50) NOT NULL COMMENT '좌석 등급 이름',
    capacity INT NOT NULL COMMENT '좌석 수',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '좌석 등급 생성 일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '좌석 등급 수정 일시',
    PRIMARY KEY (id),
    FOREIGN KEY (sportId) REFERENCES sports(id),
    FOREIGN KEY (teamId) REFERENCES teams(id),
    FOREIGN KEY (venueId) REFERENCES venues(id),
    UNIQUE KEY (sportId, teamId, venueId, seatName)
);

desc seats;
 Field     Type        Null Key Default           Extra
 --------- ----------- ---- --- ----------------- ---------------------------
 id        int(11)     NO   PRI NULL              auto_increment
 sportId   int(11)     NO   MUL NULL              
 teamId    int(11)     NO   MUL NULL              
 venueId   int(11)     NO   MUL NULL              
 seatName  varchar(50) NO       NULL              
 capacity  int(11)     NO       NULL              
 createdAt timestamp   NO       CURRENT_TIMESTAMP 
 updatedAt timestamp   NO       CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
 seatColor varchar(7)  YES      NULL              
