package com.bbs.mapper;

import com.bbs.model.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * Created by max on 2017/3/28.
 */
@Mapper
@Repository
public interface AdminMapper {

    @Select("select * from admin where id = #{id} and flag = 1")
    Admin getAdminById(@Param("id") int id);

    @Select("select * from admin where police_id = #{id} and flag < 3")
    Admin getAdminByPoliceId(@Param("id") String id);
}
