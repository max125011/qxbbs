package com.bbs.provider;

import com.bbs.model.Comment;
import com.bbs.model.PageInfo;
import com.bbs.util.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.apache.ibatis.jdbc.SqlBuilder.*;

/**
 * Created by max on 2017/3/29.
 */
public class CommentProvider {

    private static Logger logger = LoggerFactory.getLogger(CommentProvider.class);

    public String getCommentList(PageInfo pageInfo, Comment comment){

        BEGIN();
        SELECT("*");
        FROM("comment");
        if (comment.getUserId() > 0)
            WHERE("user_id = #{comment.userId}");
        if (comment.getArticleId() > 0)
            WHERE("article_id = #{comment.articleId}");
        if (comment.getFloor() > 0)
            WHERE("floor = #{comment.floor}");
        if (comment.getType() > 0)
            WHERE("type = #{comment.type}");
        if (comment.getFlag() > 0)
            WHERE("flag = #{comment.flag}");
        else
            WHERE("flag < 3");
        String sql = SQL() + " order by create_time desc, id desc " + PageUtil.append(pageInfo);
        logger.debug(sql);
        return sql;
    }

    public String getCommentDtoList(PageInfo pageInfo, Comment comment){

        BEGIN();
        SELECT("comment.id, comment.content, comment.article_id, comment.user_id, comment.floor, comment.ip, comment.type, comment.flag, comment.create_time, user.nickname, user.picture_url");
        FROM("comment");
        LEFT_OUTER_JOIN("user on comment.user_id = user.id");
        if (comment.getUserId() > 0)
            WHERE("comment.user_id = #{comment.userId}");
        if (comment.getArticleId() > 0)
            WHERE("comment.article_id = #{comment.articleId}");
        if (comment.getFloor() > 0)
            WHERE("comment.floor = #{comment.floor}");
        if (comment.getType() > 0)
            WHERE("comment.type = #{comment.type}");
        if (comment.getFlag() > 0)
            WHERE("comment.flag = #{comment.flag}");
        else
            WHERE("comment.flag < 3");
        String sql = SQL() + " order by comment.create_time desc, comment.id desc " + PageUtil.append(pageInfo);
        logger.debug(sql);
        return sql;
    }

    public String getCommentCount(Comment comment){

        BEGIN();
        SELECT("count(*)");
        FROM("comment");
        if (comment.getUserId() > 0)
            WHERE("user_id = #{comment.userId}");
        if (comment.getArticleId() > 0)
            WHERE("article_id = #{comment.articleId}");
        if (comment.getFloor() > 0)
            WHERE("floor = #{comment.floor}");
        if (comment.getType() > 0)
            WHERE("type = #{comment.type}");
        if (comment.getFlag() > 0)
            WHERE("flag = #{comment.flag}");
        else
            WHERE("flag < 3");
        String sql = SQL();
        logger.debug(sql);
        return sql;
    }

    public String insertComment(Comment comment){
        BEGIN();
        INSERT_INTO("comment");
        if (comment.getContent() != null && comment.getContent() != "")
            VALUES("content", "#{comment.content}");
        if (comment.getArticleId() > 0)
            VALUES("article_id", "#{comment.articleId}");
        if (comment.getUserId() > 0)
            VALUES("user_id", "#{comment.userId}");
        if (comment.getFloor() > 0)
            VALUES("floor", "#{comment.floor}");
        if (comment.getIp() != null && comment.getIp() != "")
            VALUES("ip", "#{comment.ip}");
        if (comment.getType() > 0)
            VALUES("type", "#{comment.type}");
        if (comment.getFlag() > 0)
            VALUES("flag", "#{comment.flag}");
        String sql = SQL();
        logger.debug(sql);
        return sql;
    }

}
