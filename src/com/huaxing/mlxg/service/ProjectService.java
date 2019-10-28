package com.huaxing.mlxg.service;

import com.huaxing.mlxg.dao.ClientDao;
import com.huaxing.mlxg.dao.ProjectDao;
import com.huaxing.mlxg.dao.UserDao;
import com.huaxing.mlxg.po.Client;
import com.huaxing.mlxg.po.Project;
import com.huaxing.mlxg.po.User;

import java.util.List;

/**
 * @ClassName: ProjectService
 * @Description: TODO 项目业务层
 * @Author: Baseen
 * @Date: 2019/10/25 10:15
 * @Version: v1.0
 **/
public class ProjectService {

    private ProjectDao projectDao = new ProjectDao();

    /**
     * 查询所有项目信息
     *
     * @return
     */
    public List<Project> queryAllProject() {
        return projectDao.queryAll();
    }

    /**
     * 根据项目id查询项目信息
     *
     * @param proid
     * @return
     */
    public Project queryProjectById(long proid) {
        return projectDao.queryProjectById(proid);
    }

    /**
     * 增加项目
     *
     * @param proname
     * @param clientno
     * @param promoney
     * @param pronum
     * @param proManager
     * @param prozhuangtai
     * @param probeginDate
     * @param proendDate
     * @param prochengben
     * @param proyouxianji
     * @param probeizhu
     */
    public void insertProject(String proname, String clientno, String promoney, String pronum, String proManager, String prozhuangtai, String probeginDate, String proendDate, String prochengben, String proyouxianji, String probeizhu) {
        Project project = new Project();
        project.setPname(proname);
        project.setClientid(Long.parseLong(clientno));
        project.setUserid(Long.parseLong(proManager));
        project.setPnumber(Long.parseLong(pronum));
        project.setPstart(probeginDate);
        project.setPyouxianji(proyouxianji);
        project.setPzhuangtai(prozhuangtai);
        project.setPchengben(Long.parseLong(promoney));
        project.setPyusuan(Long.parseLong(prochengben));
        project.setPend(proendDate);
        project.setPbeizhu(probeizhu);
        projectDao.insert(project);
    }

    /**
     * 修改项目
     *
     * @param proname
     * @param clientno
     * @param promoney
     * @param pronum
     * @param proManager
     * @param prozhuangtai
     * @param probeginDate
     * @param proendDate
     * @param prochengben
     * @param proyouxianji
     * @param probeizhu
     */
    public void updateProject(String id, String proname, String clientno, String promoney, String pronum, String proManager, String prozhuangtai, String probeginDate, String proendDate, String prochengben, String proyouxianji, String probeizhu) {
        Project project = new Project();
        project.setProjectid(Long.parseLong(id));
        project.setPname(proname);
        project.setClientid(Long.parseLong(clientno));
        project.setUserid(Long.parseLong(proManager));
        project.setPnumber(Long.parseLong(pronum));
        project.setPstart(probeginDate);
        project.setPyouxianji(proyouxianji);
        project.setPzhuangtai(prozhuangtai);
        project.setPchengben(Long.parseLong(promoney));
        project.setPyusuan(Long.parseLong(prochengben));
        project.setPend(proendDate);
        project.setPbeizhu(probeizhu);
        projectDao.update(project);
    }

    /**
     * 删除项目信息
     *
     * @param id
     */
    public void deleteProject(long id) {
        projectDao.delete(id);
    }
}
