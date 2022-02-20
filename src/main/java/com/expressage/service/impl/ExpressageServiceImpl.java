package com.expressage.service.impl;

import com.expressage.entity.Expressage;
import com.expressage.entity.Users;
import com.expressage.mapper.ExpressageMapper;
import com.expressage.service.ExpressageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("expressageService")
public class ExpressageServiceImpl implements ExpressageService {

    @Autowired(required = false)
    private ExpressageMapper expressageMapper;

    @Override
    public int addExpressageInfo(Expressage expressage) {
        return expressageMapper.addExpressageInfo(expressage);
    }

    @Override
    public List<Expressage> getAllExpressageInfo(int type) {
        return expressageMapper.getAllExpressageInfo(type);
    }

    @Override
    public List<Expressage> getMyExpressageInfo(Users user) {
        return expressageMapper.getMyExpressageInfo(user);
    }

    @Override
    public Expressage getOneExpressageInfo(int expressage_id) {
        return expressageMapper.getOneExpressageInfo(expressage_id);
    }

    @Override
    public int updateExpressageInfo(int expressage_id, int type,Users user) {
        return expressageMapper.updateExpressageInfo(expressage_id,type,user);
    }

}
