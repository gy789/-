package com.expressage.controller;

import com.expressage.entity.Expressagenews;
import com.expressage.service.NewsService;
import com.expressage.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/")
public class NewsController {

    @Autowired(required = false)
    private NewsService newsService;

    @RequestMapping("/newsList")
    public String getnewsList(Model model){
        List<Expressagenews> newslist = newsService.getNewsList();
        model.addAttribute("newslist",newslist);
        return "/expressage/AllNews";
    }
    @RequestMapping("/addnews")
    public String addNews(Expressagenews news, Model model, HttpServletRequest request){
        int flag = newsService.addNews(news);
        if (flag > 0){
            return "redirect:/newsList";
        }
        return "/expressage/addNews";
    }

    @RequestMapping("/delnews")
    @ResponseBody
    public Msg deleteNews(@RequestParam("expressage_news_id")String expressage_news_id){
        int flag = newsService.deleteNews(Integer.parseInt(expressage_news_id));
        if (flag > 0){
            return Msg.success("成功");
        }
        return Msg.fail("失败");
    }

    @RequestMapping("/updateNews")
    public String updateNews(Expressagenews news, Model model, HttpServletRequest request){
        int flag = newsService.updateNews(news);
        if (flag > 0){
            return "/expressage/allNews";
        }
        return "/expressage/newsdetails";
    }

    @RequestMapping("/skipnews")
    public String getNewsDetails(Model model,@RequestParam("expressage_news_id")String expressage_news_id){
        Expressagenews expressagenews = newsService.getNews(Integer.parseInt(expressage_news_id));
        model.addAttribute("expressagenews",expressagenews);
        return "/expressage/newsDetails";
    }


}
