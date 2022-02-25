package com.expressage.controller;

import com.expressage.entity.ExpressageCompany;
import com.expressage.entity.Menu;
import com.expressage.service.CompanyService;
import com.expressage.service.MenuService;
import com.expressage.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/")
public class CompanyController {

    @Autowired(required = false)
    private CompanyService companyService;
    @Autowired(required = false)
    private MenuService menuService;

    @RequestMapping("/companylist")
    public String CompanyList(Model model){
        List<ExpressageCompany> companyList = companyService.getAllCompany();
        model.addAttribute("companyList",companyList);
        return "/expressage/AllCompany";
    }

    @RequestMapping("/deleteCompany")
    @ResponseBody
    public Msg DeleteCompany(@RequestParam("expressagecompany_id")String expressagecompany_id){
        ExpressageCompany expressageCompany = companyService.getCompany(Integer.parseInt(expressagecompany_id));
        int flag_menu = menuService.deleteMenu(expressageCompany.getExpressagecompany_name());
        int flag = companyService.delCompany(Integer.parseInt(expressagecompany_id));
        if (flag > 0 && flag_menu > 0){
            return Msg.success("成功");
        }
        return Msg.fail("失败");
    }

    @RequestMapping("/addCompany")
    public String AddCompany(ExpressageCompany company,Model model){
        int flag_company = companyService.addCompanyInfo(company);
        Menu menu = new Menu();
        menu.setHref("/expressage/expressagelist?expressage_logistics_company="+company.getExpressagecompany_name()+"&type=2");
        menu.setParent_id(9);
        menu.setMenu_name(company.getExpressagecompany_name());
        menu.setRole("0,1");
        int flag_menu = menuService.addMenu(menu);
        if (flag_company > 0 && flag_menu > 0){
            return "redirect:/companylist";
        }
        model.addAttribute("error","添加失败");
        return "/expressage/addCompany";
    }
}
