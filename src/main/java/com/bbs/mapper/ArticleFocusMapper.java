package com.bbs.mapper;

import com.bbs.model.ArticleFocus;
import com.bbs.model.PageInfo;
import com.bbs.provider.ArticleFocusProvider;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by max on 2017/3/28.
 */
@Mapper
@Repository
public interface ArticleFocusMapper {

    @SelectProvider(type = ArticleFocusProvider.class, method = "getArticleFocusList")
    List<ArticleFocus> getArticleFocusList(@Param("focus") PageInfo pageInfo, ArticleFocus focus);

    @SelectProvider(type = ArticleFocusProvider.class, method = "getArticleFocusCount")
    int getArticleFocusCount(@Param("focus") ArticleFocus focus);

    @InsertProvider(type = ArticleFocusProvider.class, method = "insertArticleFocus")
    int insertArticleFocus(@Param("focus") ArticleFocus focus);

    @Delete("delete from article_focus where id = #{id}")
    int deleteArticleFocus(@Param("id")int id);
}
