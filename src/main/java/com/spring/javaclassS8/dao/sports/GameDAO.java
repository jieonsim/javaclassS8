package com.spring.javaclassS8.dao.sports;

import com.spring.javaclassS8.vo.sports.GameVO;
import org.apache.ibatis.annotations.Param;
import java.time.LocalDate;
import java.util.List;

public interface GameDAO {
    List<GameVO> getGamesToStartSale(LocalDate date);
    List<GameVO> getGamesToEndSale(LocalDate date);
    void updateGameStatus(@Param("id") int gameId, @Param("status") GameVO.Status status);
}