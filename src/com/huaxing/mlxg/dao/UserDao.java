package com.huaxing.mlxg.dao;

import com.huaxing.mlxg.po.User;
import com.huaxing.mlxg.util.JdbcTemplate;
import com.huaxing.mlxg.util.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * @ClassName: UserDao
 * @Description: TODO 用户持久层
 * @Author: Baseen
 * @Date: 2019/10/22 14:04
 * @Version: v1.0
 **/
public class UserDao {

    private JdbcTemplate jdbcTemplate = new JdbcTemplate();

    /**
     * 根据用户名查询用户名和密码
     *
     * @param username
     * @return
     */
    public User load(String username) {
        String sql = "select * from pms_user where username = ?";
        return (User) jdbcTemplate.queryForOne(sql, new Object[]{username}, new RowMapper() {
            @Override
            public Object mapRow(ResultSet rs) throws SQLException {
                User user = new User();
                user.setUserid(rs.getLong("userid"));
                user.setUsername(rs.getString("username"));
                user.setRoid(rs.getLong("roid"));
                user.setUtype(rs.getString("utype"));
                user.setUsex(rs.getString("usex"));
                user.setUage(rs.getInt("uage"));
                user.setUemail(rs.getString("uemail"));
                user.setUphone(rs.getLong("uphone"));
                user.setPassword(rs.getString("password"));
                user.setUcardid(rs.getString("ucardid"));
                return user;
            }
        });
    }

    /**
     * 查询所有用户信息
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<User> queryAllUser(){
        String sql = "select * from pms_user";
        return (List<User>) jdbcTemplate.queryForList(sql, new RowMapper() {
            @Override
            public Object mapRow(ResultSet rs) throws SQLException {
                User user = new User();
                user.setUserid(rs.getLong("userid"));
                user.setUsername(rs.getString("username"));
                user.setRoid(rs.getLong("roid"));
                user.setUtype(rs.getString("utype"));
                user.setUsex(rs.getString("usex"));
                user.setUage(rs.getInt("uage"));
                user.setUemail(rs.getString("uemail"));
                user.setUphone(rs.getLong("uphone"));
                user.setPassword(rs.getString("password"));
                user.setUcardid(rs.getString("ucardid"));
                return user;
            }
        });
    }

    /**
     * 查询所有项目经理
     *
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<User> queryLeader() {
        String sql = "select userid,username from pms_user where roid = 2";
        return jdbcTemplate.queryForList(sql, new RowMapper() {
            @Override
            public Object mapRow(ResultSet rs) throws SQLException {
                User user = new User();
                user.setUserid(rs.getLong("userid"));
                user.setUsername(rs.getString("username"));
                return user;
            }
        });
    }


}
