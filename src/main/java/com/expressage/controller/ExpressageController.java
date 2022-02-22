package com.expressage.controller;

import com.expressage.entity.Expressage;
import com.expressage.entity.ExpressageStatus;
import com.expressage.entity.Message;
import com.expressage.entity.Users;
import com.expressage.service.ExpressageService;
import com.expressage.service.MessageService;
import com.expressage.util.Msg;
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

    @Autowired(required = false)
    private MessageService messageService;

    /**
     * 查询我的快递信息
     * 根据role判断（2:用户查询创建的订单；1：快递员查询配送的订单）
     * */
    @RequestMapping("/myexpressage")
    public String MyExpressage(HttpServletRequest request,Model model){
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        List<Expressage> myexpressages = expressageService.getMyExpressageInfo(user);
        model.addAttribute("myexpressages",myexpressages);
        return "/expressage/MyExpressage";
    }

    /**
     * 用户创建快递信息
     * */
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

    /**
     * 跳转到快递详情页面
     * */
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

    /**
     * 更新快递状态接口（同时更新快递状态和更新操作节点）
     * */
    @RequestMapping("/updateStatus")
    @ResponseBody
    public Msg UpdateStatus(@RequestParam("expressage_id")String expressage_id,@RequestParam("type")String type,
                            @RequestParam("prompt")String prompt,HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        String message_info = "取货地址："+prompt;
        int flag = expressageService.updateExpressageInfo(Integer.parseInt(expressage_id),Integer.parseInt(type),message_info,user);
        if(Integer.parseInt(type) == 1 && flag > 0){
            Message message = new Message();
            message.setUid(user.getUid());
            message.setMessage_info(message_info);
            message.setRead_status(false);
            messageService.addMessage(message);
        }
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
