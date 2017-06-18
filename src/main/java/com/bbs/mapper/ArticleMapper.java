package com.bbs.mapper;

import com.bbs.model.Article;
import com.bbs.model.ArticleDto;
import com.bbs.model.PageInfo;
import com.bbs.provider.ArticleProvider;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by max on 2017/3/28.
 */
@Mapper
@Repository
public interface ArticleMapper {

    @SelectProvider(type = ArticleProvider.class, method = "getArticleList")
    List<Article> getArticleList(@Param("pageInfo")PageInfo pageInfo, @Param("article") Article article);

    @SelectProvider(type = ArticleProvider.class, method = "getArticleDtoList")
    List<ArticleDto> getArticleDtoList(@Param("pageInfo")PageInfo pageInfo, @Param("article") Article article);

    @SelectProvider(type = ArticleProvider.class, method = "getAdminArticleDtoList")
    List<ArticleDto> getAdminArticleDtoList(@Param("pageInfo")PageInfo pageInfo, @Param("article") Article article);

    @SelectProvider(type = ArticleProvider.class, method = "getArticleCount")
    int getArticleCount(@Param("article") Article article);

    @Select("select * from article where id = #{id}")
    Article getArticleById(@Param("id")int id);

    @InsertProvider(type = ArticleProvider.class ,method = "insertArticle")
    int insertArticle(@Param("article") Article article);

    @UpdateProvider(type = ArticleProvider.class ,method = "updateArticle")
    int updateArticle(@Param("article")Article article);

    @Update("update article set focus_num = focus_num + 1 where id = #{id}")
    int increaseFocusNum(@Param("id") int id);

    @Update("update article set praise_num = praise_num + 1 where id = #{id}")
    int increasePraiseNum(@Param("id") int id);

    @Update("update article set comment_num = (select count(*) from comment where article_id = #{id} and flag = 2) where id = #{id}")
    int updateCommentNum(@Param("id") int id);

    @Update("update article set better = 1 where id = #{id}")
    int setBetter(@Param("id") int id);

    @Update("update article set read_times = read_times + 1 where id = #{id}")
    int increaseReadTimes(@Param("id") int id);

    @Update("update article set group_id = #{groupId} where id = #{id}")
    int updateGroup(@Param("id") int id, @Param("groupId") int groupId);

    @Update("update article set flag = #{flag} where id = #{id}")
    int updateFlag(@Param("id") int id, @Param("flag")int flag);

    @Update("update article set top = #{top} where id = #{id}")
    int updateTop(@Param("id")int id, @Param("top")int top);

}
