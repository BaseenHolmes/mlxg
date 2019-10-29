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

    public Module queryModuleByModuleid(String id) {
        return moduleDao.queryOne(Long.parseLong(id));
    }

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

    public void deleteByModuleId(long moduleid) {
        moduleDao.deleteByModuleId(moduleid);
    }

    public Module showOneModule(String id) {
        return moduleDao.queryOne(Long.parseLong(id));
    }
}
