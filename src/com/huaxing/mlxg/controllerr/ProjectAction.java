package com.huaxing.mlxg.controllerr;

import com.huaxing.mlxg.dao.ProjectDao;
import com.huaxing.mlxg.po.Client;
import com.huaxing.mlxg.po.Project;
import com.huaxing.mlxg.po.User;
import com.huaxing.mlxg.service.ClientService;
import com.huaxing.mlxg.service.ProjectService;
import com.huaxing.mlxg.service.UserService;
import com.huaxing.mlxg.util.DateUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @ClassName: ProjectAction
 * @Description: TODO
 * @Author: Baseen
 * @Date: 2019/10/25 10:15
 * @Version: v1.0
 **/
public class ProjectAction {

    private ProjectService projectService = new ProjectService();
    private UserService userService = new UserService();
    private ClientService clientService = new ClientService();

    /**
     * 显示所有项目基本信息
     *
     * @param request
     * @param response
     * @return
     */
    public String queryAllProject(HttpServletRequest request, HttpServletResponse response) {

        List<Project> projects = projectService.queryAllProject();
        request.setAttribute("projects", projects);
        return "/files/showproject.jsp";
    }

    /**
     * 加载添加项目页面
     *
     * @param request
     * @param response
     * @return
     */
    public String showAddProject(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.queryProjectLeader();
        List<Client> clientList = clientService.queryAllClient();
        request.setAttribute("userList", userList);
        request.setAttribute("clientList", clientList);
        return "/files/addproject.jsp";
    }

    /**
     * 加载编辑项目页
     *
     * @param request
     * @param response
     * @return
     */
    public String editProject(HttpServletRequest request, HttpServletResponse response) {
        long projectId = Long.parseLong(request.getParameter("id"));
        List<User> userList = userService.queryProjectLeader();
        List<Client> clientList = clientService.queryAllClient();
        Project project = projectService.queryProjectById(projectId);
        request.setAttribute("userList", userList);
        request.setAttribute("clientList", clientList);
        request.setAttribute("project", project);
        request.setAttribute("id", projectId);
        return "/files/editproject.jsp";
    }

    /**
     * 添加项目
     *
     * @param request
     * @param response
     * @return
     */
    public String doAddProject(HttpServletRequest request, HttpServletResponse response) {
        String proname = request.getParameter("proname");
        String clientno = request.getParameter("clientno");
        String promoney = request.getParameter("promoney");
        String pronum = request.getParameter("pronum");
        String proManager = request.getParameter("proManager");
        String prozhuangtai = request.getParameter("proidcomplete");
        String probeginDate = request.getParameter("probeginDate");
        String proendDate = request.getParameter("proendDate");
        String prochengben = request.getParameter("prozmoney");
        String proyouxianji = request.getParameter("promission");
        String probeizhu = request.getParameter("probeizhu");
        projectService.insertProject(proname, clientno, promoney, pronum, proManager, prozhuangtai, probeginDate, proendDate, prochengben, proyouxianji, probeizhu);
        return "project.do?method=queryAllProject";
    }

    /**
     * 修改项目
     *
     * @param request
     * @param response
     * @return
     */
    public String doEditProject(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String proname = request.getParameter("proname");
        String clientno = request.getParameter("clientid");
        String promoney = request.getParameter("promoney");
        String pronum = request.getParameter("pronum");
        String proManager = request.getParameter("proManager");
        String prozhuangtai = request.getParameter("proidcomplete");
        String probeginDate = request.getParameter("probeginDate");
        String proendDate = request.getParameter("proendDate");
        String prochengben = request.getParameter("prozmoney");
        String proyouxianji = request.getParameter("promission");
        String probeizhu = request.getParameter("probeizhu");
        projectService.updateProject(id, proname, clientno, promoney, pronum, proManager, prozhuangtai, probeginDate, proendDate, prochengben, proyouxianji, probeizhu);
        return "project.do?method=queryAllProject";
    }

    /**
     * 删除项目信息
     *
     * @param request
     * @return
     */
    public String doDeleteProject(HttpServletRequest request, HttpServletResponse response) {
        String[] ids = request.getParameterValues("delid");
        for (String id : ids) {
            projectService.deleteProject(Long.parseLong(id));
        }
        return "project.do?method=queryAllProject";
    }

    /**
     * 根据项目id查看项目
     *
     * @param request
     * @param response
     * @return
     */
    public String showOneProject(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        String id = request.getParameter("id");
        Project project = projectService.queryProjectById(Long.parseLong(id));
        request.setAttribute("project", project);
        //获取当前时间并转换成util类型date
        java.util.Date curDate = DateUtil.getCurrentDateToUtilDate();
        //获取项目计划完成时间并转换成util类型date
        java.util.Date endDate = DateUtil.getStringDateToUtilDate(project.getPend());
        int a = DateUtil.compareToDate(curDate, endDate);
        if (a < 0) {
            request.setAttribute("chaoqila", "否");
        } else {
            request.setAttribute("chaoqila", "是");
        }
        return "/files/showoneproject.jsp";
    }


}
