package com.huaxing.mlxg.service;

import com.huaxing.mlxg.dao.UserDao;
import com.huaxing.mlxg.po.User;

/**
 * @ClassName: RoleService
 * @Description: TODO
 * @Author: Baseen
 * @Date: 2019/10/22 21:44
 * @Version: v1.0
 **/
public class RoleService {

    private UserDao userDao = new UserDao();

    /**
     * 根据角色名获取角色id，用于登录后显示权限
     * @param username
     * @return
     */
    public long queryRoleByUsername(String username){
        User user = userDao.load(username);
        return user.getRoid();
    }


}
