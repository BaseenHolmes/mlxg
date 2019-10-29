package com.huaxing.mlxg.dao;

import com.huaxing.mlxg.po.Module;
import com.huaxing.mlxg.util.JdbcTemplate;
import com.huaxing.mlxg.util.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * @ClassName: ModuleDao
 * @Description: TODO 模块持久层
 * @Author: Baseen
 * @Date: 2019/10/28 13:55
 * @Version: v1.0
 **/
public class ModuleDao implements RowMapper {

    private JdbcTemplate jdbcTemplate = new JdbcTemplate();

    @Override
    public Object mapRow(ResultSet rs) throws SQLException {
        Module module = new Module();
        module.setModuleid(rs.getLong("moduleid"));
        module.setMname(rs.getString("mname"));
        module.setMtext(rs.getString("mtext"));
        module.setMstart(rs.getDate("mstart"));
        module.setMupdate(rs.getDate("mupdate"));
        module.setMyouxianji(rs.getString("myouxianji"));
        module.setNeedid(rs.getLong("needid"));
        module.setNeedname(rs.getString("nname"));
        module.setProjectid(rs.getLong("projectid"));
        module.setProjectname(rs.getString("pname"));
        module.setMbiaoshi(rs.getString("mbiaoshi"));
        return module;
    }

    /**
     * 查询所有模块
     *
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<Module> queryAll() {
        String sql = "select * from pms_module pm,pms_need pn,pms_project pp where pm.needid=pn.needid and pn.projectid=pp.projectid";
        return (List<Module>) jdbcTemplate.queryForList(sql, this);
    }

    /**
     * 根据id查询单个模块
     *
     * @param moduleid
     * @return
     */
    public Module queryOne(long moduleid) {
        String sql = "select * from pms_module pm,pms_need pn,pms_project pp where pm.needid=pn.needid and pn.projectid=pp.projectid and moduleid=?";
        return (Module) jdbcTemplate.queryForOne(sql, new Object[]{moduleid}, this);
    }

    /**
     * 新增
     *
     * @param module
     */
    public void insert(Module module) {
        String sql = "insert into pms_module values (module_id_seq.nextval,?,?,?,?,sysdate,sysdate,?)";
        jdbcTemplate.update(sql, new Object[]{module.getMname(), module.getMtext(), module.getNeedid(), module.getMyouxianji(), module.getMbiaoshi()});
    }

    /**
     * 更新
     *
     * @param module
     */
    public void update(Module module) {
        String sql = "update pms_module set mname=?,mbiaoshi=?,mupdate=sysdate,myouxianji=?,needid=?,mtext=?";
        jdbcTemplate.update(sql, new Object[]{module.getMname(), module.getMbiaoshi(), module.getMyouxianji(), module.getNeedid(), module.getMtext()});
    }

    /**
     * 根据模块id删除
     *
     * @param moduleid
     */
    public void deleteByModuleId(long moduleid) {
        String sql = "delete from pms_module where moduleid=?";
        jdbcTemplate.update(sql, new Object[]{moduleid});
    }

    /**
     * 根据需求id查询模块
     *
     * @param needid
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<Module> queryMuduleByNeedId(long needid) {
        String sql = "select * from pms_module pm,pms_need pn,pms_project pp where pm.needid=pn.needid and pn.projectid=pp.projectid and pm.needid=?";
        return (List<Module>) jdbcTemplate.queryForList(sql, new Object[]{needid}, this);
    }
}
