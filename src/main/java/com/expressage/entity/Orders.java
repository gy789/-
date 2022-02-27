package com.expressage.entity;

public class Orders {
    private int order_id;
    private String order_no;
    private String order_amount;
    private String order_title;
    private int expressage_id;
    private String create_time;
    private String update_time;
    private int order_status;

    @Override
    public String toString() {
        return "Orders{" +
                "order_id=" + order_id +
                ", order_no='" + order_no + '\'' +
                ", order_amount=" + order_amount +
                ", order_title='" + order_title + '\'' +
                ", expressage_id=" + expressage_id +
                ", create_time='" + create_time + '\'' +
                ", update_time='" + update_time + '\'' +
                ", order_status=" + order_status +
                '}';
    }

    public int getOrder_status() {
        return order_status;
    }

    public void setOrder_status(int order_status) {
        this.order_status = order_status;
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

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public String getOrder_amount() {
        return order_amount;
    }

    public void setOrder_amount(String order_amount) {
        this.order_amount = order_amount;
    }

    public String getOrder_title() {
        return order_title;
    }

    public void setOrder_title(String order_title) {
        this.order_title = order_title;
    }

    public int getExpressage_id() {
        return expressage_id;
    }

    public void setExpressage_id(int expressage_id) {
        this.expressage_id = expressage_id;
    }
}
