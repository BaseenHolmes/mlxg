package com.huaxing.mlxg.service;

import com.huaxing.mlxg.dao.ClientDao;
import com.huaxing.mlxg.po.Client;
import com.huaxing.mlxg.util.DateUtil;

import java.sql.Date;
import java.util.List;

/**
 * @ClassName: ClientService
 * @Description: TODO 客户信息业务层
 * @Author: Baseen
 * @Date: 2019/10/24 8:35
 * @Version: v1.0
 **/
public class ClientService {

    private ClientDao clientDao = new ClientDao();

    /**
     * 查询所有用户
     *
     * @return
     */
    public List<Client> queryAllClient() {
        return clientDao.queryAllClient();
    }

    public void insertClient(String clientname, String cper, String ctel, String caddr, String cbackground) {
        Client client = new Client();
        client.setCname(clientname);
        client.setCper(cper);
        client.setCphone(ctel);
        client.setCaddress(caddr);
        client.setCbeijing(cbackground);
        client.setCdate(DateUtil.getCurrentDateNoHour());
        clientDao.insert(client);
    }

    /**
     * 查询单个客户信息
     *
     * @param id
     * @return
     */
    public Client queryOneClient(long id) {
        return clientDao.load(id);
    }

    /**
     * 删除单条客户信息
     *
     * @param id
     */
    public void deleteClient(long id) {
        clientDao.delete(id);
    }
}
