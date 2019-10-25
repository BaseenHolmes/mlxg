package com.huaxing.mlxg.dao;

import com.huaxing.mlxg.po.Client;
import com.huaxing.mlxg.util.JdbcTemplate;
import com.huaxing.mlxg.util.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * @ClassName: ClientDao
 * @Description: TODO 客户信息持久层
 * @Author: Baseen
 * @Date: 2019/10/24 8:35
 * @Version: v1.0
 **/
public class ClientDao {

    private JdbcTemplate jdbcTemplate = new JdbcTemplate();

    /**
     * 查询所有客户信息
     *
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<Client> queryAllClient() {
        String sql = "select * from pms_client";
        return (List<Client>) jdbcTemplate.queryForList(sql, new RowMapper() {
            @Override
            public Object mapRow(ResultSet rs) throws SQLException {
                Client client = new Client();
                client.setClientid(rs.getLong("clientid"));
                client.setCname(rs.getString("cname"));
                client.setCper(rs.getString("cper"));
                client.setCphone(rs.getString("cphone"));
                client.setCaddress(rs.getString("caddress"));
                client.setCbeijing(rs.getString("cbeijing"));
                client.setCdate(rs.getString("cdate"));
                return client;
            }
        });
    }

    /**
     * 加载客户信息
     *
     * @return
     */
    public Client load(long clientid) {
        String sql = "select * from pms_client where clientid=?";
        return (Client) jdbcTemplate.queryForOne(sql, new Object[]{clientid}, new RowMapper() {
            @Override
            public Object mapRow(ResultSet rs) throws SQLException {
                Client client = new Client();
                client.setClientid(rs.getLong("clientid"));
                client.setCname(rs.getString("cname"));
                client.setCper(rs.getString("cper"));
                client.setCphone(rs.getString("cphone"));
                client.setCaddress(rs.getString("caddress"));
                client.setCbeijing(rs.getString("cbeijing"));
                client.setCdate(rs.getString("cdate"));
                return client;
            }
        });
    }

    /**
     * 添加客户
     *
     * @param client
     */
    public void insert(Client client) {
        String sql = "insert into pms_client values (client_id_seq.nextval,?,?,?,?,?,?)";
        jdbcTemplate.update(sql, new Object[]{client.getCname(), client.getCper(), client.getCphone(), client.getCaddress(), client.getCbeijing(), client.getCdate()});
    }

    /**
     * 根据clientid删除客户
     *
     * @param clientid
     */
    public void delete(long clientid) {
        String sql = "delete from pms_client where clientid=?";
        jdbcTemplate.update(sql, new Object[]{clientid});
    }


}
