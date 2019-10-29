package com.huaxing.mlxg.controllerr;

import com.huaxing.mlxg.po.Module;
import com.huaxing.mlxg.po.Need;
import com.huaxing.mlxg.po.Project;
import com.huaxing.mlxg.service.ModuleService;
import com.huaxing.mlxg.service.NeedService;
import com.huaxing.mlxg.service.ProjectService;
import org.codehaus.jackson.map.ObjectMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @ClassName: ModuleAction
 * @Description: TODO
 * @Author: Baseen
 * @Date: 2019/10/28 13:55
 * @Version: v1.0
 **/
public class ModuleAction {

    private ModuleService moduleService = new ModuleService();
    private ProjectService projectService = new ProjectService();
    private NeedService needService = new NeedService();

    /**
     * 显示所有模块
     *
     * @param request
     * @param response
     * @return
     */
    public String showAllModule(HttpServletRequest request, HttpServletResponse response) {
        List<Module> modules = moduleService.queryAllModule();
        request.setAttribute("module", modules);
        return "/files/showmodule.jsp";
    }

    /**
     * 添加和编辑页面前加载此方法，查询所属项目和所属需求
     *
     * @param request
     * @param response
     * @return
     */
    public String addModule(HttpServletRequest request, HttpServletResponse response) {
        String flag = request.getParameter("flag");
        List<Project> projects = projectService.queryAllProject();
        request.setAttribute("projects", projects);
        String path = "";
        if ("editmokuai".equals(flag)) {
            String id = request.getParameter("id");
            Module module = moduleService.showOneModule(id);
            request.setAttribute("module", module);
            path = "/files/editmodule.jsp";
        }
        if ("add".equals(flag)) {
            path = "/files/addmodule.jsp";
        }
        return path;
    }

    /**
     * 根据项目id查询该项目下所有需求
     *
     * @param request
     * @param response
     * @throws IOException
     */
    public void queryNeedsByProjectid(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String projectid = request.getParameter("prono");
        List<Need> needs = needService.queryNeedByProjectid(projectid);
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(needs);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }

    /**
     * 新增模块
     *
     * @param request
     * @param response
     * @return
     */
    public String doAddModule(HttpServletRequest request, HttpServletResponse response) {
        String mname = request.getParameter("moname");
        String mbiaoshi = request.getParameter("mobiaozhi");
        String myouxianji = request.getParameter("modmission");
        String projectid = request.getParameter("prono");
        String needid = request.getParameter("needid");
        String mtext = request.getParameter("moddescription");
        String flag = request.getParameter("flag");
        if ("add".equals(flag)) {
            moduleService.doAddModule(mname, mbiaoshi, myouxianji, projectid, needid, mtext);
        } else if ("update".equals(flag)) {
            moduleService.doUpdateModule(mname, mbiaoshi, myouxianji, projectid, needid, mtext);
        }
        return "module.do?method=showAllModule";
    }

    /**
     * 删除模块
     *
     * @param request
     * @param response
     * @return
     */
    public String deleteModule(HttpServletRequest request, HttpServletResponse response) {
        String[] ids = request.getParameterValues("delid");
        for (String id : ids) {
            moduleService.deleteByModuleId(Long.parseLong(id));
        }
        return "module.do?method=showAllModule";
    }

    /**
     * 查看单个模块
     *
     * @param request
     * @param response
     * @return
     */
    public String showOneModule(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Module module = moduleService.showOneModule(id);
        request.setAttribute("module", module);
        return "/files/showonemodule.jsp";
    }


}
