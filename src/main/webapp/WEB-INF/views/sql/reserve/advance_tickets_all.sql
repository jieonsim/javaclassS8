
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

desc advance_tickets;
 Field               Type        Null Key Default           Extra
 ------------------- ----------- ---- --- ----------------- --------------
 id                  int(11)     NO   PRI NULL              auto_increment
 adminId             int(11)     NO   MUL NULL              
 advanceTicketNumber varchar(16) NO   UNI NULL              
 used                tinyint(1)  YES      0                 
 expiresAt           timestamp   NO       CURRENT_TIMESTAMP 
 issuedAt            timestamp   NO       CURRENT_TIMESTAMP 
 usedAt              timestamp   YES      NULL              
 usedByMemberId      int(11)     YES  MUL NULL
 
/* 예매권 등록 */
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
 
 /* 예매권 사용 */
 CREATE TABLE advance_ticket_usage (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '예매권 사용 고유번호',
    reservationId INT NOT NULL COMMENT '예매 고유번호',
    advanceTicketId INT NOT NULL COMMENT '예매권 고유번호',
    usedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '사용 일시',
    status enum('USED', 'CANCELLED') DEFAULT USED COMMNET '사용 상태',
    FOREIGN KEY (reservationId) REFERENCES reservations(id),
    FOREIGN KEY (advanceTicketId) REFERENCES advance_tickets(id)
);
desc advance_ticket_usage;
 Field           Type                     Null Key Default           Extra
 --------------- ------------------------ ---- --- ----------------- --------------
 id              int(11)                  NO   PRI NULL              auto_increment
 reservationId   int(11)                  NO   MUL NULL              
 advanceTicketId int(11)                  NO   MUL NULL              
 usedAt          timestamp                NO       CURRENT_TIMESTAMP 
 status          enum('USED','CANCELLED') NO       USED    
 
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
 
 /* 회원 */
CREATE TABLE members (
    id INT NOT NULL AUTO_INCREMENT COMMENT '회원 고유번호',
    email VARCHAR(255) NOT NULL COMMENT '이메일 아이디',
    password VARCHAR(255) NOT NULL COMMENT '비밀번호',
    name VARCHAR(100) NOT NULL COMMENT '회원 이름',
    phone VARCHAR(20) NOT NULL COMMENT '휴대폰번호',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '계정 생성일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '회원 정보 수정일시',
    role ENUM('USER', 'ADMIN') NOT NULL DEFAULT 'USER' COMMENT '유저/관리자 구분',
    lastLoginAt TIMESTAMP NULL COMMENT '마지막 로그인 일시',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '회원 상태 (1: 활동중, 2: 활동정지, 3: 탈퇴)',
    statusChangedAt TIMESTAMP NULL COMMENT '회원 상태 변경 일시',
    suspensionReason VARCHAR(255) COMMENT '활동 정지 사유',
    PRIMARY KEY (id),
    UNIQUE KEY (email)
);
desc members;
 Field            Type                 Null Key Default           Extra
 ---------------- -------------------- ---- --- ----------------- ---------------------------
 id               int(11)              NO   PRI NULL              auto_increment
 email            varchar(255)         NO   UNI NULL              
 password         varchar(255)         NO       NULL              
 name             varchar(100)         NO       NULL              
 phone            varchar(20)          NO       NULL              
 createdAt        timestamp            NO       CURRENT_TIMESTAMP 
 updatedAt        timestamp            NO       CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
 role             enum('USER','ADMIN') NO       USER              
 lastLoginAt      timestamp            YES      NULL              
 status           tinyint(4)           NO       1                 
 statusChangedAt  timestamp            YES      NULL              
 suspensionReason varchar(255)         YES      NULL  