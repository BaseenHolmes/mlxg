package com.huaxing.mlxg.service;

import com.huaxing.mlxg.dao.FunctionDao;
import com.huaxing.mlxg.po.Function;

import java.util.List;

/**
 * @ClassName: FunctionService
 * @Description: TODO
 * @Author: Baseen
 * @Date: 2019/10/29 9:08
 * @Version: v1.0
 **/
public class FunctionService {

    private FunctionDao functionDao = new FunctionDao();

    /**
     * 查询所有功能
     *
     * @return
     */
    public List<Function> queryAllFunction() {
        return functionDao.queryAll();
    }

    /**
     * 增加功能
     *
     * @param moduleid
     * @param fname
     * @param fyouxianji
     * @param ftext
     * @param fbanbenhao
     */
    public void addFunction(String moduleid, String fname, String fyouxianji, String ftext, String fbanbenhao) {
        Function function = new Function();
        function.setModuleid(Long.parseLong(moduleid));
        function.setFname(fname);
        function.setFyouxianji(fyouxianji);
        function.setFtext(ftext);
        function.setFbanbenhao(fbanbenhao);
        functionDao.insert(function);
    }

    /**
     * 删除功能
     *
     * @param s
     */
    public void deleteFunction(String s) {
        functionDao.delete(Long.parseLong(s));
    }
}
