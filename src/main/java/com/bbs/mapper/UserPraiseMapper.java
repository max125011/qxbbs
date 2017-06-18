package com.bbs.mapper;

import com.bbs.model.PageInfo;
import com.bbs.model.UserPraise;
import com.bbs.provider.UserPraiseProvider;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by max on 2017/3/28.
 */
@Mapper
@Repository
public interface UserPraiseMapper {

    @SelectProvider(type = UserPraiseProvider.class, method = "getUserPraiseList")
    List<UserPraise> getUserPraiseList(@Param("pageInfo") PageInfo pageInfo, @Param("praise") UserPraise praise);

    @SelectProvider(type = UserPraiseProvider.class, method = "getUserPraiseCount")
    int getUserPraiseCount(@Param("praise") UserPraise praise);

    @InsertProvider(type = UserPraiseProvider.class, method = "insertUserPraise")
    int insertUserPraise(@Param("praise") UserPraise praise);

    @Delete("delete from user_praise where id = #{id}")
    int deleteUserPraise(@Param("id")int id);

}
