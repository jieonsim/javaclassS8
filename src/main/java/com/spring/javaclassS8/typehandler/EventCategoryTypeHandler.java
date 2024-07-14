package com.spring.javaclassS8.typehandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import com.spring.javaclassS8.vo.event.EventVO;

public class EventCategoryTypeHandler extends BaseTypeHandler<EventVO.EventCategory> {
    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, EventVO.EventCategory parameter, JdbcType jdbcType) throws SQLException {
        ps.setString(i, parameter.name());
    }

    @Override
    public EventVO.EventCategory getNullableResult(ResultSet rs, String columnName) throws SQLException {
        String category = rs.getString(columnName);
        return category == null ? null : EventVO.EventCategory.fromString(category);
    }

    @Override
    public EventVO.EventCategory getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        String category = rs.getString(columnIndex);
        return category == null ? null : EventVO.EventCategory.fromString(category);
    }

    @Override
    public EventVO.EventCategory getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        String category = cs.getString(columnIndex);
        return category == null ? null : EventVO.EventCategory.fromString(category);
    }
}
