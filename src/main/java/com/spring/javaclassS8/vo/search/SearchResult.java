package com.spring.javaclassS8.vo.search;

import lombok.Data;

@Data
public class SearchResult {
	private String url;

	public SearchResult(String url) {
		this.url = url;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}