package com.bbs.model;

/**
 * Created by max on 2017/3/28.
 *
 *  存放分页信息
 */
public class PageInfo {

    private int pageCurrent;
    private int nextPage;
    private int prePage;
    private int pageSize;
    private int pages;
    private int total;

    public PageInfo(){}

    public PageInfo(int current, int pageSize){
        this.pageCurrent = current;
        this.pageSize = pageSize;
    }

    public int getPageCurrent() {
        return pageCurrent;
    }

    public void setPageCurrent(int pageCurrent) {
        this.pageCurrent = pageCurrent;
    }

    public int getNextPage() {
        return nextPage;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    public int getPrePage() {
        return prePage;
    }

    public void setPrePage(int prePage) {
        this.prePage = prePage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "pageCurrent=" + this.getPageCurrent() + ",nextPage=" + this.getNextPage() + ",prePage=" + this.getPrePage()
                + ",pageSize=" + this.getPageSize() + ",pages=" + this.getPages()+ ",total=" + this.getTotal();
    }
}
