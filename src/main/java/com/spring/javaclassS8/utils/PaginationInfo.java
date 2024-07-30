package com.spring.javaclassS8.utils;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PaginationInfo {
    private int totalCount;      // 전체 데이터 수
    private int pageSize;        // 한 페이지당 보여줄 데이터 수
    private int totalPages;      // 전체 페이지 수
    private int currentPage;     // 현재 페이지 번호
    private int startPage;       // 시작 페이지 번호
    private int endPage;         // 끝 페이지 번호
    private boolean hasPreviousPage;
    private boolean hasNextPage;

    public PaginationInfo(int totalCount, int pageSize, int currentPage) {
        this.totalCount = totalCount;
        this.pageSize = pageSize;
        this.currentPage = currentPage;

        // 전체 페이지 수 계산
        this.totalPages = (int) Math.ceil((double) totalCount / pageSize);

        // 시작 페이지와 끝 페이지 계산
        int pageGroupSize = 10;
        this.startPage = ((currentPage - 1) / pageGroupSize) * pageGroupSize + 1;
        this.endPage = Math.min(startPage + pageGroupSize - 1, totalPages);

        // 이전 페이지와 다음 페이지 존재 여부 확인
        this.hasPreviousPage = currentPage > 1;
        this.hasNextPage = currentPage < totalPages;
    }
}