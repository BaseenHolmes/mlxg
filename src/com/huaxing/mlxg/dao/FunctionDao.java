package com.huaxing.mlxg.dao;

import com.huaxing.mlxg.po.Function;
import com.huaxing.mlxg.util.JdbcTemplate;
import com.huaxing.mlxg.util.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * @ClassName: FunctionDao
 * @Description: TODO
 * @Author: Baseen
 * @Date: 2019/10/29 9:07
 * @Version: v1.0
 **/
public class FunctionDao implements RowMapper {

    private JdbcTemplate jdbcTemplate = new JdbcTemplate();

    @Override
    public Object mapRow(ResultSet rs) throws SQLException {
        Function function = new Function();
        function.setFunctionid(rs.getLong("functionid"));
        function.setFname(rs.getString("fname"));
        function.setFtext(rs.getString("ftext"));
        function.setFstart(rs.getDate("fstart"));
        function.setFbanbenhao(rs.getString("fbanbenhao"));
        function.setModuleid(rs.getLong("moduleid"));
        function.setModulename(rs.getString("mname"));
        function.setProjectid(rs.getLong("projectid"));
        function.setProjectname(rs.getString("pname"));
        function.setNeedid(rs.getLong("needid"));
        function.setNeedname(rs.getString("nname"));
        function.setFyouxianji(rs.getString("fyouxianji"));
        return function;
    }

    /**
     * 查询所有功能
     *
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<Function> queryAll() {
        String sql = "select functionid,fname,ftext,fstart,fbanbenhao,fyouxianji,pm.moduleid,pm.mname,pn.needid,pn.nname,pp.projectid,pp.pname from pms_functions pf, pms_module pm, pms_need pn, pms_project pp where pf.moduleid=pm.moduleid and pm.needid = pn.needid and pn.projectid = pp.projectid";
        return (List<Function>) jdbcTemplate.queryForList(sql, this);
    }

    /**
     * 根据功能id查询某个功能信息
     *
     * @param functionid
     * @return
     */
    public Function queryOne(long functionid) {
        String sql = "select functionid,fname,ftext,fstart,fbanbenhao,fyouxianji," +
                "       pm.moduleid,pm.mname,pn.needid,pn.nname,pp.projectid,pp.pname " +
                "       from pms_functions pf, pms_module pm, pms_need pn, pms_project pp" +
                "       where pf.moduleid=pm.moduleid and pm.needid = pn.needid and pn.projectid = pp.projectid" +
                "       and functionid=?";
        return (Function) jdbcTemplate.queryForOne(sql, new Object[]{functionid}, this);
    }

    /**
     * 根据功能id删除功能
     *
     * @param functionid
     */
    public void delete(long functionid) {
        String sql = "delete from pms_functions where functionid=?";
        jdbcTemplate.update(sql, new Object[]{functionid});
    }

    /**
     * 更新功能
     *
     * @param function
     */
    public void update(Function function) {
        String sql = "";
        jdbcTemplate.update(sql, new Object[]{});
    }

    /**
     * 增加功能
     *
     * @param function
     */
    public void insert(Function function) {
        String sql = "insert into pms_functions values (functions_id_seq.nextval,?,?,?,sysdate,?,?)";
        jdbcTemplate.update(sql, new Object[]{function.getFname(), function.getFtext(), function.getModuleid(), function.getFbanbenhao(), function.getFyouxianji()});
    }
}
