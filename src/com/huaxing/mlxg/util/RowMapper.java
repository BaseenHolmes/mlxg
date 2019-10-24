package com.huaxing.mlxg.util;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @InterfaceName RowMapper
 * @Description:
 * @Author Baseen
 * @Date 2019/9/22
 * @Version V1.0
 **/
public interface RowMapper {
	public Object mapRow(ResultSet rs) throws SQLException;
}
