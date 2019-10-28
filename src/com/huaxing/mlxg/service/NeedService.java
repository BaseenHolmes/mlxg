package com.huaxing.mlxg.service;

import com.huaxing.mlxg.dao.NeedDao;
import com.huaxing.mlxg.po.Need;

import java.util.List;

/**
 * @ClassName: NeedService
 * @Description: TODO
 * @Author: Baseen
 * @Date: 2019/10/28 9:08
 * @Version: v1.0
 **/
public class NeedService {

    private NeedDao needDao = new NeedDao();

    /**
     * 查询所有需求
     *
     * @return
     */
    public List<Need> queryAllNeeds() {
        return needDao.queryAll();
    }

    /**
     * 添加需求
     *
     * @param projectid
     * @param nname
     * @param ntext
     */
    public void insertNeed(String projectid, String nname, String ntext) {
        Need need = new Need();
        need.setProjectid(Long.parseLong(projectid));
        need.setNname(nname);
        need.setNtext(ntext);
        needDao.insert(need);
    }

    /**
     * 根据需求id删除需求
     *
     * @param id
     */
    public void deleteNeed(long id) {
        needDao.delete(id);
    }

    public Need queryNeedByNeedid(String nno) {
        return needDao.queryOne(Long.parseLong(nno));
    }

    public void updateNeed(String needid, String nname, String ntext) {
        Need need = new Need();
        need.setNeedid(Long.parseLong(needid));
        need.setNname(nname);
        need.setNtext(ntext);
        needDao.update(need);
    }
}
