package com.expressage.service;

import com.expressage.entity.ExpressageCompany;

import java.util.List;

public interface CompanyService {
    List<ExpressageCompany> getAllCompany();//得到所有的快递公司
    int delCompany(int expressagecompany_id);//删除公司
    int addCompanyInfo(ExpressageCompany company);//添加快递公司
    ExpressageCompany getCompany(int expressagecompany_id);//得到公司内容

}
