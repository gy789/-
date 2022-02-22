package com.expressage.controller;

import com.expressage.entity.*;
import com.expressage.mapper.CompanyMapper;
import com.expressage.service.CompanyService;
import com.expressage.service.ExpressageService;
import com.expressage.service.MessageService;
import com.expressage.util.Msg;
import org.apache.ibatis.annotations.Param;
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

    @Autowired(required = false)
    private CompanyService companyService;


    /**
     * 查询我的快递信息
     * 根据role判断（2:用户查询创建的订单；1：快递员查询配送的订单）
     * */
    @RequestMapping("/myexpressage")
    public String MyExpressage(HttpServletRequest request,Model model){
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        List<Expressage> myexpressages = expressageService.getMyExpressageInfo(user);
        List<ExpressageCompany> companyList = companyService.getAllCompany();
        session.setAttribute("companyList",companyList);
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
                            @RequestParam(value="prompt",required = false)String prompt,HttpServletRequest request){
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        String message_info = "取货地址："+prompt;
        int flag = expressageService.updateExpressageInfo(Integer.parseInt(expressage_id),Integer.parseInt(type),message_info,user);
        if(Integer.parseInt(type) == 1 && flag > 0){
            Expressage expressage = expressageService.getOneExpressageInfo(Integer.parseInt(expressage_id));
            String info = "你好：取件码"+expressage.getExpressage_code()+"的快递已到达"+prompt+"，请及时查收，谢谢！";
            Message message = new Message();
            message.setUid(user.getUid());
            message.setMessage_info(info);
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

    @RequestMapping("/updateExpressage")
    public String UpdateExpressage(Expressage expressage,Model model){
        int flag = expressageService.updateExpressage(expressage);
        if(flag > 1){
            return "redirect:/myexpressage";
        }
        model.addAttribute("error","修改失败");
        return "/expressage/Oneexpressageinfo";
    }

    @RequestMapping("/deleteExpressage")
    @ResponseBody
    public Msg DeleteExpressage(@Param("expressage_id")String expressage_id){
        int flag = expressageService.delExpressage(Integer.parseInt(expressage_id));
        if(flag > 0){
            return Msg.success("成功");
        }
        return Msg.fail("失败");
    }

}
