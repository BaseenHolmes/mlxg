package com.huaxing.mlxg.controllerr;

import com.huaxing.mlxg.po.Function;
import com.huaxing.mlxg.po.Module;
import com.huaxing.mlxg.po.Need;
import com.huaxing.mlxg.po.Project;
import com.huaxing.mlxg.service.FunctionService;
import com.huaxing.mlxg.service.ModuleService;
import com.huaxing.mlxg.service.NeedService;
import com.huaxing.mlxg.service.ProjectService;
import org.codehaus.jackson.map.ObjectMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @ClassName: FunctionAction
 * @Description: TODO
 * @Author: Baseen
 * @Date: 2019/10/29 9:04
 * @Version: v1.0
 **/
public class FunctionAction {

    private FunctionService functionService = new FunctionService();
    private ModuleService moduleService = new ModuleService();
    private ProjectService projectService = new ProjectService();
    private ModuleAction moduleAction = new ModuleAction();

    /**
     * 查询所有功能
     *
     * @return
     */
    public String showAllFunction(HttpServletRequest request, HttpServletResponse response) {
        List<Function> functionList = functionService.queryAllFunction();
        request.setAttribute("functionList", functionList);
        return "/files/showfunction.jsp";
    }

    /**
     * 显示添加项目页面，在添加项目页面之前加载
     *
     * @param request
     * @param response
     * @return
     */
    public String addFunction(HttpServletRequest request, HttpServletResponse response) {
        List<Project> projectList = projectService.queryAllProject();
        request.setAttribute("projectList", projectList);
        return "/files/addfunction.jsp";
    }

    /**
     * 根据项目id查询需求
     */
    public void showNeedByProjectId(HttpServletRequest request, HttpServletResponse response) throws IOException {
        moduleAction.queryNeedsByProjectid(request, response);
    }

    /**
     * 根据需求id查询模块
     *
     * @param request
     * @param response
     * @throws IOException
     */
    public void showModuleByNeedId(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String needid = request.getParameter("xuqiu");
        List<Module> modules = moduleService.queryModuleByNeedId(needid);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(modules);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }

    /**
     * 增加功能
     *
     * @param request
     * @param response
     * @return
     */
    public String doAddFunction(HttpServletRequest request, HttpServletResponse response) {
        String moduleid = request.getParameter("mokuai");
        String fname = request.getParameter("gname");
        String fyouxianji = request.getParameter("miss");
        String ftext = request.getParameter("miao");
        String fbanbenhao = request.getParameter("hao");
        functionService.addFunction(moduleid, fname, fyouxianji, ftext, fbanbenhao);
        return "function.do?method=showAllFunction";

    }

    /**
     * 删除功能
     *
     * @param request
     * @param response
     * @return
     */
    public String deleteFunction(HttpServletRequest request, HttpServletResponse response) {
        String[] id = request.getParameterValues("delid");
        for (String s : id) {
            functionService.deleteFunction(s);
        }
        return "function.do?method=showAllFunction";
    }


}
