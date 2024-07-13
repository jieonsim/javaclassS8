
/* 이벤트 당첨자 게시글*/
CREATE TABLE winner_posts (
    id INT NOT NULL AUTO_INCREMENT COMMENT '당첨 게시글 고유번호',
    eventId INT NOT NULL COMMENT '이벤트 고유번호',
    adminId INT NOT NULL COMMENT '게시글 업로드 관리자 고유번호',
    title VARCHAR(255) NOT NULL COMMENT '게시글 제목',
    content TEXT NOT NULL COMMENT '게시글 내용',
    isPublished BOOLEAN NOT NULL DEFAULT FALSE COMMENT '게시글 공개 여부',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '게시글 업로드 일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '게시글 수정 일시',
    PRIMARY KEY (id),
    FOREIGN KEY (eventId) REFERENCES events(id),
    FOREIGN KEY (adminId) REFERENCES members(id)
);
