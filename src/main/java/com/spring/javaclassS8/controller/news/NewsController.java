package com.spring.javaclassS8.controller.news;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.vo.news.NewsItem;

@Controller
public class NewsController {

	@GetMapping("/news")
	public String news(Model model) {
	    List<NewsItem> newsItems = fetchNewsItems();
	    model.addAttribute("newsItems", newsItems);
	    return "news/main";
	}

	@GetMapping("/api/news")
	@ResponseBody
	public List<NewsItem> fetchNewsItems() {
		String url = "https://sports.daum.net/news/ranking";
		List<NewsItem> newsItems = new ArrayList<>();

		try {
			Document doc = Jsoup.connect(url).get();
			Elements newsElements = doc.select("ol.list_news li");

			for (int i = 0; i < Math.min(5, newsElements.size()); i++) {
				Element newsElement = newsElements.get(i);

				String link = newsElement.select("a").attr("href");
				String imgSrc = newsElement.select("a.link_thumb img").attr("src");
				String title = newsElement.select("a.link_txt").text();
				String desc = newsElement.select("a.link_desc").text();
				String time = newsElement.select("span.txt_info.txt_num").text();
				String source = newsElement.select("span.txt_info:not(.txt_num)").text();

				newsItems.add(new NewsItem(link, imgSrc, title, desc, time, source));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return newsItems;
	}
}
