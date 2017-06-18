package com.bbs.service.impl;

import com.bbs.mapper.ArticleFocusMapper;
import com.bbs.model.ArticleFocus;
import com.bbs.model.PageInfo;
import com.bbs.service.ArticleFocusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by max on 2017/3/29.
 */
@Service
public class ArticleFocusServiceImpl implements ArticleFocusService {

    @Autowired
    ArticleFocusMapper articleFocusMapper;

    @Override
    public List<ArticleFocus> getArticleFocusList(PageInfo pageInfo, ArticleFocus focus) {
        return articleFocusMapper.getArticleFocusList(pageInfo, focus);
    }

    @Override
    public int getArticleFocusCount(ArticleFocus focus) {
        return articleFocusMapper.getArticleFocusCount(focus);
    }

    @Override
    public int insertArticleFocus(ArticleFocus focus) {
        return articleFocusMapper.insertArticleFocus(focus);
    }

    @Override
    public int deleteArticleFocus(int id) {
        return articleFocusMapper.deleteArticleFocus(id);
    }
}
