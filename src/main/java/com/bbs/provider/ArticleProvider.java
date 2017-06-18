package com.bbs.provider;

import com.bbs.model.Article;
import com.bbs.model.PageInfo;
import com.bbs.util.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.apache.ibatis.jdbc.SqlBuilder.*;

/**
 * Created by max on 2017/3/29.
 */
public class ArticleProvider {

    private static Logger logger = LoggerFactory.getLogger(ArticleProvider.class);


    public String getAdminArticleDtoList(PageInfo page,Article article){
        BEGIN();
        SELECT("article.id, article.title, article.title_color, article.summary, article.focus_num, article.praise_num, article.comment_num, article.user_id, article.better, article.top, article.group_id, article.read_times, article.ip, article.flag, article.create_time, article.update_time, user.nickname, user.picture_url, article.author");
        FROM("article");
        LEFT_OUTER_JOIN("user on article.user_id = user.id");
        if (article.getGroupId() > 0)
            WHERE("article.group_id in (0, #{article.groupId})");
        if (article.getBetter() >= 0)
            WHERE("article.better = #{article.better}");
        if (article.getFlag() > 0)
            WHERE("article.flag = #{article.flag}");
        else
            WHERE("article.flag < 3");
        String sql = SQL() + " order by article.flag , article.create_time desc " + PageUtil.append(page);
        logger.debug(sql);
        return sql;
    }

    public String getArticleDtoList(PageInfo page,Article article){
        BEGIN();
        SELECT("article.id, article.title,  article.title_color, article.summary, article.focus_num, article.praise_num, article.comment_num, article.user_id, article.better, article.top, article.group_id, article.read_times, article.ip, article.flag, article.create_time, article.update_time, user.nickname, user.picture_url, article.author");
        FROM("article");
        LEFT_OUTER_JOIN("user on article.user_id = user.id");
        if (article.getGroupId() > 0)
            WHERE("article.group_id in (0, #{article.groupId})");
        if (article.getBetter() >= 0)
            WHERE("article.better = #{article.better}");
        if (article.getFlag() > 0)
            WHERE("article.flag = #{article.flag}");
        else
            WHERE("article.flag < 3");
        String sql = SQL() + " order by article.top desc, article.create_time desc " + PageUtil.append(page);
        logger.debug(sql);
        return sql;
    }

    public String getArticleList(PageInfo page,Article article){
        BEGIN();
        SELECT("*");
        FROM("article");
        if (article.getGroupId() > 0)
            WHERE("group_id in (0, #{article.groupId})");
        if (article.getBetter() >= 0)
            WHERE("better = #{article.better}");
        if (article.getFlag() > 0)
            WHERE("flag = #{article.flag}");
        else
            WHERE("flag < 3");
        String sql = SQL() + " order by create_time desc " + PageUtil.append(page);
        logger.debug(sql);
        return sql;
    }

    public String getArticleCount(Article article){
        BEGIN();
        SELECT("count(*)");
        FROM("article");
        if (article.getGroupId() > 0)
            WHERE("group_id in (0, #{article.groupId})");
        if (article.getBetter() >= 0)
            WHERE("better = #{article.better}");
        if (article.getFlag() > 0)
            WHERE("flag = #{article.flag}");
        else
            WHERE("flag < 3");
        String sql = SQL();
        logger.debug(sql);
        return sql;
    }

    /**
     *  帖子插入SQL拼装，title，group_id,user_id为必填字段，ip,content允许空值
     * @param article
     * @return
     */
    public String insertArticle(Article article){
        BEGIN();
        INSERT_INTO("article");
        VALUES("top", "0");
        if (article.getTitle() != null && article.getTitle() != "")
            VALUES("title", "#{article.title}");
        if (article.getTitleColor() != null && article.getTitleColor() != "")
            VALUES("title_color", "#{article.titleColor}");
        if (article.getAuthor() != null && article.getAuthor() != "")
            VALUES("author", "#{article.author}");
        if (article.getSummary() != null && article.getSummary() != "")
            VALUES("summary", "#{article.summary}");
        if (article.getContent() != null && article.getContent() != "")
            VALUES("content", "#{article.content}");
        if (article.getGroupId() > 0)
            VALUES("group_id", "#{article.groupId}");
        if (article.getUserId() > 0)
            VALUES("user_id", "#{article.userId}");
        if (article.getIp() != null && article.getIp() != "")
            VALUES("ip", "#{article.ip}");
        if (article.getLeadComment() != null && article.getLeadComment() != "")
            VALUES("lead_comment", "#{article.leadComment}");
        String sql = SQL();
        logger.debug(sql);
        return sql;
    }

    public String updateArticle(Article article){
        BEGIN();
        UPDATE("article");
        if (article.getTitle() != null && article.getTitle() != "")
            SET("title = #{article.title}");
        if (article.getTitleColor() != null && article.getTitleColor() != "")
            SET("title_color = #{article.titleColor}");
        if (article.getAuthor() != null && article.getAuthor() != "")
            SET("author = #{article.author}");
        if (article.getSummary() != null && article.getSummary() != "")
            SET("summary = #{article.summary}");
        if (article.getContent() != null && article.getContent() != "")
            SET("content = #{article.content}");
        if (article.getLeadComment() != null && article.getLeadComment() != "")
            SET("lead_comment = #{article.leadComment}");
        SET("flag = 1");
        WHERE("id = #{article.id}");
        String sql = SQL();
        logger.debug(sql);
        return sql;
    }

}
