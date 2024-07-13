show tables;

/* 이벤트 */
CREATE TABLE events (
    id INT NOT NULL AUTO_INCREMENT COMMENT '이벤트 고유번호',
    adminId INT NOT NULL COMMENT '이벤트 업로드한 관리자 고유번호',
    eventCategory ENUM ('예매권', '기타') NOT NULL COMMENT '이벤트 유형',
    title VARCHAR(255) NOT NULL COMMENT '이벤트명',
    content TEXT NOT NULL COMMENT '이벤트 내용',
    thumbnail VARCHAR(255) NOT NULL COMMENT '썸네일 이미지 경로',
    startDate DATE NOT NULL COMMENT '이벤트 시작일',
    endDate DATE NOT NULL COMMENT '이벤트 종료일',
    status ENUM('ongoing', 'ended', 'upcoming') NOT NULL DEFAULT 'ongoing' COMMENT '이벤트 상태 (ongoing: 진행중, ended: 종료, upcoming: 예정)',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '이벤트 업로드 일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '이벤트 수정 일시',
    PRIMARY KEY (id),
    FOREIGN KEY (adminId) REFERENCES members(id)
);