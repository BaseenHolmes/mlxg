package com.huaxing.mlxg.service;

import com.huaxing.mlxg.dao.MessageDao;
import com.huaxing.mlxg.dao.UserDao;
import com.huaxing.mlxg.po.Message;
import com.huaxing.mlxg.po.User;

import java.util.List;

/**
 * @ClassName: MessageService
 * @Description: TODO
 * @Author: Baseen
 * @Date: 2019/10/23 8:52
 * @Version: v1.0
 **/
public class MessageService {

    private MessageDao messageDao = new MessageDao();
    private UserDao userDao = new UserDao();

    /**
     * 保存要发送的消息
     * @param biaoti
     * @param recipient
     * @param text
     */
    public void sendMessage(String biaoti,long senderid, String recipient, String text) {

        //根据收件人名查询收件人id
        Long recipientid = userDao.load(recipient).getUserid();

        messageDao.insert(biaoti,senderid,recipientid,text);
    }

    /**
     * 根据userid查询收件人列表
     * @return
     */
    public List<User> queryRecipient() {
        return userDao.queryAllUser();
    }

    /**
     * 根据当前用户id查询发件箱
     * @param userid
     * @return
     */
    public List<Message> querySenderMessageBySender(long userid) {
        return messageDao.querySenderMessageByUserid(userid);
    }

    /**
     * 根据当前用户id查询收件箱
     * @param userid
     * @return
     */
    public List<Message> queryReceiveMessageByReceiver(long userid){
        return messageDao.queryReceiverMessageByUserid(userid);
    }

    /**
     * 查询所有消息
     * @return
     */
    public List<Message> queryAllMessage(){
        return messageDao.queryAllMessage();
    }

    /**
     * 删除消息
     * @param id
     */
    public void deleteMessage(Long id) {
        messageDao.deleteMessage(id);
    }
}
