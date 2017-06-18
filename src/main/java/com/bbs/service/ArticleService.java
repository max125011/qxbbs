package com.bbs.service;

import com.bbs.model.Article;
import com.bbs.model.ArticleDto;
import com.bbs.model.PageInfo;

import java.util.List;

/**
 * Created by max on 2017/3/27.
 */
public interface ArticleService {

    List<Article> getArticleList(PageInfo pageInfo, Article article);

    List<ArticleDto> getArticleDtoList(PageInfo pageInfo, Article article);

    List<ArticleDto> getAdminArticleDtoList(PageInfo pageInfo, Article article);

    int getArticleCount(Article article);

    Article getArticleById(int id);

    int insertArticle(Article article);

    int updateArticle(Article article);

    int increaseFocusNum(int id);

    int increasePraiseNum(int id);

    int updateCommentNum(int id);

    int setBetter(int id);

    int increaseReadTimes(int id);

    int updateGroup(int id, int groupId);

    int updateFlag(int id, int flag);

    int setTop(int id);

    int cancelTop(int id);
}
