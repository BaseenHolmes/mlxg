package com.huaxing.mlxg.controllerr;

import com.huaxing.mlxg.po.Client;
import com.huaxing.mlxg.service.ClientService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @ClassName: ClientAction
 * @Description: TODO 客户信息控制层
 * @Author: Baseen
 * @Date: 2019/10/24 8:34
 * @Version: v1.0
 **/
public class ClientAction {

    private ClientService clientService = new ClientService();

    /**
     * 查询所有客户信息
     *
     * @param request
     * @param response
     * @return
     */
    public String queryAllClient(HttpServletRequest request, HttpServletResponse response) {
        List<Client> clientlist = clientService.queryAllClient();
        request.setAttribute("clientlist", clientlist);
        return "/files/showclient.jsp";
    }

    /**
     * 添加客户
     *
     * @param request
     * @param response
     * @return
     */
    public String insertClient(HttpServletRequest request, HttpServletResponse response) {
        String clientname = request.getParameter("clientname");
        String cper = request.getParameter("cper");
        String ctel = request.getParameter("ctel");
        String caddr = request.getParameter("caddr");
        String cbackground = request.getParameter("cbackground");
        clientService.insertClient(clientname, cper, ctel, caddr, cbackground);
        return "/client.do?method=queryAllClient";
    }

    /**
     * 查询单条客户信息
     *
     * @param request
     * @param response
     * @return
     */
    public String queryOneClient(HttpServletRequest request, HttpServletResponse response) {
        long id = Long.parseLong(request.getParameter("id"));
        Client client = clientService.queryOneClient(id);
        request.setAttribute("client", client);
        return "/files/showoneclient.jsp";
    }

    /**
     * 删除单条客户信息
     *
     * @param request
     * @param response
     * @return
     */
    public String deleteClient(HttpServletRequest request, HttpServletResponse response) {
        String[] deletes = request.getParameterValues("deletes");
        try {
            for (String delete : deletes) {
                long id = Long.parseLong(delete);
                clientService.deleteClient(id);
            }
        } catch (Exception ignored) {
        }
        return "/client.do?method=queryAllClient";
    }


}
