package com.spring.javaclassS8.controller.search;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.service.keywordSearch.KeywordSearchService;

@Controller
public class KeywordSearchController {
	@Autowired
	private KeywordSearchService keywordSearchService;

	// 헤더 검색
	@GetMapping("/search")
	@ResponseBody
	public Map<String, Object> search(@RequestParam String keyword) {
		Map<String, Object> result = new HashMap<>();

		String searchUrl = keywordSearchService.search(keyword);
		if (searchUrl != null) {
			result.put("result", true);
			result.put("url", searchUrl);
		} else {
			result.put("result", false);
		}

		return result;
	}
}
