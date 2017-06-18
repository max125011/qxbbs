package com.bbs.provider;

import com.bbs.model.PageInfo;
import com.bbs.model.User;
import com.bbs.util.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.apache.ibatis.jdbc.SqlBuilder.*;

/**
 * Created by max on 2017/3/29.
 */
public class UserProvider {

    private static Logger logger = LoggerFactory.getLogger(UserProvider.class);

    public String getUserList(PageInfo pageinfo, User user){
        BEGIN();
        SELECT("*");
        FROM("user");
        if (user.getFlag() > 0)
            WHERE("flag = #{user.flag}");
        if (user.getGroupId() > 0)
            WHERE("group_id = #{user.groupId}");

        String sql = SQL() + " order by create_time desc " + PageUtil.append(pageinfo);
        logger.debug(sql);
        return sql;
    }

    public String getUserListCount(User user){
        BEGIN();
        SELECT("count(*)");
        FROM("user");
        if (user.getFlag() > 0)
            WHERE("flag = #{user.flag}");
        if (user.getGroupId() > 0)
            WHERE("group_id = #{user.groupId}");

        String sql = SQL();
        logger.debug(sql);
        return sql;
    }

    public String insertUser(User user){

        BEGIN();
        INSERT_INTO("user");
        if (user.getPoliceId() != null && user.getPoliceId() != "")
            VALUES("police_id", "#{user.policeId}");
        if (user.getNickname() != null && user.getNickname() != "")
            VALUES("nickname", "#{user.nickname}");
        if (user.getName() != null && user.getName() != "")
            VALUES("name", "#{user.name}");
        if (user.getAge() > 0)
            VALUES("age", "#{user.age}");
        if (user.getSex() != null && user.getSex() != "")
            VALUES("sex", "#{user.sex}");
        if (user.getEmail() != null && user.getEmail() != "")
            VALUES("email", "#{user.email}");
        if (user.getPassword() != null && user.getPassword() != "")
            VALUES("password", "#{user.password}");
        if (user.getPhone() != null && user.getPhone() != "")
            VALUES("phone", "#{user.phone}");
        if (user.getGroupName() != null && user.getGroupName() != "")
            VALUES("group_name", "#{user.groupName}");
        if (user.getPictureUrl() != null && user.getPictureUrl() != "")
            VALUES("picture_url", "#{user.pictureUrl}");
        if (user.getGroupId() > 0)
            VALUES("group_id", "#{user.groupId}");

        String sql = SQL();
        logger.debug(sql);
        return sql;
    }

    public String updateUser(User user){

        BEGIN();
        UPDATE("user");
        if (user.getPictureUrl() != null && user.getPictureUrl() != "")
            SET("picture_url = #{user.pictureUrl}");
        if (user.getNickname() != null && user.getNickname() != "")
            SET("nickname = #{user.nickname}");
        if (user.getPassword() != null && user.getPassword() != "")
            SET("password = #{user.password}");
        WHERE("id = #{user.id}");
        String sql = SQL();
        logger.debug(sql);
        return sql;
    }

}
