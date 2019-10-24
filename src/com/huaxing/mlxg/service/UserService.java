package com.huaxing.mlxg.service;

import com.huaxing.mlxg.dao.UserDao;
import com.huaxing.mlxg.po.User;

import java.util.List;

/**
 * @ClassName: UserService
 * @Description: TODO
 * @Author: Baseen
 * @Date: 2019/10/22 14:04
 * @Version: v1.0
 **/
public class UserService {

    private UserDao userDao = new UserDao();

    /**
     * 用户登录
     * @param username 用户输入的用户名
     * @param password 用户输入的密码
     * @return
     */
    public boolean login(String username,String password){
        boolean flag = false;
        User user = userDao.load(username);
        if(user != null && password.equals(user.getPassword())){
            flag = true;
        }
        return flag;
    }

    /**
     * 根据用户名查询userid，用于在登录成功之后放在session中
     * @param username
     * @return
     */
    public long queryUseridByUsername(String username){
        return userDao.load(username).getUserid();
    }

    /**
     * 检查用户名是否存在
     * @param username
     * @return
     */
    public String checkUsername(String username) {

        String result = "用户名已存在";
        
        User user = userDao.load(username);
        if(user == null){
            result = "用户名可用";
        }
        return result;
    }
}
