package com.bbs.mapper;

import com.bbs.model.Comment;
import com.bbs.model.CommentDto;
import com.bbs.model.PageInfo;
import com.bbs.provider.CommentProvider;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by max on 2017/3/28.
 */
@Mapper
@Repository
public interface CommentMapper {

    @SelectProvider(type = CommentProvider.class, method = "getCommentList")
    List<Comment> getCommentList(@Param("pageInfo") PageInfo pageInfo, @Param("comment") Comment comment);

    @SelectProvider(type = CommentProvider.class, method = "getCommentDtoList")
    List<CommentDto> getCommentDtoList(@Param("pageInfo") PageInfo pageInfo, @Param("comment") Comment comment);

    @SelectProvider(type = CommentProvider.class, method = "getCommentCount")
    int getCommentCount(@Param("comment") Comment comment);

    @Select("select * from comment where id = #{id}")
    Comment getCommentById(@Param("id") int id);

    @Update("update comment set flag = #{flag} where id = #{id}")
    int updateFlag(@Param("id") int id, @Param("flag") int flag);

    @InsertProvider(type = CommentProvider.class, method = "insertComment")
    int insertComment(@Param("comment") Comment comment);
}
