package com.expressage.controller;

import com.expressage.entity.Expressage;
import com.expressage.entity.Users;
import com.expressage.service.ExpressageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/")
public class ExpressageController {

    @Autowired(required = false)
    private ExpressageService expressageService;

    @RequestMapping("/myexpressage")
    public String MyExpressage(HttpServletRequest request,Model model){
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        List<Expressage> myexpressages = expressageService.getMyExpressageInfo(user);
        session.setAttribute("myexpressages",myexpressages);
        return "/expressage/MyExpressage";
    }

    @RequestMapping("/addexpressageinfo")
    public String AddExpressageInfo(Expressage expressage, Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        expressage.setUid(user.getUid());
        expressage.setExpressage_pay_status("待支付");
        expressage.setExpressage_delivery_status("带配送");

        int flag = expressageService.addExpressageInfo(expressage);
        if(flag > 0){
            return "";
        }else {
            model.addAttribute("errorMsg","添加失败");
            return "addexpressageinfo";
        }

    }

}
