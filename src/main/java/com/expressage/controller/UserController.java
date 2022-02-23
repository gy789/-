package com.expressage.controller;

import com.expressage.entity.Message;
import com.expressage.entity.Users;
import com.expressage.service.MenuService;
import com.expressage.service.MessageService;
import com.expressage.service.UserService;
import com.expressage.util.CreateMenu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/")
public class UserController {

    @Autowired(required = false)
    private UserService userService;

    @Autowired(required = false)
    private MenuService menuService;

    @Autowired(required = false)
    private MessageService messageService;

    @RequestMapping("/login")
    public String Login(Users u, Model model, HttpServletRequest request){
        Users user = userService.ulogin(u.getUsername(),u.getPassword());
        if(user == null){
            model.addAttribute("errorMsg","用户名或密码错误");
            return "Login";
        }else {
            HttpSession session = request.getSession();
            CreateMenu cm = new CreateMenu(user.getRole(),menuService);
            List<Message> readmessages = messageService.getAllMessage(user.getUid(),0);
            List<Message> unreadmessages = messageService.getAllMessage(user.getUid(),1);
            session.setAttribute("readmessages",readmessages);
            session.setAttribute("unreadmessages",unreadmessages);
            session.setAttribute("user", user);
            session.setAttribute("menu",cm.printMenu());

            return "index";
        }
    }

    @RequestMapping("/register")
    public String register(Users user, Model model, HttpServletRequest request){
        user.setRole("2");
        int flag = userService.uregister(user);
        if(flag ==0){
            model.addAttribute("errorMsg","注册失败");
            return "/Register";
        }
        else {
            return "Login";
        }
    }

    @RequestMapping("/userlist")
    public String getUserList(Model model){
        List<Users> usersList = userService.getAllUsers();
        model.addAttribute("userlist",usersList);
        return "/expressage/allusers";
    }

    /*@RequestMapping("/logout")
    @ResponseBody
    public Msg logout(HttpSession session,HttpServletRequest request){
        Users users = (Users)session.getAttribute("user");
        int flag1 = userService.deleteUsers(users.getUid());//删除用户
        int flag2 = wishService.delUWish(users.getUid());//删除收藏列表
        int flag3 = shopCarService.deleteUSC(users.getUid());//删除购物车列表
        request.getSession().removeAttribute("user");
        if(flag1 == 0){
            return Msg.fail("注销失败");
        }
        return Msg.success("注销成功");
    }*/

}
