package com.huaxing.mlxg.service;

import com.huaxing.mlxg.dao.PowerDao;
import com.huaxing.mlxg.po.Power;

import java.util.List;

/**
 * @ClassName: PowerService
 * @Description: TODO
 * @Author: Baseen
 * @Date: 2019/10/22 21:44
 * @Version: v1.0
 **/
public class PowerService {

    private PowerDao powerDao = new PowerDao();

    /**
     * 根据角色id查询该角色所有权限
     * @param roid
     * @return
     */
    public List<Power> queryPowerByRole(long roid){
        return powerDao.queryPowerByRole(roid);
    }

}
