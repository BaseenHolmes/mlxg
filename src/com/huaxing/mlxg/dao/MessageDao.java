package com.huaxing.mlxg.dao;

import com.huaxing.mlxg.po.Message;
import com.huaxing.mlxg.po.User;
import com.huaxing.mlxg.util.JdbcTemplate;
import com.huaxing.mlxg.util.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * @ClassName: MessageDao
 * @Description: TODO
 * @Author: Baseen
 * @Date: 2019/10/23 8:52
 * @Version: v1.0
 **/
public class MessageDao {

    private JdbcTemplate jdbcTemplate = new JdbcTemplate();

    /**
     * 将消息存入消息表
     *
     * @param biaoti
     * @param sender
     * @param recipient
     * @param text
     */
    public void insert(String biaoti, long sender, long recipient, String text) {
        String sql = "insert into pms_message values (message_id_seq.nextval,?,?,?,sysdate,?)";
        jdbcTemplate.update(sql, new Object[]{biaoti, sender, recipient, text});
    }

    /**
     * 根据当前用户id查询发件箱
     * @param userid
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<Message> querySenderMessageByUserid(long userid) {
        String sql = "select * from pms_message where mesend = ?";
        return (List<Message>)jdbcTemplate.queryForList(sql, new Object[]{userid}, new RowMapper() {
            @Override
            public Object mapRow(ResultSet rs) throws SQLException {
                Message message = new Message();
                message.setMessageid(rs.getLong("messageid"));
                message.setMename(rs.getString("mename"));
                message.setMesend(rs.getLong("mesend"));
                message.setMerecive(rs.getLong("merecive"));
                message.setMedate(rs.getDate("medate"));
                message.setMetext(rs.getString("metext"));
                return message;
            }
        });
    }

    /**
     * 根据当前用户id查询收件箱
     * @param userid
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<Message> queryReceiverMessageByUserid(long userid) {
        String sql = "select * from pms_message where merecive = ?";
        return (List<Message>)jdbcTemplate.queryForList(sql, new Object[]{userid}, new RowMapper() {
            @Override
            public Object mapRow(ResultSet rs) throws SQLException {
                Message message = new Message();
                message.setMessageid(rs.getLong("messageid"));
                message.setMename(rs.getString("mename"));
                message.setMesend(rs.getLong("mesend"));
                message.setMerecive(rs.getLong("merecive"));
                message.setMedate(rs.getDate("medate"));
                message.setMetext(rs.getString("metext"));
                return message;
            }
        });
    }

    /**
     * 查询所有消息
     *
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<Message> queryAllMessage() {
        String sql = "select * from pms_message";
        return (List<Message>)jdbcTemplate.queryForList(sql, new RowMapper() {
            @Override
            public Object mapRow(ResultSet rs) throws SQLException {
                Message message = new Message();
                message.setMessageid(rs.getLong("messageid"));
                message.setMename(rs.getString("mename"));
                message.setMesend(rs.getLong("mesend"));
                message.setMerecive(rs.getLong("merecive"));
                message.setMedate(rs.getDate("medate"));
                message.setMetext(rs.getString("metext"));
                return message;
            }
        });
    }

    /**
     * 删除消息
     * @param id
     */
    public void deleteMessage(Long id) {
        String sql = "delete from pms_message where messageid = ?";
        jdbcTemplate.update(sql,new Object[]{id});
    }
}
