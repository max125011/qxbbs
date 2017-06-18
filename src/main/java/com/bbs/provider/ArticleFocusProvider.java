package com.bbs.provider;

import com.bbs.model.ArticleFocus;
import com.bbs.model.PageInfo;
import com.bbs.util.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.apache.ibatis.jdbc.SqlBuilder.*;

/**
 * Created by max on 2017/3/29.
 */
public class ArticleFocusProvider {

    private static Logger logger = LoggerFactory.getLogger(ArticleFocusProvider.class);

    public String getArticleFocusList(PageInfo pageInfo, ArticleFocus focus){

        BEGIN();
        SELECT("*");
        FROM("article_focus");
        if (focus.getUserId() > 0)
            WHERE("user_id = #{focus.userId}");
        if (focus.getArticleId() > 0)
            WHERE("article_id = #{focus.articleId}");

        String sql = SQL() + " order by create_time desc " + PageUtil.append(pageInfo);
        logger.debug(sql);
        return sql;
    }

    public String getArticleFocusCount(ArticleFocus focus){

        BEGIN();
        SELECT("count(*)");
        FROM("article_focus");
        if (focus.getUserId() > 0)
            WHERE("user_id = #{focus.userId}");
        if (focus.getArticleId() > 0)
            WHERE("article_id = #{focus.articleId}");
        String sql = SQL();
        logger.debug(sql);
        return sql;
    }

    public String insertArticleFocus(ArticleFocus focus){

        BEGIN();
        INSERT_INTO("article_focus");
        if (focus.getArticleId() > 0)
            VALUES("article_id", "#{focus.articleId}");
        if (focus.getUserId() > 0)
            VALUES("user_id", "#{focus.userId}");
        String sql = SQL();
        logger.debug(sql);
        return sql;
    }

}
