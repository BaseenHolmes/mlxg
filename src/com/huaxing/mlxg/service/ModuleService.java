package com.huaxing.mlxg.service;

import com.huaxing.mlxg.dao.ModuleDao;
import com.huaxing.mlxg.po.Module;

import java.util.List;

/**
 * @ClassName: ModuleService
 * @Description: TODO
 * @Author: Baseen
 * @Date: 2019/10/28 13:55
 * @Version: v1.0
 **/
public class ModuleService {

    private ModuleDao moduleDao = new ModuleDao();

    /**
     * 查询所有模块
     *
     * @return
     */
    public List<Module> queryAllModule() {
        return moduleDao.queryAll();
    }

    /**
     * 添加模块
     *
     * @param mname
     * @param mbiaoshi
     * @param myouxianji
     * @param prono
     * @param needid
     * @param mtext
     */
    public void doAddModule(String mname, String mbiaoshi, String myouxianji, String prono, String needid, String mtext) {
        Module module = new Module();
        module.setMname(mname);
        module.setMtext(mtext);
        module.setNeedid(Long.parseLong(needid));
        module.setMyouxianji(myouxianji);
        module.setMbiaoshi(mbiaoshi);
        module.setProjectid(Long.parseLong(prono));
        moduleDao.insert(module);
    }

    /**
     * 更新模块
     * @param mname
     * @param mbiaoshi
     * @param myouxianji
     * @param prono
     * @param needid
     * @param mtext
     */
    public void doUpdateModule(String mname, String mbiaoshi, String myouxianji, String prono, String needid, String mtext) {
        Module module = new Module();
        module.setMname(mname);
        module.setMtext(mtext);
        module.setNeedid(Long.parseLong(needid));
        module.setMyouxianji(myouxianji);
        module.setMbiaoshi(mbiaoshi);
        module.setProjectid(Long.parseLong(prono));
        moduleDao.update(module);
    }

    /**
     * 删除模块
     * @param moduleid
     */
    public void deleteByModuleId(long moduleid) {
        moduleDao.deleteByModuleId(moduleid);
    }

    /**
     * 根据模块id查询模块
     * @param id
     * @return
     */
    public Module showOneModule(String id) {
        return moduleDao.queryOne(Long.parseLong(id));
    }

    /**
     * 根据根据需求id查询所有需求下的模块
     *
     * @param needid
     * @return
     */
    public List<Module> queryModuleByNeedId(String needid) {
        return moduleDao.queryMuduleByNeedId(Long.parseLong(needid));
    }
}
