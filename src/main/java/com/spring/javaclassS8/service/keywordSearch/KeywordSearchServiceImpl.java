package com.spring.javaclassS8.service.keywordSearch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaclassS8.dao.sports.SportsDAO;
import com.spring.javaclassS8.vo.sports.TeamVO;
import com.spring.javaclassS8.vo.sports.VenueVO;

@Service
public class KeywordSearchServiceImpl implements KeywordSearchService {
	
    @Autowired
    private SportsDAO sportsDAO;
    
    @Override
    public String search(String keyword) {
        // 팀 이름 검색
        TeamVO team = sportsDAO.findTeamByKeyword(keyword);
        if (team != null) {
            String sportNameInEnglish = convertSportNameToEnglish(team.getSportName());
            String urlFriendlyTeamName = convertTeamNameToUrlFriendly(team.getShortName());
            return "/sports/" + sportNameInEnglish + "/" + urlFriendlyTeamName + "/reservation";
        }

        // 경기장 이름 검색
        VenueVO venue = sportsDAO.findVenueByKeyword(keyword);
        if (venue != null) {
            String sportNameInEnglish = convertSportNameToEnglish(venue.getSportName());
            String urlFriendlyTeamName = convertTeamNameToUrlFriendly(venue.getTeamShortName());
            return "/sports/" + sportNameInEnglish + "/" + urlFriendlyTeamName + "/reservation";
        }

        return null;
    }

    private String convertSportNameToEnglish(String koreanSportName) {
        switch (koreanSportName) {
            case "야구":
                return "baseball";
            case "축구":
                return "football";
            case "농구":
                return "basketball";
            case "배구":
                return "volleyball";
            default:
                return koreanSportName;
        }
    }

    private String convertTeamNameToUrlFriendly(String teamName) {
        switch (teamName.toLowerCase()) {
        	case "lg":
        		return "lg";
            case "삼성":
                return "samsung";
            case "한화":
                return "hanhwa";
            case "kia":
                return "kia";
            case "ssg":
                return "ssg";
            case "kt":
                return "kt";
            case "케이티":
            	return "kt";
            case "울산":
            	return "uhfc";
            case "포항":
            	return "steelers";
            case "광주":
            	return "gwangjufc";
            case "전북현대":
            	return "hyundaimotorsfc";
            case "인천":
            	return "incheonutd";
            case "대구":
            	return "daegufc";
            case "fc서울":
            	return "fcseoul";
            case "김천":
            	return "gimcheonfc";
            default:
                return teamName.toLowerCase();
        }
    }
}
