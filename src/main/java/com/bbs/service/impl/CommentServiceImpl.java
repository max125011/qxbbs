package com.bbs.service.impl;

import com.bbs.mapper.CommentMapper;
import com.bbs.model.Comment;
import com.bbs.model.CommentDto;
import com.bbs.model.PageInfo;
import com.bbs.service.ArticleService;
import com.bbs.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by max on 2017/3/29.
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    CommentMapper commentMapper;

    @Autowired
    ArticleService articleService;

    @Override
    public List<Comment> getCommentList(PageInfo pageInfo, Comment comment) {
        return commentMapper.getCommentList(pageInfo, comment);
    }

    @Override
    public List<CommentDto> getCommentDtoList(PageInfo pageInfo, Comment comment) {
        return commentMapper.getCommentDtoList(pageInfo, comment);
    }

    @Override
    public int getCommentCount(Comment comment) {
        return commentMapper.getCommentCount(comment);
    }

    @Override
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    public int updateFlag(int id, int flag) {

        int res = commentMapper.updateFlag(id, flag);
        if (res == 1)
            res = articleService.updateCommentNum(commentMapper.getCommentById(id).getArticleId());
        return res;
    }

    @Override
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRED)
    public int insertComment(Comment comment) {
        comment.setFlag(2);
        comment.setType(1);
        int floor = commentMapper.getCommentCount(comment);
        comment.setFloor(floor + 1);
        int res =  commentMapper.insertComment(comment);

        return res;
    }
}
