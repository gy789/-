package com.expressage.controller;

import com.expressage.entity.Expressage;
import com.expressage.entity.Expressagenews;
import com.expressage.entity.Users;
import com.expressage.mapper.MessageMapper;
import com.expressage.service.ExpressageService;
import com.expressage.service.MenuService;
import com.expressage.service.MessageService;
import com.expressage.service.NewsService;
import com.expressage.util.CreateMenu;
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
    @Autowired(required = false)
    private NewsService newsService;
    @Autowired(required = false)
    private MenuService menuService;

    @Autowired(required = false)
    private MessageService messageService;


    @RequestMapping("/index")
    public String GetIndex(Model model,HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user = (Users)session.getAttribute("user");

        try {
            int readnumber = messageService.getMessageNumber(user.getUid(),0);
            int unreadnumber = messageService.getMessageNumber(user.getUid(),1);
            CreateMenu cm = new CreateMenu(user.getRole(),menuService);
            model.addAttribute("menu",cm.printMenu());

            model.addAttribute("readnumber",readnumber);
            model.addAttribute("unreadnumber",unreadnumber);
            return "index";
        }catch (Exception e){
            return "Login";
        }

    }

    @RequestMapping("/index_v2")
    public String GetIndexV2(Model model){


        String firstDay = Utils.getFirstDay(true);
        String lastDay = Utils.getLastDay(true);
        int monExpressage_number = expressageService.getMonExpressage(firstDay,lastDay,0);
        int monExpressage_compelete_number = expressageService.getMonExpressage(firstDay,lastDay,1);
        int monExpressage_wait_number = expressageService.getMonExpressage(firstDay,lastDay,2);
        Double monExpressage_amount = 0.00;
        try{
            monExpressage_amount = expressageService.getMonExpressageAmount(firstDay,lastDay);
        }catch (Exception e){
            monExpressage_amount = 0.00;
        }

        List<Expressagenews> newslist = newsService.getNewsList();

        model.addAttribute("monExpressage_number",monExpressage_number);
        model.addAttribute("monExpressage_compelete_number",monExpressage_compelete_number);
        model.addAttribute("monExpressage_wait_number",monExpressage_wait_number);
        model.addAttribute("newslist",newslist);
        model.addAttribute("monExpressage_amount",monExpressage_amount);
        return "index_v1";
    }
}
