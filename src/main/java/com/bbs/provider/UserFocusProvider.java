package com.bbs.provider;

import com.bbs.model.PageInfo;
import com.bbs.model.UserFocus;
import com.bbs.util.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.apache.ibatis.jdbc.SqlBuilder.*;

/**
 * Created by max on 2017/3/29.
 */
public class UserFocusProvider {

    private static Logger logger = LoggerFactory.getLogger(UserFocusProvider.class);

    public String getUserFocusList(PageInfo pageInfo, UserFocus focus){

        BEGIN();
        SELECT("*");
        FROM("user_focus");
        if (focus.getUserId() > 0)
            WHERE("user_id = #{focus.userId}");
        if (focus.getFocusOn() > 0)
            WHERE("focus_on = #{focus.focusOn}");

        String sql = SQL() + " order by create_time desc " + PageUtil.append(pageInfo);
        logger.debug(sql);
        return sql;
    }

    public String getUserFocusCount(UserFocus focus){

        BEGIN();
        SELECT("count(*)");
        FROM("user_focus");
        if (focus.getUserId() > 0)
            WHERE("user_id = #{focus.userId}");
        if (focus.getFocusOn() > 0)
            WHERE("focus_on = #{focus.focusOn}");
        String sql = SQL();
        logger.debug(sql);
        return sql;
    }

    public String insertUserFocus(UserFocus focus){

        BEGIN();
        INSERT_INTO("user_focus");
        if (focus.getFocusOn() > 0)
            VALUES("focus_on","#{focus.focusOn}");
        if (focus.getUserId() > 0)
            VALUES("user_id", "#{focus.userId}");
        String sql = SQL();
        logger.debug(sql);
        return sql;
    }

}
