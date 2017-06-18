package com.bbs.mapper;

import com.bbs.model.PageInfo;
import com.bbs.model.User;
import com.bbs.provider.UserProvider;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by max on 2017/3/28.
 */
@Mapper
@Repository
public interface UserMapper {

    @SelectProvider(type = UserProvider.class, method = "getUserList")
    List<User> getUserList(@Param("pageInfo") PageInfo pageInfo, @Param("user") User user);

    @SelectProvider(type = UserProvider.class, method = "getUserListCount")
    int getUserListCount(@Param("user") User user);

    @Select("select * from user where id = #{id} and flag = 2")
    User getUserById(@Param("id") int id);

    @Select("select * from user where police_id = #{policeId} and flag = 2")
    User getUserByPoliceId(@Param("policeId")String policeId);

    @InsertProvider(type = UserProvider.class, method = "insertUser")
    int insertUser(@Param("user") User user);

    @UpdateProvider(type = UserProvider.class, method = "updateUser")
    int updateUser(@Param("user") User user);

    @Update("update user set read_times = read_times + 1 where id = #{id} and flag = 2")
    int updateReadTimes(@Param("id") int id);

    @Update("update user set flag = #{flag} where id = #{id}")
    int updateFlag(@Param("id") int id, @Param("flag") int flag);

    @Select("select name from user_picture")
    List<String> getUserPictureList();
}
