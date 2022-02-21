package com.expressage.controller;

import com.expressage.entity.Expressage;
import com.expressage.entity.ExpressageStatus;
import com.expressage.entity.Users;
import com.expressage.mapper.ExpressageMapper;
import com.expressage.service.ExpressageService;
import com.expressage.util.Msg;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
        model.addAttribute("myexpressages",myexpressages);
        return "/expressage/MyExpressage";
    }

    @RequestMapping("/addexpressageinfo")
    public String AddExpressageInfo(Expressage expressage, Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        expressage.setUid(user.getUid());
        expressage.setExpressage_pay_status("待支付");
        expressage.setExpressage_delivery_status("待配送");

        int flag = expressageService.addExpressageInfo(expressage);
        if(flag > 0){
            return "redirect:/myexpressage";
        }else {
            model.addAttribute("errorMsg","添加失败");
            return "addexpressageinfo";
        }

    }

    @RequestMapping("/skipExpressageInfo")
    public String SkipExpressageInfo(Model model, @RequestParam("expressage_id")String param){
        int expressage_id = Integer.parseInt(param);
        Expressage expressage = expressageService.getOneExpressageInfo(expressage_id);
        ExpressageStatus expressageStatus = expressageService.getOneExpressageStatus(expressage_id);

        if(expressage == null && expressageStatus == null){
            model.addAttribute("error","系统异常");
            return "/expressage/MyExpressage";
        }
        model.addAttribute("expressage",expressage);
        model.addAttribute("expressagestatus",expressageStatus);

        return "/expressage/Oneexpressageinfo";
    }

    @RequestMapping("/updateStatus")
    @ResponseBody
    public Msg UpdateStatus(@RequestParam("expressage_id")String expressage_id,@RequestParam("type")String type,
                            @RequestParam("prompt")String prompt,HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        String message = "取货地址："+prompt;
        int flag = expressageService.updateExpressageInfo(Integer.parseInt(expressage_id),Integer.parseInt(type),message,user);
        int flag1 = expressageService.updateExpressageStatus(Integer.parseInt(expressage_id),Integer.parseInt(type));
        if (flag > 0 && flag1 > 0){
            return Msg.success("成功");
        }
        return Msg.fail("失败");
    }

    @RequestMapping("/expressagelist")
    public String ExpressageList(@RequestParam("type")String type, Model model){
        List<Expressage> undeliverylist = expressageService.getAllExpressageInfo(Integer.parseInt(type));
        model.addAttribute("expressages",undeliverylist);
        model.addAttribute("type",type);
        return "/expressage/AllExpressages";
    }


}
