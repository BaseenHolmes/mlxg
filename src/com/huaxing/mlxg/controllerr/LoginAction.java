package com.huaxing.mlxg.controllerr;

import com.huaxing.mlxg.service.RoleService;
import com.huaxing.mlxg.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @ClassName: LoginAction
 * @Description: TODO 用户登录模块
 * @Author: Baseen
 * @Date: 2019/10/22 10:48
 * @Version: v1.0
 **/
public class LoginAction {

    private UserService userService = new UserService();
    private RoleService roleService = new RoleService();

    /**
     * 用户登录
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    public String login(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String result = "用户名或密码错误";
        /*//判断验证码是否正确
        String checkCode = request.getParameter("checkCode");
        String checkCode1 = (String)request.getSession().getAttribute("check_code");
        if(!checkCode1.equalsIgnoreCase(checkCode)){
            result = "验证码错误";
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(result);
            return null;
        }*/

        //判断用户名密码是否正确
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean flag =userService.login(username,password);
        if(!flag){
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(result);
            return null;
        }

        //将该用户的用户名存入session中
        HttpSession session = request.getSession();
        session.setAttribute("username",username);

        //将该用户的userid存入session中
        long userid = userService.queryUseridByUsername(username);
        session.setAttribute("userid",userid);

        //将该用户的roleid存入session中，用于登录后主页的权限显示
        long roid = roleService.queryRoleByUsername(username);
        session.setAttribute("roid",roid);

        result = "登录成功，正在为您跳转页面...";
        response.setCharacterEncoding("utf-8");
        response.getWriter().write(result);
        return null;
    }

    public String exit(HttpServletRequest request, HttpServletResponse response){
        request.getSession().invalidate();
        return "/login.jsp";
    }



}
