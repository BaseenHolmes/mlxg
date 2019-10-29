package com.huaxing.mlxg.dao;

import com.huaxing.mlxg.po.Need;
import com.huaxing.mlxg.util.JdbcTemplate;
import com.huaxing.mlxg.util.RowMapper;
import com.sun.scenario.effect.impl.sw.java.JSWBlend_COLOR_BURNPeer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * @ClassName: NeedDao
 * @Description: TODO 需求持久层
 * @Author: Baseen
 * @Date: 2019/10/28 9:08
 * @Version: v1.0
 **/
public class NeedDao implements RowMapper {

    private JdbcTemplate jdbcTemplate = new JdbcTemplate();

    @Override
    public Object mapRow(ResultSet rs) throws SQLException {
        Need need = new Need();
        need.setNeedid(rs.getLong("needid"));
        need.setNname(rs.getString("nname"));
        need.setNtext(rs.getString("ntext"));
        need.setProjectid(rs.getLong("projectid"));
        need.setNstart(rs.getDate("nstart"));
        need.setNupdate(rs.getDate("nupdate"));
        need.setProjectname(rs.getString("pname"));
        return need;
    }

    /**
     * 查询所有需求
     *
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<Need> queryAll() {
        String sql = "select * from pms_need pn,pms_project pp where pn.projectid = pp.projectid";
        return (List<Need>) jdbcTemplate.queryForList(sql, this);
    }

    /**
     * 根据需求id删除
     *
     * @param needid
     */
    public void delete(long needid) {
        String sql = "delete from pms_need where needid=?";
        jdbcTemplate.update(sql, new Object[]{needid});
    }

    /**
     * 根据需求id查询
     *
     * @param needid
     * @return
     */
    public Need queryOne(long needid) {
        String sql = "select * from pms_need pn,pms_project pp where pn.projectid = pp.projectid and needid=?";
        return (Need) jdbcTemplate.queryForOne(sql, new Object[]{needid}, this);
    }

    /**
     * 新增需求
     */
    public void insert(Need need) {
        String sql = "insert into pms_need values (need_id_seq.nextval,?,?,?,sysdate,sysdate)";
        jdbcTemplate.update(sql, new Object[]{need.getNname(), need.getNtext(), need.getProjectid()});
    }

    /**
     * 修改需求
     *
     * @param need
     */
    public void update(Need need) {
        String sql = "update pms_need set nname=?,ntext=?,nupdate=sysdate where needid=?";
        jdbcTemplate.update(sql, new Object[]{need.getNname(), need.getNtext(), need.getNeedid()});
    }

    /**
     * 根据项目id查询需求
     *
     * @param projectid
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<Need> queryNeedByProjectid(long projectid) {
        String sql = "select * from pms_need pn,pms_project pp where pn.projectid = pp.projectid and pp.projectid=?";
        return (List<Need>) jdbcTemplate.queryForList(sql, new Object[]{projectid}, new RowMapper() {
            @Override
            public Object mapRow(ResultSet rs) throws SQLException {
                Need need = new Need();
                need.setNeedid(rs.getLong("needid"));
                need.setNname(rs.getString("nname"));
                need.setNtext(rs.getString("ntext"));
                need.setProjectid(rs.getLong("projectid"));
                need.setNstart(rs.getDate("nstart"));
                need.setNupdate(rs.getDate("nupdate"));
                need.setProjectname(rs.getString("pname"));
                return need;
            }
        });
    }


}
