package com.bbs.service;

import com.bbs.model.ArticleFocus;
import com.bbs.model.PageInfo;

import java.util.List;

/**
 * Created by max on 2017/3/28.
 */
public interface ArticleFocusService {

    List<ArticleFocus> getArticleFocusList(PageInfo pageInfo, ArticleFocus focus);

    int getArticleFocusCount(ArticleFocus focus);

    int insertArticleFocus(ArticleFocus focus);

    int deleteArticleFocus(int id);
}
