package com.huaxing.mlxg.controllerr;

import com.huaxing.mlxg.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @ClassName: UserAction
 * @Description: TODO
 * @Author: Baseen
 * @Date: 2019/10/22 10:50
 * @Version: v1.0
 **/
public class UserAction {

    private UserService userService = new UserService();

    /**
     * 检查用户名是否存在
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    public String checkUsername(HttpServletRequest request , HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String s = userService.checkUsername(username);
        response.getWriter().write("s");
        return null;
    }



}
