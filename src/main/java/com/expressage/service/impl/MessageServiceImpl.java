package com.expressage.service.impl;

import com.expressage.entity.Message;
import com.expressage.mapper.MessageMapper;
import com.expressage.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("messageService")
public class MessageServiceImpl implements MessageService {

    @Autowired(required = false)
    private MessageMapper messageMapper;

    @Override
    public List<Message> getAllMessage(int uid,int type) {
        return messageMapper.getAllMessage(uid,type);
    }

    @Override
    public int addMessage(Message message) {
        return messageMapper.addMessage(message);
    }

    @Override
    public int updateMessage(String[] message_id) {
        return messageMapper.updateMessage(message_id);
    }

    @Override
    public int deleteMessage(String[] message_id) {
        return messageMapper.deleteMessage(message_id);
    }
}
