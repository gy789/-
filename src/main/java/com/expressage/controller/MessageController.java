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
import org.springframework.ui.Model;
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
        Users user = (Users)session.getAttribute("user");
        int readnumber = messageService.getMessageNumber(user.getUid(),0);
        session.setAttribute("readnumber",readnumber);
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
        Users user = (Users)session.getAttribute("user");
        int unreadnumber = messageService.getMessageNumber(user.getUid(),1);
        session.setAttribute("unreadnumber",unreadnumber);
        int flag = messageService.updateMessage(message_id);
        if (flag > 0){
            return Msg.success("成功");
        }
        return Msg.fail("失败");
    }

    @RequestMapping("/getMessage")
    public String GetMessageList(@Param("type")String type, HttpServletRequest request, Model model){
        HttpSession session = request.getSession();
        Users user = (Users)session.getAttribute("user");

        List<Message> messageList = messageService.getAllMessage(user.getUid(),Integer.parseInt(type));
        model.addAttribute("messageList",messageList);
        model.addAttribute("type",type);
        return "/expressage/mailbox";
    }
}
