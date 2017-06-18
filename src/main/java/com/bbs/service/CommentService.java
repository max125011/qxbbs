package com.bbs.service;

import com.bbs.model.Comment;
import com.bbs.model.CommentDto;
import com.bbs.model.PageInfo;

import java.util.List;

/**
 * Created by max on 2017/3/27.
 */
public interface CommentService {

    List<Comment> getCommentList(PageInfo pageInfo, Comment comment);

    List<CommentDto> getCommentDtoList(PageInfo pageInfo, Comment comment);

    int getCommentCount(Comment comment);

    int updateFlag(int id, int flag);

    int insertComment(Comment comment);
}
