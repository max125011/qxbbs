package com.bbs.provider;

import com.bbs.model.ArticlePraise;
import com.bbs.model.Comment;
import com.bbs.model.PageInfo;
import com.bbs.util.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.apache.ibatis.jdbc.SqlBuilder.*;

/**
 * Created by max on 2017/3/29.
 */
public class ArticlePraiseProvider {

    private static Logger logger = LoggerFactory.getLogger(ArticlePraiseProvider.class);

    public String getArticlePraiseList(PageInfo pageInfo, ArticlePraise praise){

        BEGIN();
        SELECT("*");
        FROM("article_praise");
        if (praise.getUserId() > 0)
            WHERE("user_id = #{praise.userId}");
        if (praise.getArticleId() > 0)
            WHERE("article_id = #{praise.articleId}");

        String sql = SQL() + " order by create_time desc " + PageUtil.append(pageInfo);
        logger.debug(sql);
        return sql;
    }

    public String getArticlePraiseCount(ArticlePraise praise){

        BEGIN();
        SELECT("count(*)");
        FROM("article_praise");
        if (praise.getUserId() > 0)
            WHERE("user_id = #{praise.userId}");
        if (praise.getArticleId() > 0)
            WHERE("article_id = #{praise.articleId}");
        String sql = SQL();
        logger.debug(sql);
        return sql;
    }

    public String insertArticlePraise(ArticlePraise praise){

        BEGIN();
        INSERT_INTO("article_praise");
        if (praise.getArticleId() > 0)
            VALUES("article_id", "#{praise.articleId}");
        if (praise.getUserId() > 0)
            VALUES("user_id", "#{praise.userId}");
        String sql = SQL();
        logger.debug(sql);
        return sql;
    }

}
