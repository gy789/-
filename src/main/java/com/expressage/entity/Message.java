package com.expressage.entity;

public class Message {
    private int message_id;
    private String message_info;
    private int uid;
    private boolean read_status;
    private String create_time;
    private String update_time;

    @Override
    public String toString() {
        return "Message{" +
                "message_id=" + message_id +
                ", message_info='" + message_info + '\'' +
                ", uid=" + uid +
                ", read_status=" + read_status +
                ", create_time='" + create_time + '\'' +
                ", update_time='" + update_time + '\'' +
                '}';
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

    public int getMessage_id() {
        return message_id;
    }

    public void setMessage_id(int message_id) {
        this.message_id = message_id;
    }

    public String getMessage_info() {
        return message_info;
    }

    public void setMessage_info(String message_info) {
        this.message_info = message_info;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public boolean isRead_status() {
        return read_status;
    }

    public void setRead_status(boolean read_status) {
        this.read_status = read_status;
    }
}
