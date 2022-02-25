package com.expressage.service.impl;

import com.expressage.entity.ExpressageCompany;
import com.expressage.mapper.CompanyMapper;
import com.expressage.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("companyService")
public class CompanyServiceImpl implements CompanyService {

    @Autowired(required = false)
    private CompanyMapper companyMapper;

    @Override
    public List<ExpressageCompany> getAllCompany() {
        return companyMapper.getAllCompany();
    }

    @Override
    public int delCompany(int expressagecompany_id) {
        return companyMapper.delCompany(expressagecompany_id);
    }

    @Override
    public int addCompanyInfo(ExpressageCompany company) {
        return companyMapper.addCompanyInfo(company);
    }

    @Override
    public ExpressageCompany getCompany(int expressagecompany_id) {
        return companyMapper.getCompany(expressagecompany_id);
    }
}
