package com.expressage.mapper;

import com.expressage.entity.Expressage;
import com.expressage.entity.ExpressageStatus;
import com.expressage.entity.Users;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface ExpressageMapper {
    int addExpressageInfo(Expressage expressage);//添加快递信息
    List<Expressage> getAllExpressageInfo(@Param("type") int type,@Param("expressage_logistics_company")String expressage_logistics_company,@Param("role")String role);//得到所有的快递信息(0:所有快递，1：待接收快递，2：快递员查询物流公司快递)
    List<Expressage> getMyExpressageInfo(Users user);//得到我的快递信息
    Expressage getOneExpressageInfo(int expressage_id);//得到一份快递信息
    int updateExpressageInfo(@Param("expressage_id")int expressage_id,@Param("type")int type,String message,Users user);//修改快递状态，type修改类型{0：开始配送，1：配送完成，2：确认收货，3：确认支付}
    int updateExpressageStatus(@Param("expressage_id")int expressage_id,@Param("type")int type);//修改状态节点表
    ExpressageStatus getOneExpressageStatus(int expressage_id);//得到一份快递信息状态
    int updateExpressage(Expressage expressage);//修改快递详细信息
    int delExpressage(int expressage_id);//删除快递详细（取消快递）
    int getMonExpressage(@Param("firstDay")String firstDay,@Param("lastDay")String lastDay,@Param("type")int type);//获取本月的快递,type{0: 全部，1: 已完成，2：待配送}
}
