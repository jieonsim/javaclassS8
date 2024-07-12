
/* 자동 로그인 토큰 */
CREATE TABLE auto_login_tokens (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '토큰 고유번호',
    memberId INT NOT NULL COMMENT '회원 고유번호',
    token VARCHAR(255) NOT NULL COMMENT '토큰',
    expiresAt TIMESTAMP NOT NULL COMMENT '토큰 만료일시',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '토큰 생성일시',
    FOREIGN KEY (memberId) REFERENCES members(id),
    UNIQUE KEY (token)
);
