package com.spring.javaclassS8.vo.member;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class LoginResult {
    private boolean success;
    private String message;
    private MemberVO member;

    public LoginResult(boolean success, String message) {
        this.success = success;
        this.message = message;
        this.member = null;
    }
}