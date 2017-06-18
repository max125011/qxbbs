package com.bbs.mapper;

import com.bbs.model.ArticlePraise;
import com.bbs.model.PageInfo;
import com.bbs.provider.ArticlePraiseProvider;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by max on 2017/3/28.
 */
@Mapper
@Repository
public interface ArticlePraiseMapper {

    @SelectProvider(type = ArticlePraiseProvider.class, method = "getArticlePraiseList")
    List<ArticlePraise> getArticlePraiseList(@Param("pageInfo") PageInfo pageInfo, @Param("praise") ArticlePraise praise);

    @SelectProvider(type = ArticlePraiseProvider.class, method = "getArticlePraiseCount")
    int getArticlePraiseCount(@Param("praise") ArticlePraise praise);

    @InsertProvider(type = ArticlePraiseProvider.class, method = "insertArticlePraise")
    int insertArticlePraise(@Param("praise") ArticlePraise praise);

    @Delete("delete from article_praise where id = #{id}")
    int deleteArticlePraise(@Param("id")int id);

}
