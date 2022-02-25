package com.expressage.mapper;

import com.expressage.entity.Expressagenews;

import java.util.List;

public interface NewsMapper {
    List<Expressagenews> getNewsList();//得到所有新闻
    int addNews(Expressagenews expressagenews);//添加新闻
    int updateNews(Expressagenews expressagenews);//修改新闻
    int deleteNews(int expressage_news_id);//删除新闻
    Expressagenews getNews(int expressage_news_id);//得到详情
}
