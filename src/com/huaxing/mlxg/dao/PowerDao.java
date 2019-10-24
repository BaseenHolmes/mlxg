package com.huaxing.mlxg.dao;

import com.huaxing.mlxg.po.Power;
import com.huaxing.mlxg.util.JdbcTemplate;
import com.huaxing.mlxg.util.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * @ClassName: PowerDao
 * @Description: TODO
 * @Author: Baseen
 * @Date: 2019/10/22 21:44
 * @Version: v1.0
 **/
public class PowerDao {

    private JdbcTemplate jdbcTemplate = new JdbcTemplate();

    /**
     * 根据角色id查询该角色所有权限
     * @param roid
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<Power> queryPowerByRole(long roid){
        String sql = "select * from role_power rp,pms_power pp where rp.poid=pp.poid and roid=?";
        return (List<Power>)jdbcTemplate.queryForList(sql, new Object[]{roid}, new RowMapper() {
            @Override
            public Object mapRow(ResultSet rs) throws SQLException {
                Power power = new Power();
                power.setPoid(rs.getLong("poid"));
                power.setPname(rs.getString("pname"));
                power.setPhref(rs.getString("phref"));
                power.setFuid(rs.getLong("fuid"));
                return power;
            }
        });
    }

}
