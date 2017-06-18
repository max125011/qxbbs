package com.bbs.mapper;

import com.bbs.model.PageInfo;
import com.bbs.model.UserFocus;
import com.bbs.provider.UserFocusProvider;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by max on 2017/3/28.
 */
@Mapper
@Repository
public interface UserFocusMapper {

    @SelectProvider(type = UserFocusProvider.class, method = "getUserFocusList")
    List<UserFocus> getUserFocusList(@Param("pageInfo")PageInfo pageInfo, @Param("focus") UserFocus focus);

    @SelectProvider(type = UserFocusProvider.class, method = "getUserFocusCount")
    int getUserFocusCount(@Param("focus") UserFocus focus);

    @InsertProvider(type = UserFocusProvider.class, method = "insertUserFocus")
    int insertUserFocus(@Param("focus") UserFocus focus);

    @Delete("delete from user_focus where id = #{id}")
    int deleteUserFocus(@Param("id")int id);
}
