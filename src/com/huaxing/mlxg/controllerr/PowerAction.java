package com.huaxing.mlxg.controllerr;

import com.huaxing.mlxg.po.Power;
import com.huaxing.mlxg.service.PowerService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @ClassName: PowerAction
 * @Description: TODO
 * @Author: Baseen
 * @Date: 2019/10/22 15:09
 * @Version: v1.0
 **/
public class PowerAction {

    private PowerService powerService = new PowerService();

    /**
     * 根据角色id查询该角色的全部权限
     * @param request
     * @param response
     * @return 该用户拥有的权限列表
     */
    public String queryPowerByRole(HttpServletRequest request, HttpServletResponse response){

        //从session中获取角色id
        long roid = (Long)request.getSession().getAttribute("roid");

        //利用角色id查询该角色所具有的全部权限
        List<Power> poidList = powerService.queryPowerByRole(roid);

        request.setAttribute("poidList",poidList);
        return "/files/left.jsp";
    }

}
