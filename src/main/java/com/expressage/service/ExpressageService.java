package com.expressage.service;

import com.expressage.entity.Expressage;
import com.expressage.entity.Users;

import java.util.List;

public interface ExpressageService {
    int addExpressageInfo(Expressage expressage);//添加快递信息
    List<Expressage> getAllExpressageInfo();//得到所有的快递信息
    List<Expressage> getMyExpressageInfo(Users user);//得到我的快递信息
    Expressage getOneExpressageInfo(int expressage_id);//得到一份快递信息

}
