package com.expressage.entity;

public class ExpressageStatus {
    private int status_id;//状态id
    private int expressage_id;//快递ID
    private String start_status_time;//创建时间
    private String delivery_status_time;//开始配送时间
    private String compelete_delivery;//配送完成时间和留言
    private String recipient_status_time;//确认收货时间
    private String compelete_pay_time;//支付完成时间

    @Override
    public String toString() {
        return "ExpressageStatus{" +
                "status_id=" + status_id +
                ", expressage_id=" + expressage_id +
                ", start_status_time='" + start_status_time + '\'' +
                ", delivery_status_time='" + delivery_status_time + '\'' +
                ", compelete_delivery='" + compelete_delivery + '\'' +
                ", recipient_status_time='" + recipient_status_time + '\'' +
                ", compelete_pay_time='" + compelete_pay_time + '\'' +
                '}';
    }

    public int getStatus_id() {
        return status_id;
    }

    public void setStatus_id(int status_id) {
        this.status_id = status_id;
    }

    public int getExpressage_id() {
        return expressage_id;
    }

    public void setExpressage_id(int expressage_id) {
        this.expressage_id = expressage_id;
    }

    public String getStart_status_time() {
        return start_status_time;
    }

    public void setStart_status_time(String start_status_time) {
        this.start_status_time = start_status_time;
    }

    public String getDelivery_status_time() {
        return delivery_status_time;
    }

    public void setDelivery_status_time(String delivery_status_time) {
        this.delivery_status_time = delivery_status_time;
    }

    public String getCompelete_delivery() {
        return compelete_delivery;
    }

    public void setCompelete_delivery(String compelete_delivery) {
        this.compelete_delivery = compelete_delivery;
    }

    public String getRecipient_status_time() {
        return recipient_status_time;
    }

    public void setRecipient_status_time(String recipient_status_time) {
        this.recipient_status_time = recipient_status_time;
    }

    public String getCompelete_pay_time() {
        return compelete_pay_time;
    }

    public void setCompelete_pay_time(String compelete_pay_time) {
        this.compelete_pay_time = compelete_pay_time;
    }
}
