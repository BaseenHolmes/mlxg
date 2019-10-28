package com.huaxing.mlxg.dao;

import com.huaxing.mlxg.po.Project;
import com.huaxing.mlxg.util.JdbcTemplate;
import com.huaxing.mlxg.util.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * @ClassName: ProjectDao
 * @Description: TODO 项目持久层
 * @Author: Baseen
 * @Date: 2019/10/25 10:15
 * @Version: v1.0
 **/
public class ProjectDao {

    private JdbcTemplate jdbcTemplate = new JdbcTemplate();

    /**
     * 新增项目信息
     *
     * @param project
     */
    public void insert(Project project) {
        String sql = "insert into pms_project values (project_id_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql, new Object[]{project.getPname(), project.getClientid(), project.getUserid(), project.getPnumber(), project.getPstart(), project.getPyouxianji(), project.getPzhuangtai(), project.getPchengben(), project.getPyusuan(), project.getPend(), project.getPbeizhu()});
    }

    /**
     * 根据项目id修改项目信息
     *
     * @param project
     */
    public void update(Project project) {
        String sql = "update pms_project set pname = ?," +
                "                       clientid = ?," +
                "                       userid = ?," +
                "                       pnumber = ?," +
                "                       pstart = ?," +
                "                       pyouxianji = ?," +
                "                       pzhuangtai = ?," +
                "                       pchengben = ?," +
                "                       pyusuan = ?," +
                "                       pend = ?," +
                "                       pbeizhu = ? where projectid = ?";
        jdbcTemplate.update(sql, new Object[]{project.getPname(), project.getClientid(), project.getUserid(), project.getPnumber(), project.getPstart(), project.getPyouxianji(), project.getPzhuangtai(), project.getPchengben(), project.getPyusuan(), project.getPend(), project.getPbeizhu(), project.getProjectid()});
    }

    /**
     * 查询所有项目信息
     *
     * @return
     */
    @SuppressWarnings("unchecked")
    public List<Project> queryAll() {
        String sql = "select * from pms_project pp,pms_client pc,pms_user pu where pp.clientid=pc.clientid and pp.userid=pu.userid";
        return (List<Project>) jdbcTemplate.queryForList(sql, new RowMapper() {
            @Override
            public Object mapRow(ResultSet rs) throws SQLException {
                Project project = new Project();
                project.setProjectid(rs.getLong("projectid"));
                project.setPname(rs.getString("pname"));
                project.setClientid(rs.getLong("clientid"));
                project.setUserid(rs.getLong("userid"));
                project.setPnumber(rs.getLong("pnumber"));
                project.setPstart(rs.getString("pstart"));
                project.setPyouxianji(rs.getString("pyouxianji"));
                project.setPzhuangtai(rs.getString("pzhuangtai"));
                project.setCname(rs.getString("cname"));
                project.setUname(rs.getString("username"));
                project.setPyusuan(rs.getLong("pyusuan"));
                project.setPbeizhu(rs.getString("pbeizhu"));
                return project;
            }
        });
    }

    /**
     * 根据项目id查询项目信息
     *
     * @return
     */
    public Project queryProjectById(long projectId) {
        String sql = "select * from pms_project pp,pms_client pc,pms_user pu where pp.clientid=pc.clientid and pp.userid=pu.userid and projectid=?";
        return (Project) jdbcTemplate.queryForOne(sql, new Object[]{projectId}, new RowMapper() {
            @Override
            public Object mapRow(ResultSet rs) throws SQLException {
                Project project = new Project();
                project.setProjectid(rs.getLong("projectid"));
                project.setPname(rs.getString("pname"));
                project.setClientid(rs.getLong("clientid"));
                project.setUserid(rs.getLong("userid"));
                project.setPnumber(rs.getLong("pnumber"));
                project.setPstart(rs.getString("pstart"));
                project.setPyouxianji(rs.getString("pyouxianji"));
                project.setPzhuangtai(rs.getString("pzhuangtai"));
                project.setCname(rs.getString("cname"));
                project.setUname(rs.getString("username"));
                project.setPyusuan(rs.getLong("pyusuan"));
                project.setPbeizhu(rs.getString("pbeizhu"));
                return project;
            }
        });
    }

    /**
     * 根据id删除
     *
     * @param id
     */
    public void delete(long id) {
        String sql = "delete from pms_project where projectid=?";
        jdbcTemplate.update(sql, new Object[]{id});
    }
}
