package com.bbs.service;

import com.bbs.model.ArticlePraise;
import com.bbs.model.PageInfo;

import java.util.List;

/**
 * Created by max on 2017/3/27.
 */
public interface ArticlePraiseService {

    List<ArticlePraise> getArticlePraiseList(PageInfo pageInfo, ArticlePraise praise);

    int getArticlePraiseCount(ArticlePraise praise);

    int insertArticlePraise(ArticlePraise praise);

    int deleteArticlePraise(int id);

}
