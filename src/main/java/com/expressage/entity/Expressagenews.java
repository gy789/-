package com.expressage.entity;

public class Expressagenews {
    private int expressage_news_id;
    private String expressage_news_title;
    private String expressage_news_info;
    private String create_time;
    private String update_time;

    @Override
    public String toString() {
        return "Expressagenews{" +
                "expressage_news_id=" + expressage_news_id +
                ", expressage_news_title='" + expressage_news_title + '\'' +
                ", expressage_news_info='" + expressage_news_info + '\'' +
                ", create_time='" + create_time + '\'' +
                ", update_time='" + update_time + '\'' +
                '}';
    }

    public int getExpressage_news_id() {
        return expressage_news_id;
    }

    public void setExpressage_news_id(int expressage_news_id) {
        this.expressage_news_id = expressage_news_id;
    }

    public String getExpressage_news_title() {
        return expressage_news_title;
    }

    public void setExpressage_news_title(String expressage_news_title) {
        this.expressage_news_title = expressage_news_title;
    }

    public String getExpressage_news_info() {
        return expressage_news_info;
    }

    public void setExpressage_news_info(String expressage_news_info) {
        this.expressage_news_info = expressage_news_info;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }
}
