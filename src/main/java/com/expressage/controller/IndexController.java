package com.expressage.controller;

import com.expressage.entity.Expressage;
import com.expressage.service.ExpressageService;
import com.expressage.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/")
public class IndexController {
    @Autowired(required = false)
    private ExpressageService expressageService;

    @RequestMapping("/index")
    public String GetIndex(Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        String firstDay = Utils.getFirstDay(true);
        String lastDay = Utils.getLastDay(true);
        int monExpressage_number = expressageService.getMonExpressage(firstDay,lastDay,0);
        int monExpressage_compelete_number = expressageService.getMonExpressage(firstDay,lastDay,1);
        int monExpressage_wait_number = expressageService.getMonExpressage(firstDay,lastDay,2);
        session.setAttribute("monExpressage_number",monExpressage_number);
        session.setAttribute("monExpressage_compelete_number",monExpressage_compelete_number);
        session.setAttribute("monExpressage_wait_number",monExpressage_wait_number);
        return "index_v1";
    }
}
