package com.bbs.service.impl;

import com.bbs.mapper.ArticlePraiseMapper;
import com.bbs.model.ArticlePraise;
import com.bbs.model.PageInfo;
import com.bbs.service.ArticlePraiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by max on 2017/3/29.
 */
@Service
public class ArticlePraiseServiceImpl implements ArticlePraiseService {

    @Autowired
    ArticlePraiseMapper articlePraiseMapper;

    @Override
    public List<ArticlePraise> getArticlePraiseList(PageInfo pageInfo, ArticlePraise praise) {
        return articlePraiseMapper.getArticlePraiseList(pageInfo, praise);
    }

    @Override
    public int getArticlePraiseCount(ArticlePraise praise) {
        return articlePraiseMapper.getArticlePraiseCount(praise);
    }

    @Override
    public int insertArticlePraise(ArticlePraise praise) {
        return articlePraiseMapper.insertArticlePraise(praise);
    }

    @Override
    public int deleteArticlePraise(int id) {
        return articlePraiseMapper.deleteArticlePraise(id);
    }
}
