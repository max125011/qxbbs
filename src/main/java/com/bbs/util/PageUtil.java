package com.bbs.util;

import com.bbs.model.PageInfo;

/**
 * Created by max on 2017/3/28.
 */
public class PageUtil {

    public static String append(PageInfo page){
        //如果没有pageCurrent没有传值默认置为1，pageSize没有传值默认置为10
        page.setPageCurrent(page.getPageCurrent() > 0 ? page.getPageCurrent() : 1);
        page.setPageSize(page.getPageSize() > 0 ? page.getPageSize() : 10);
        return " limit " + (page.getPageCurrent() - 1)*page.getPageSize() + " , " + page.getPageSize();
    }

    public static PageInfo getPageInfo(int current, int size, int total){

        PageInfo info = new PageInfo();
        info.setTotal(total);
        //如果page size为0或者没有传值的话，默认置为10
        size  = size > 0 ? size : 10;
        //如果current为0或者没有传值的话，直接置为1
        info.setPageCurrent(current > 0 ? current : 1);
        info.setPageSize(size);
        info.setPages(total%size == 0 ? total/size : total/size + 1);
        info.setPrePage(info.getPageCurrent() > 1 ? info.getPageCurrent() - 1 : 1);
        info.setNextPage(info.getPageCurrent() < info.getPages() ? info.getPageCurrent() + 1 : info.getPages());
        return info;
    }

    public static PageInfo getPageInfo(int size, int total){
        return getPageInfo(1, size, total);
    }

    public static PageInfo getPageInfo(int total){
        return getPageInfo(1, 10, total);
    }

}
