show tables;

/*이벤트 참여 관리*/
CREATE TABLE event_participants (
    id INT NOT NULL AUTO_INCREMENT COMMENT '참여 고유번호',
    eventId INT NOT NULL COMMENT '이벤트 고유번호',
    memberId INT NOT NULL COMMENT '참여자 회원 고유번호',
    status ENUM('ACTIVE', 'CANCELLED') NOT NULL DEFAULT 'ACTIVE' COMMENT '참여 상태',
    participatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '참여 일시',
    cancelledAt TIMESTAMP NULL COMMENT '참여 취소 일시',
    PRIMARY KEY (id),
    FOREIGN KEY (eventId) REFERENCES events(id) ON DELETE CASCADE,
    FOREIGN KEY (memberId) REFERENCES members(id),
    UNIQUE KEY unique_event_member (eventId, memberId, status)
);

desc events;

 Field         Type                               Null Key Default           Extra
 ------------- ---------------------------------- ---- --- ----------------- ---------------------------
 id            int(11)                            NO   PRI NULL              auto_increment
 adminId       int(11)                            NO   MUL NULL              
 eventCategory enum('예매권','기타')                   NO       NULL              
 title         varchar(255)                       NO       NULL              
 content       text                               NO       NULL              
 thumbnail     varchar(255)                       NO       NULL              
 startDate     date                               NO       NULL              
 endDate       date                               NO       NULL              
 status        enum('ONGOING','ENDED','UPCOMING') NO       ONGOING           
 createdAt     timestamp                          NO       CURRENT_TIMESTAMP 
 updatedAt     timestamp                          NO       CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP

 Field     Type                     Null Key Default           Extra
 --------- ------------------------ ---- --- ----------------- ---------------------------
 id        int(11)                  NO   PRI NULL              auto_increment
 eventId   int(11)                  NO   MUL NULL              
 memberId  int(11)                  NO   MUL NULL              
 comment   text                     NO       NULL              
 status    enum('ACTIVE','DELETED') NO       ACTIVE            
 createdAt timestamp                NO       CURRENT_TIMESTAMP 
 updatedAt timestamp                NO       CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP

 Field          Type                       Null Key Default           Extra
 -------------- -------------------------- ---- --- ----------------- --------------
 id             int(11)                    NO   PRI NULL              auto_increment
 eventId        int(11)                    NO   MUL NULL              
 memberId       int(11)                    NO   MUL NULL              
 status         enum('ACTIVE','CANCELLED') NO       ACTIVE            
 participatedAt timestamp                  NO       CURRENT_TIMESTAMP 
 cancelledAt    timestamp                  YES      NULL              
