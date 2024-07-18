package com.spring.javaclassS8.controller.hotIssue;

import java.time.Duration;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javaclassS8.vo.hotIssue.NewsItem;

@Controller
public class HotIssueController {

	@GetMapping("/hotIssue")
	public String hotIssue() {
		return "hotIssue/main";
	}

	@GetMapping("/hotIssue2")
	public String hotIssue2() {
		return "hotIssue/main2";
	}

	@GetMapping("/api/news")
	@ResponseBody
	public List<NewsItem> fetchNewsItems(HttpServletRequest request) {
		System.out.println("fetchNewsItems 메소드 시작");
		List<NewsItem> newsItems = new ArrayList<>();

		// ChromeDriver 경로 설정
		String realPath = request.getSession().getServletContext().getRealPath("/resources/crawling/");
		System.setProperty("webdriver.chrome.driver", realPath + "chromedriver.exe");

		ChromeOptions options = new ChromeOptions();
		options.addArguments("--headless"); // 브라우저를 열지 않고 백그라운드에서 실행

		WebDriver driver = new ChromeDriver(options);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

		try {
			driver.get("https://sports.daum.net/news/ranking");

			// 페이지가 로드될 때까지 대기
			wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("ol.list_news > li")));

			List<WebElement> newsElements = driver.findElements(By.cssSelector("ol.list_news > li"));

			for (int i = 0; i < Math.min(5, newsElements.size()); i++) {
				WebElement newsElement = newsElements.get(i);

				String link = newsElement.findElement(By.cssSelector("a.link_txt")).getAttribute("href");
				String imgSrc = newsElement.findElement(By.cssSelector("a.link_thumb img")).getAttribute("src");
				String title = newsElement.findElement(By.cssSelector("a.link_txt")).getText();
				String desc = newsElement.findElement(By.cssSelector("a.link_desc")).getText();
				String time = newsElement.findElement(By.cssSelector("span.txt_info.txt_num")).getText();
				String source = newsElement.findElement(By.cssSelector("span.txt_info:not(.txt_num)")).getText();

				newsItems.add(new NewsItem(link, imgSrc, title, desc, time, source));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("크롤링 중 오류 발생: " + e.getMessage());
		} finally {
			driver.quit(); // 브라우저 종료
		}

		System.out.println("fetchNewsItems 메소드 종료");
		return newsItems;
	}

	@GetMapping("/api/schedule")
	@ResponseBody
	public Map<String, Object> fetchSchedule(HttpServletRequest request) {
		System.out.println("fetchSchedule 메소드 시작");
		Map<String, Object> scheduleData = new HashMap<>();

		String realPath = request.getSession().getServletContext().getRealPath("/resources/crawling/");
		System.setProperty("webdriver.chrome.driver", realPath + "chromedriver.exe");

		ChromeOptions options = new ChromeOptions();
		options.addArguments("--headless");

		WebDriver driver = new ChromeDriver(options);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

		try {
			driver.get("https://sports.daum.net/");

			wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div.top_sched")));

			WebElement dateElement = driver.findElement(By.cssSelector("div.date_select strong.tit_date"));
			String date = dateElement.getText();

			List<WebElement> matchElements = driver.findElements(By.cssSelector("div.bundle_sched.bundle_home a.link_sched"));
			List<Map<String, String>> matches = new ArrayList<>();

			for (int i = 0; i < Math.min(4, matchElements.size()); i++) {
				WebElement matchElement = matchElements.get(i);
				Map<String, String> match = new HashMap<>();

				if (matchElement.findElements(By.cssSelector(".team_left")).isEmpty()) {
					// Single event case
					match.put("singleEvent", "true");
					match.put("eventName", matchElement.findElement(By.cssSelector(".info_sched .tit_match")).getText());
				} else {
					// Two-team match case
					match.put("singleEvent", "false");
					match.put("teamLeft", matchElement.findElement(By.cssSelector(".team_left .inner_tit")).getText());
					match.put("teamRight", matchElement.findElement(By.cssSelector(".team_right .inner_tit")).getText());
					match.put("teamLeftLogo", matchElement.findElement(By.cssSelector(".team_left img.thumb_g")).getAttribute("src"));
					match.put("teamRightLogo", matchElement.findElement(By.cssSelector(".team_right img.thumb_g")).getAttribute("src"));
				}

				match.put("status", matchElement.findElement(By.cssSelector(".info_sched .txt_status")).getText());
				match.put("league", matchElement.findElement(By.cssSelector(".info_sched .txt_league")).getText());

				// 시간 정보 처리
				try {
					WebElement timeElement = matchElement.findElement(By.cssSelector(".info_sched .num_time"));
					match.put("time", timeElement.getText());
				} catch (NoSuchElementException e) {
					match.put("time", ""); // 시간 정보가 없을 경우 빈 문자열 설정
				}

				// 점수 정보 추가 (두 팀 경기인 경우에만)
				if ("false".equals(match.get("singleEvent"))) {
					try {
						match.put("scoreLeft", matchElement.findElement(By.cssSelector(".team_left .num_score")).getText());
						match.put("scoreRight", matchElement.findElement(By.cssSelector(".team_right .num_score")).getText());
					} catch (NoSuchElementException e) {
						// 점수 정보가 없는 경우 (경기 전)
						match.put("scoreLeft", "");
						match.put("scoreRight", "");
					}
				}

				matches.add(match);
			}

			scheduleData.put("date", date);
			scheduleData.put("matches", matches);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("크롤링 중 오류 발생: " + e.getMessage());
		} finally {
			driver.quit();
		}

		System.out.println("fetchSchedule 메소드 종료");
		return scheduleData;
	}

//	@GetMapping("/api/schedule")
//	@ResponseBody
//	public Map<String, Object> fetchSchedule(HttpServletRequest request) {
//		System.out.println("fetchSchedule 메소드 시작");
//		Map<String, Object> scheduleData = new HashMap<>();
//
//		String realPath = request.getSession().getServletContext().getRealPath("/resources/crawling/");
//		System.setProperty("webdriver.chrome.driver", realPath + "chromedriver.exe");
//
//		ChromeOptions options = new ChromeOptions();
//		options.addArguments("--headless");
//
//		WebDriver driver = new ChromeDriver(options);
//		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
//
//		try {
//			driver.get("https://sports.daum.net/");
//
//			wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div.top_sched")));
//
//			WebElement dateElement = driver.findElement(By.cssSelector("div.date_select strong.tit_date"));
//			String date = dateElement.getText();
//
//			List<WebElement> matchElements = driver.findElements(By.cssSelector("div.bundle_sched.bundle_home a.link_sched"));
//			List<Map<String, String>> matches = new ArrayList<>();
//
//			for (int i = 0; i < Math.min(4, matchElements.size()); i++) {
//				WebElement matchElement = matchElements.get(i);
//				Map<String, String> match = new HashMap<>();
//				match.put("teamLeft", matchElement.findElement(By.cssSelector(".team_left .inner_tit")).getText());
//				match.put("teamRight", matchElement.findElement(By.cssSelector(".team_right .inner_tit")).getText());
//				match.put("status", matchElement.findElement(By.cssSelector(".info_sched .txt_status")).getText());
//
//				// 시간 정보 처리
//				try {
//					WebElement timeElement = matchElement.findElement(By.cssSelector(".info_sched .num_time"));
//					match.put("time", timeElement.getText());
//				} catch (NoSuchElementException e) {
//					match.put("time", ""); // 시간 정보가 없을 경우 빈 문자열 설정
//				}
//
//				match.put("league", matchElement.findElement(By.cssSelector(".info_sched .txt_league")).getText());
//				match.put("teamLeftLogo", matchElement.findElement(By.cssSelector(".team_left img.thumb_g")).getAttribute("src"));
//				match.put("teamRightLogo", matchElement.findElement(By.cssSelector(".team_right img.thumb_g")).getAttribute("src"));
//
//				// 점수 정보 추가
//				try {
//					match.put("scoreLeft", matchElement.findElement(By.cssSelector(".team_left .num_score")).getText());
//					match.put("scoreRight", matchElement.findElement(By.cssSelector(".team_right .num_score")).getText());
//				} catch (Exception e) {
//					// 점수 정보가 없는 경우 (경기 전)
//					match.put("scoreLeft", "");
//					match.put("scoreRight", "");
//				}
//
//				matches.add(match);
//			}
//
//			scheduleData.put("date", date);
//			scheduleData.put("matches", matches);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("크롤링 중 오류 발생: " + e.getMessage());
//		} finally {
//			driver.quit();
//		}
//
//		System.out.println("fetchSchedule 메소드 종료");
//		return scheduleData;
//	}

	@GetMapping("/api/kboRanking")
	@ResponseBody
	public Map<String, Object> fetchKBORanking(HttpServletRequest request) {
		System.out.println("fetchKBORanking 메소드 시작");
		Map<String, Object> rankingData = new HashMap<>();

		String realPath = request.getSession().getServletContext().getRealPath("/resources/crawling/");
		System.setProperty("webdriver.chrome.driver", realPath + "chromedriver.exe");

		ChromeOptions options = new ChromeOptions();
		options.addArguments("--headless");

		WebDriver driver = new ChromeDriver(options);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

		try {
			driver.get("https://www.koreabaseball.com/Default.aspx");

			wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("#tblTeamRank")));

			WebElement dateElement = driver.findElement(By.cssSelector("#lblTeamRank"));
			String date = dateElement.getText();

			List<WebElement> rows = driver.findElements(By.cssSelector("#tblTeamRank tbody tr"));
			List<Map<String, String>> teams = new ArrayList<>();

			for (WebElement row : rows) {
				Map<String, String> team = new HashMap<>();
				team.put("rank", row.findElement(By.cssSelector("th")).getText());
				List<WebElement> cells = row.findElements(By.cssSelector("td"));
				team.put("name", cells.get(0).getText());
				team.put("games", cells.get(1).getText());
				team.put("wins", cells.get(2).getText());
				team.put("losses", cells.get(3).getText());
				team.put("draws", cells.get(4).getText());
				team.put("winRate", cells.get(5).getText());
				team.put("gameBehind", cells.get(6).getText());
				team.put("streak", cells.get(7).getText());
				teams.add(team);
			}

			rankingData.put("date", date);
			rankingData.put("teams", teams);
			System.out.println("크롤링된 데이터: " + rankingData);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("크롤링 중 오류 발생: " + e.getMessage());
		} finally {
			driver.quit();
		}

		System.out.println("fetchKBORanking 메소드 종료");
		return rankingData;
	}
}