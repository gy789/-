package com.expressage.controller;

import com.expressage.entity.Message;
import com.expressage.entity.Users;
import com.expressage.mapper.MessageMapper;
import com.expressage.service.MessageService;
import com.expressage.service.UserService;
import com.expressage.util.Msg;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/")
public class MessageController {
    
    @Autowired(required = false)
    private MessageService messageService;
    @Autowired(required = false)
    private UserService userService;

    @RequestMapping("/delMessage")
    @ResponseBody
    public Msg DeleteMessage(@Param("message_id")String[] message_id, HttpServletRequest request){
        HttpSession session = request.getSession();
        Users users = (Users)session.getAttribute("user");
        List<Message> unreadmessages = messageService.getAllMessage(users.getUid(),1);
        session.setAttribute("unreadmessages",unreadmessages);

        int flag = messageService.deleteMessage(message_id);
        if (flag > 0){
            return Msg.success("成功");
        }
        return Msg.fail("失败");
    }

    @RequestMapping("/updateMessage")
    @ResponseBody
    public Msg UpdateMessage(@Param("message_id")String[] message_id,HttpServletRequest request){
        HttpSession session = request.getSession();
        Users users = (Users)session.getAttribute("user");
        List<Message> unreadmessages = messageService.getAllMessage(users.getUid(),1);
        session.setAttribute("unreadmessages",unreadmessages);
        int flag = messageService.updateMessage(message_id);
        if (flag > 0){
            return Msg.success("成功");
        }
        return Msg.fail("失败");
    }
}
