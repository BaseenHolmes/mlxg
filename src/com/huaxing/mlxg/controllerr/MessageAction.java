package com.huaxing.mlxg.controllerr;

import com.huaxing.mlxg.dao.UserDao;
import com.huaxing.mlxg.po.Message;
import com.huaxing.mlxg.po.User;
import com.huaxing.mlxg.service.MessageService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * @ClassName: MessageAction
 * @Description: TODO
 * @Author: Baseen
 * @Date: 2019/10/23 8:51
 * @Version: v1.0
 **/
public class MessageAction {

    private MessageService messageService = new MessageService();
    private UserDao userDao = new UserDao();

    /**
     * 加载发送消息页面
     * @param request
     * @param response
     * @return
     */
    public String showSendMessage(HttpServletRequest request, HttpServletResponse response) {

        //加载收件人列表
        List<User> recipients = messageService.queryRecipient();
        request.setAttribute("recipients", recipients);
        return "/files/sendmessage.jsp";
    }

    /**
     * 执行发送消息
     * @param request
     * @param response
     * @return
     * @throws UnsupportedEncodingException
     */
    public String doSendMessage(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        String biaoti = request.getParameter("biaoti");
        long senderid = (Long) request.getSession().getAttribute("userid");
        String recipient = request.getParameter("recipient");
        String text = request.getParameter("textarea");
        messageService.sendMessage(biaoti, senderid, recipient, text);

        return "/files/mainframe.jsp";
    }

    /**
     * 查询当前用户的发件箱
     * @param request
     * @param response
     * @return
     * @throws UnsupportedEncodingException
     */
    public String showSenderMessage(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        long userid = (long)request.getSession().getAttribute("userid");
        List<Message> messageList = messageService.querySenderMessageBySender(userid);
        request.setAttribute("messageList",messageList);
        return "/files/sendermessage.jsp";

    }

    /**
     * 查询当前用户的收件箱
     * @param request
     * @param response
     * @return
     * @throws UnsupportedEncodingException
     */
    public String showReceiverMessage(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        long userid = (long)request.getSession().getAttribute("userid");
        List<Message> messageList = messageService.queryReceiveMessageByReceiver(userid);
        request.setAttribute("messageList",messageList);
        return "/files/recievemessage.jsp";
    }

    /**
     * 查询所有消息
     * @param request
     * @param response
     * @return
     */
    public String showAllMessage(HttpServletRequest request, HttpServletResponse response){
        List<Message> messageList = messageService.queryAllMessage();
        request.setAttribute("messageList",messageList);
        return "/files/allmessage.jsp";
    }

    /**
     * 删除消息
     * @param request
     * @param response
     * @return
     * @throws UnsupportedEncodingException
     */
    public String deleteMessage(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        Long id = Long.parseLong(request.getParameter("id"));
        messageService.deleteMessage(id);
        String flag = request.getParameter("flag");

        if(flag.equals("send")){
            return "/files/sendermessage.jsp";
        }else if(flag.equals("recive")){
            return "/files/recievemessage.jsp";
        }else{
            return "/files/allmessage.jsp";
        }
    }



}
