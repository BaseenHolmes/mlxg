package com.huaxing.mlxg.controllerr;

import com.huaxing.mlxg.po.Need;
import com.huaxing.mlxg.po.Project;
import com.huaxing.mlxg.service.NeedService;
import com.huaxing.mlxg.service.ProjectService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @ClassName: NeedAction
 * @Description: TODO
 * @Author: Baseen
 * @Date: 2019/10/28 9:08
 * @Version: v1.0
 **/
public class NeedAction {

    private NeedService needService = new NeedService();
    private ProjectService projectService = new ProjectService();

    /**
     * 查询所有需求
     *
     * @param request
     * @param response
     * @return
     */
    public String showAllNeed(HttpServletRequest request, HttpServletResponse response) {
        List<Need> needs = needService.queryAllNeeds();
        request.setAttribute("needs", needs);
        return "/files/showneed.jsp";
    }

    /**
     * 查询所有项目,添加需求页面前访问
     *
     * @param request
     * @param response
     * @return
     */
    public String queryAllProject(HttpServletRequest request, HttpServletResponse response) {
        List<Project> projects = projectService.queryAllProject();
        request.setAttribute("projects", projects);
        return "/files/addneed.jsp";
    }

    /**
     * 添加需求
     *
     * @param request
     * @param response
     * @return
     */
    public String doAddNeed(HttpServletRequest request, HttpServletResponse response) {
        String projectid = request.getParameter("proname");
        String nname = request.getParameter("title");
        String ntext = request.getParameter("ms");
        needService.insertNeed(projectid, nname, ntext);
        return "/need.do?method=showAllNeed";
    }

    /**
     * 删除需求
     *
     * @param request
     * @param response
     * @return
     */
    public String deleteNeed(HttpServletRequest request, HttpServletResponse response) {
        String[] ids = request.getParameterValues("delid");
        for (String id : ids) {
            needService.deleteNeed(Long.parseLong(id));
        }
        return "/need.do?method=showAllNeed";
    }

    /**
     * 根据需求id查询需求，加载编辑需求页面前执行
     *
     * @param request
     * @param response
     * @return
     */
    public String editNeed(HttpServletRequest request, HttpServletResponse response) {
        String flag = request.getParameter("flag");
        String nno = request.getParameter("nno");
        Need need = needService.queryNeedByNeedid(nno);
        request.setAttribute("need", need);
        if (flag.equals("1")) {
            //编辑
            return "/files/editneed.jsp";
        } else {
            //查看
            return "/files/showoneneed.jsp";
        }

    }

    /**
     * 执行更新需求
     *
     * @param request
     * @param response
     * @return
     */
    public String doEditNeed(HttpServletRequest request, HttpServletResponse response) {
        String needid = request.getParameter("nno");
        String nname = request.getParameter("title");
        String ntext = request.getParameter("neirong");
        needService.updateNeed(needid, nname, ntext);
        return "/need.do?method=showAllNeed";
    }

}
