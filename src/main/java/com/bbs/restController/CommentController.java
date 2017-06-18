package com.bbs.restController;

import com.bbs.model.Comment;
import com.bbs.model.CommentDto;
import com.bbs.model.PageInfo;
import com.bbs.model.ResponseVo;
import com.bbs.service.ArticleService;
import com.bbs.service.CommentService;
import com.bbs.util.IPUtil;
import com.bbs.util.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by max on 2017/3/28.
 */
@RestController
@RequestMapping("/comment")
public class CommentController {

    Logger logger = LoggerFactory.getLogger(CommentController.class);

    @Autowired
    CommentService commentService;

    @Autowired
    ArticleService articleService;

    @GetMapping("/list")
    public ResponseVo getComments(int id, int page){
        ResponseVo vo = new ResponseVo();
        page = page > 0 ? page : 1;
        PageInfo pageInfo = new PageInfo(page, 10);
        Comment comment = new Comment();
        comment.setArticleId(id);
        comment.setFlag(2);
        List<CommentDto> list = commentService.getCommentDtoList(pageInfo, comment);
        vo.setList(list);
        vo.setPageInfo(PageUtil.getPageInfo(page, 10, commentService.getCommentCount(comment)));
        return vo;
    }


    @PostMapping("/insert")
    public int insertComment(HttpServletRequest request, Comment comment){

        int res = 0;
        if (comment.getArticleId() > 0 && comment.getUserId() > 0 && comment.getContent() != null && comment.getContent() != ""){
            comment.setIp(IPUtil.getIpAddr(request));
            res = commentService.insertComment(comment);
            articleService.updateCommentNum(comment.getArticleId());
        }
        return res;
    }



}
