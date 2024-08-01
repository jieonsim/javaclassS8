
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
