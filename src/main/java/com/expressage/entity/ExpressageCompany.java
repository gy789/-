package com.expressage.entity;

public class ExpressageCompany {
    private int expressagecompany_id;
    private String expressagecompany_name;

    @Override
    public String toString() {
        return "ExpressageCompany{" +
                "expressagecompany_id=" + expressagecompany_id +
                ", expressagecompany_name='" + expressagecompany_name + '\'' +
                '}';
    }

    public int getExpressagecompany_id() {
        return expressagecompany_id;
    }

    public void setExpressagecompany_id(int expressagecompany_id) {
        this.expressagecompany_id = expressagecompany_id;
    }

    public String getExpressagecompany_name() {
        return expressagecompany_name;
    }

    public void setExpressagecompany_name(String expressagecompany_name) {
        this.expressagecompany_name = expressagecompany_name;
    }
}
