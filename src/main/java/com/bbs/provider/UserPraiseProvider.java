package com.bbs.provider;

import com.bbs.model.PageInfo;
import com.bbs.model.UserPraise;
import com.bbs.util.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.apache.ibatis.jdbc.SqlBuilder.*;

/**
 * Created by max on 2017/3/29.
 */
public class UserPraiseProvider {

    private static Logger logger = LoggerFactory.getLogger(UserPraiseProvider.class);

    public String getUserPraiseList(PageInfo pageInfo, UserPraise praise){

        BEGIN();
        SELECT("*");
        FROM("user_praise");
        if (praise.getUserId() > 0)
            WHERE("user_id = #{praise.userId}");
        if (praise.getPraiseOn() > 0)
            WHERE("praise_on = #{praise.praiseOn}");

        String sql = SQL() + " order by create_time desc " + PageUtil.append(pageInfo);
        logger.debug(sql);
        return sql;
    }

    public String getUserPraiseCount(UserPraise praise){

        BEGIN();
        SELECT("count(*)");
        FROM("user_praise");
        if (praise.getUserId() > 0)
            WHERE("user_id = #{praise.userId}");
        if (praise.getPraiseOn() > 0)
            WHERE("praise_on = #{praise.praiseOn}");
        String sql = SQL();
        logger.debug(sql);
        return sql;
    }

    public String insertUserPraise(UserPraise praise){

        BEGIN();
        INSERT_INTO("user_praise");
        if (praise.getPraiseOn() > 0)
            VALUES("praise_on", "#{praise.praiseOn}");
        if (praise.getUserId() > 0)
            VALUES("user_id", "#{praise.userId}");
        String sql = SQL();
        logger.debug(sql);
        return sql;
    }

}
