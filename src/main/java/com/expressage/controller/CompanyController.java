package com.expressage.controller;

import com.expressage.entity.ExpressageCompany;
import com.expressage.service.CompanyService;
import com.expressage.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/")
public class CompanyController {

    @Autowired(required = false)
    private CompanyService companyService;

    @RequestMapping("/companylist")
    public String CompanyList(Model model){
        List<ExpressageCompany> companyList = companyService.getAllCompany();
        model.addAttribute("companyList",companyList);
        return "/expressage/AllCompany";
    }

    @RequestMapping("/deleteCompany")
    public String DeleteCompany(@RequestParam("expressagecompany_id")String expressagecompany_id,Model model){
        int flag = companyService.delCompany(Integer.parseInt(expressagecompany_id));
        if (flag > 0){
            return "redirect:/expressage/companylist";
        }
        model.addAttribute("error","删除失败");
        return "/expressage/AllCompany";
    }
}
