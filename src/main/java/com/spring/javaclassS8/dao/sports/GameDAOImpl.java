package com.spring.javaclassS8.dao.sports;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.javaclassS8.vo.sports.GameVO;
import java.time.LocalDate;
import java.util.List;

@Repository
public class GameDAOImpl implements GameDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<GameVO> getGamesToStartSale(LocalDate date) {
        return sqlSession.getMapper(GameDAO.class).getGamesToStartSale(date);
    }

    @Override
    public List<GameVO> getGamesToEndSale(LocalDate date) {
        return sqlSession.getMapper(GameDAO.class).getGamesToEndSale(date);
    }

    @Override
    public void updateGameStatus(int gameId, GameVO.Status status) {
        sqlSession.getMapper(GameDAO.class).updateGameStatus(gameId, status);
    }
}