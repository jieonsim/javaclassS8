package com.spring.javaclassS8.service.sports;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.javaclassS8.dao.sports.GameDAO;
import com.spring.javaclassS8.vo.sports.GameVO;

@Service
public class GameStatusUpdateService {

    @Autowired
    private GameDAO gameDAO;

    //@Scheduled(cron = "0 * 14-20 * * *") // 14시부터 20시까지 매 분마다 실행
    @Transactional
    public void updateGameStatus() {
        LocalDateTime now = LocalDateTime.now();
        
        // 현재 시간이 14:00에서 19:30 사이인 경우에만 실행
        if (isWithinOperatingHours(now)) {
            LocalDate today = now.toLocalDate();

            // 판매 예정 -> 판매중 업데이트
            updateStatusToOnSale(today, now);

            // 판매중 -> 판매종료 업데이트
            updateStatusToClosed(today, now);
        }
    }

    private boolean isWithinOperatingHours(LocalDateTime dateTime) {
        LocalTime time = dateTime.toLocalTime();
        return !time.isBefore(LocalTime.of(14, 0)) && !time.isAfter(LocalTime.of(19, 30));
    }

    private void updateStatusToOnSale(LocalDate today, LocalDateTime now) {
        List<GameVO> games = gameDAO.getGamesToStartSale(today);
        if (games.isEmpty()) {
            return; // 등록된 게임이 없으면 처리하지 않음
        }
        
        for (GameVO game : games) {
            LocalDateTime gameDateTime = LocalDateTime.parse(game.getGameDate() + "T" + game.getGameTime());
            LocalDateTime saleStartTime = gameDateTime
                .minusDays(game.getBookingOpenDaysBefore())
                .withHour(11).withMinute(0).withSecond(0); // 오전 11시로 설정

            if (now.isAfter(saleStartTime) || now.isEqual(saleStartTime)) {
                gameDAO.updateGameStatus(game.getId(), GameVO.Status.판매중);
            }
        }
    }

    private void updateStatusToClosed(LocalDate today, LocalDateTime now) {
        List<GameVO> games = gameDAO.getGamesToEndSale(today);
        if (games.isEmpty()) {
            return; // 등록된 게임이 없으면 처리하지 않음
        }
        
        for (GameVO game : games) {
            LocalDateTime gameDateTime = LocalDateTime.parse(game.getGameDate() + "T" + game.getGameTime());
            LocalDateTime saleEndTime = gameDateTime
                .plusMinutes(game.getBookingCloseMinutesAfterStart());

            if (now.isAfter(saleEndTime) || now.isEqual(saleEndTime)) {
                gameDAO.updateGameStatus(game.getId(), GameVO.Status.판매종료);
                System.out.println("status" + game.getId());
            }
        }
    }
}