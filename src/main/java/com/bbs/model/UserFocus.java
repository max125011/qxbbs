package com.bbs.model;

import java.util.Date;

/**
 * Created by max on 2017/3/28.
 */
public class UserFocus {

    private int id;
    private int focusOn;
    private int userId;
    private Date createTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFocusOn() {
        return focusOn;
    }

    public void setFocusOn(int focusOn) {
        this.focusOn = focusOn;
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
