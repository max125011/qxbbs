package com.bbs.service.impl;

import com.bbs.mapper.ArticleMapper;
import com.bbs.model.Article;
import com.bbs.model.ArticleDto;
import com.bbs.model.PageInfo;
import com.bbs.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by max on 2017/3/28.
 */
@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    ArticleMapper articleMapper;

    @Override
    public List<Article> getArticleList(PageInfo pageinfo, Article article) {
        return articleMapper.getArticleList(pageinfo, article);
    }

    @Override
    public List<ArticleDto> getArticleDtoList(PageInfo pageInfo, Article article) {
        return articleMapper.getArticleDtoList(pageInfo, article);
    }

    @Override
    public List<ArticleDto> getAdminArticleDtoList(PageInfo pageInfo, Article article) {
        return articleMapper.getAdminArticleDtoList(pageInfo, article);
    }

    @Override
    public Article getArticleById(int id) {
        return articleMapper.getArticleById(id);
    }

    @Override
    public int getArticleCount(Article article) {
        return articleMapper.getArticleCount(article);
    }

    @Override
    public int insertArticle(Article article) {
        return articleMapper.insertArticle(article);
    }

    @Override
    public int updateArticle(Article article) {
        return articleMapper.updateArticle(article);
    }

    @Override
    public int increaseFocusNum(int id) {
        return articleMapper.increaseFocusNum(id);
    }

    @Override
    public int increasePraiseNum(int id) {
        return articleMapper.increasePraiseNum(id);
    }

    @Override
    public int updateCommentNum(int id) {
        return articleMapper.updateCommentNum(id);
    }

    @Override
    public int setBetter(int id) {
        return articleMapper.setBetter(id);
    }

    @Override
    public int increaseReadTimes(int id) {
        return articleMapper.increaseReadTimes(id);
    }

    @Override
    public int updateGroup(int id, int groupId) {
        return articleMapper.updateGroup(id, groupId);
    }

    @Override
    public int updateFlag(int id, int flag) {
        return articleMapper.updateFlag(id, flag);
    }

    @Override
    public int setTop(int id) {
        return articleMapper.updateTop(id, 1);
    }

    @Override
    public int cancelTop(int id) {
        return articleMapper.updateTop(id, 0);
    }
}
