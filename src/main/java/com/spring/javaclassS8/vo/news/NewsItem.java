package com.spring.javaclassS8.vo.news;

import lombok.Data;

@Data
public class NewsItem {
	private String link;
	private String imgSrc;
	private String title;
	private String desc;
	private String time;
	private String source;

	public NewsItem(String link, String imgSrc, String title, String desc, String time, String source) {
		this.link = link;
		this.imgSrc = imgSrc;
		this.title = title;
		this.desc = desc;
		this.time = time;
		this.source = source;
	}
}
