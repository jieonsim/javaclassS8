show tables;

/* 이벤트 댓글 */
CREATE TABLE event_comments (
    id INT NOT NULL AUTO_INCREMENT COMMENT '이벤트 댓글 고유번호',
    eventId INT NOT NULL COMMENT '이벤트 고유번호',
    memberId INT NOT NULL COMMENT '댓글 작성자 고유번호',
    comment TEXT NOT NULL COMMENT '댓글 내용',
    status ENUM('ACTIVE', 'DELETED') NOT NULL DEFAULT 'ACTIVE' COMMENT '댓글 상태',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '댓글 작성 일시',
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '댓글 수정 일시',
    PRIMARY KEY (id),
    FOREIGN KEY (eventId) REFERENCES events(id) ON DELETE CASCADE,
    FOREIGN KEY (memberId) REFERENCES members(id)
);