package com.bbs.model;

import java.util.List;

/**
 * Created by max on 2017/3/28.
 */
public class ResponseVo {

    private List< ? extends  Object> list;
    private PageInfo pageInfo;

    public List<? extends Object> getList() {
        return list;
    }

    public void setList(List<? extends Object> list) {
        this.list = list;
    }

    public PageInfo getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(PageInfo pageInfo) {
        this.pageInfo = pageInfo;
    }
}
