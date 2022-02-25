package com.expressage.service.impl;

import com.expressage.entity.Expressagenews;
import com.expressage.mapper.NewsMapper;
import com.expressage.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("newsService")
public class NewsServiceImpl implements NewsService {

    @Autowired(required = false)
    private NewsMapper newsMapper;

    @Override
    public List<Expressagenews> getNewsList() {
        return newsMapper.getNewsList();
    }

    @Override
    public int addNews(Expressagenews expressagenews) {
        return newsMapper.addNews(expressagenews);
    }

    @Override
    public int updateNews(Expressagenews expressagenews) {
        return newsMapper.updateNews(expressagenews);
    }

    @Override
    public int deleteNews(int expressage_news_id) {
        return newsMapper.deleteNews(expressage_news_id);
    }

    @Override
    public Expressagenews getNews(int expressage_news_id) {
        return newsMapper.getNews(expressage_news_id);
    }
}
