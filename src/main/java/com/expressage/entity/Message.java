package com.expressage.entity;

public class Message {
    private int message_id;
    private String message_info;
    private int uid;
    private boolean read_status;

    @Override
    public String toString() {
        return "Message{" +
                "message_id=" + message_id +
                ", message_info='" + message_info + '\'' +
                ", uid=" + uid +
                ", read_status=" + read_status +
                '}';
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
