package com.spring.javaclassS8.vo.member;

import java.util.List;

import lombok.Data;

@Data
public class MemberUpdateRequest {
    private List<Integer> memberIds;
    private Integer status;
    private String role;
}