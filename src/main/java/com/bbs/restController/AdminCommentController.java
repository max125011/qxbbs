package com.bbs.restController;

import com.bbs.model.Comment;
import com.bbs.model.PageInfo;
import com.bbs.model.ResponseVo;
import com.bbs.service.CommentService;
import com.bbs.util.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by max on 2017/4/3.
 */
@RestController
@RequestMapping("/admin/comment")
public class AdminCommentController {

    private static Logger logger = LoggerFactory.getLogger(AdminCommentController.class);

    @Autowired
    CommentService commentService;

    @RequestMapping("/list")
    public ResponseVo getCommentList(PageInfo info, Comment comment){

        ResponseVo vo = new ResponseVo();
        info = info.getPageCurrent() > 0 && info.getPageSize() > 0 ? info : new PageInfo(1, 20);
        List<Comment> list = commentService.getCommentList(info, comment);
        info = PageUtil.getPageInfo(info.getPageCurrent(), info.getPageSize(), commentService.getCommentCount(comment));

        vo.setList(list);
        vo.setPageInfo(info);
        return vo;
    }

    @PostMapping("/check/{id}")
    public int check(@PathVariable int id){

        int res = id > 0 ? commentService.updateFlag(id, 2) : 0;
        return  res;
    }

    @PostMapping("/delete/{id}")
    public int deleteUser(@PathVariable int id){

        int res = id > 0 ? commentService.updateFlag(id, 3) : 0;
        return  res;
    }

}
