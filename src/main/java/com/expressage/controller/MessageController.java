package com.expressage.controller;

import com.expressage.mapper.MessageMapper;
import com.expressage.util.Msg;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MessageController {
    
    @Autowired(required = false)
    private MessageMapper messageMapper;

    @RequestMapping("/delMessage")
    public Msg DeleteMessage(@Param("message_id")String message_id){
        int flag = messageMapper.deleteMessage(Integer.parseInt(message_id));
        if (flag > 0){
            return Msg.success("成功");
        }
        return Msg.fail("失败");
    }
}
