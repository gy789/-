package com.expressage.entity;

public class Expressage {
    private int expressage_id;
    private String expressage_code;//快递取件码
    private String expressage_recipient_name;//快递接收人姓名
    private String expressage_recipient_phone;//快递接收人电话
    private String expressage_logistics_company;//快递所属物流公司
    private String expressage_delivery_time;//快递配送时间
    private String expressage_dormitory_number;//宿舍楼号
    private String expressage_message;//留言信息
    private String expressage_delivery_status;//配送状态
    private String create_time;//创建时间
    private String update_time;//修改时间
    private int uid;//用户id
    private String expressage_pay_status;//支付状态
    private int delivery_id;//配送人员ID

    @Override
    public String toString() {
        return "Expressage{" +
                "expressage_id=" + expressage_id +
                ", expressage_code='" + expressage_code + '\'' +
                ", expressage_recipient_name='" + expressage_recipient_name + '\'' +
                ", expressage_recipient_phone='" + expressage_recipient_phone + '\'' +
                ", expressage_logistics_company='" + expressage_logistics_company + '\'' +
                ", expressage_delivery_time='" + expressage_delivery_time + '\'' +
                ", expressage_dormitory_number='" + expressage_dormitory_number + '\'' +
                ", expressage_message='" + expressage_message + '\'' +
                ", expressage_delivery_status='" + expressage_delivery_status + '\'' +
                ", create_time='" + create_time + '\'' +
                ", update_time='" + update_time + '\'' +
                ", uid=" + uid +
                ", expressage_pay_status='" + expressage_pay_status + '\'' +
                ", delivery_id=" + delivery_id +
                '}';
    }

    public int getDelivery_id() {
        return delivery_id;
    }

    public void setDelivery_id(int delivery_id) {
        this.delivery_id = delivery_id;
    }

    public String getExpressage_pay_status() {
        return expressage_pay_status;
    }

    public void setExpressage_pay_status(String expressage_pay_status) {
        this.expressage_pay_status = expressage_pay_status;
    }

    public int getExpressage_id() {
        return expressage_id;
    }

    public void setExpressage_id(int expressage_id) {
        this.expressage_id = expressage_id;
    }

    public String getExpressage_code() {
        return expressage_code;
    }

    public void setExpressage_code(String expressage_code) {
        this.expressage_code = expressage_code;
    }

    public String getExpressage_recipient_name() {
        return expressage_recipient_name;
    }

    public void setExpressage_recipient_name(String expressage_recipient_name) {
        this.expressage_recipient_name = expressage_recipient_name;
    }

    public String getExpressage_recipient_phone() {
        return expressage_recipient_phone;
    }

    public void setExpressage_recipient_phone(String expressage_recipient_phone) {
        this.expressage_recipient_phone = expressage_recipient_phone;
    }

    public String getExpressage_logistics_company() {
        return expressage_logistics_company;
    }

    public void setExpressage_logistics_company(String expressage_logistics_company) {
        this.expressage_logistics_company = expressage_logistics_company;
    }

    public String getExpressage_delivery_time() {
        return expressage_delivery_time;
    }

    public void setExpressage_delivery_time(String expressage_delivery_time) {
        this.expressage_delivery_time = expressage_delivery_time;
    }

    public String getExpressage_dormitory_number() {
        return expressage_dormitory_number;
    }

    public void setExpressage_dormitory_number(String expressage_dormitory_number) {
        this.expressage_dormitory_number = expressage_dormitory_number;
    }

    public String getExpressage_message() {
        return expressage_message;
    }

    public void setExpressage_message(String expressage_message) {
        this.expressage_message = expressage_message;
    }

    public String getExpressage_delivery_status() {
        return expressage_delivery_status;
    }

    public void setExpressage_delivery_status(String expressage_status) {
        this.expressage_delivery_status = expressage_status;
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

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

}
