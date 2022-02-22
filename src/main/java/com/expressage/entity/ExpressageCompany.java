package com.expressage.entity;

public class ExpressageCompany {
    private int expressagecompnay_id;
    private String expressagecompany_name;

    @Override
    public String toString() {
        return "ExpressageCompany{" +
                "expressagecompnay_id=" + expressagecompnay_id +
                ", expressagecompany_name='" + expressagecompany_name + '\'' +
                '}';
    }

    public int getExpressagecompnay_id() {
        return expressagecompnay_id;
    }

    public void setExpressagecompnay_id(int expressagecompnay_id) {
        this.expressagecompnay_id = expressagecompnay_id;
    }

    public String getExpressagecompany_name() {
        return expressagecompany_name;
    }

    public void setExpressagecompany_name(String expressagecompany_name) {
        this.expressagecompany_name = expressagecompany_name;
    }
}
