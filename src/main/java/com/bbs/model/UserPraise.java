package com.bbs.model;

import java.util.Date;

/**
 * Created by max on 2017/3/28.
 */
public class UserPraise {

    private int id;
    private int praiseOn;
    private int userId;
    private Date createTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPraiseOn() {
        return praiseOn;
    }

    public void setPraiseOn(int praiseOn) {
        this.praiseOn = praiseOn;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
