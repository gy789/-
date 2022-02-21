package com.expressage.service;

import com.expressage.entity.Expressage;
import com.expressage.entity.ExpressageStatus;
import com.expressage.entity.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ExpressageService {
    int addExpressageInfo(Expressage expressage);//添加快递信息
    List<Expressage> getAllExpressageInfo(@Param("type")int type);//得到所有的快递信息
    List<Expressage> getMyExpressageInfo(Users user);//得到我的快递信息
    Expressage getOneExpressageInfo(int expressage_id);//得到一份快递信息
    int updateExpressageInfo(@Param("expressage_id")int expressage_id, @Param("type")int type,String message,Users user);//修改快递状态，type修改类型{0：开始配送，1：配送完成，2：确认收货，3：确认支付}
    int addExpressageStatus(ExpressageStatus status);//添加快递状态信息
    int updateExpressageStatus(@Param("expressage_id")int expressage_id,@Param("type")int type);//修改状态节点表
    ExpressageStatus getOneExpressageStatus(int expressage_id);//得到一份快递信息状态

}
