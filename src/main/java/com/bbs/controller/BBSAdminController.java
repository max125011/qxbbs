package com.bbs.controller;

import com.bbs.model.*;
import com.bbs.service.ArticleService;
import com.bbs.service.CommentService;
import com.bbs.service.UserService;
import com.bbs.util.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by max on 2017/4/2.
 */
@Controller
@RequestMapping("/admin")
public class BBSAdminController {

    private static Logger logger = LoggerFactory.getLogger(BBSAdminController.class);

    @Autowired
    ArticleService articleService;

    @Autowired
    CommentService commentService;

    @Autowired
    UserService userService;

    @RequestMapping(value = {"/home", "/"})
    public String adminHome(ModelMap map, HttpServletRequest request){

        int page = 1;
        String  param = request.getParameter("page");
        Article article = new Article();
        //查询所有的精品和非精品
        article.setBetter(-1);
        page = param != null && param != "" ? Integer.valueOf(param) : page;
        PageInfo info = new PageInfo(page, 20);
        List<ArticleDto> list = articleService.getAdminArticleDtoList(info, article);
        info = PageUtil.getPageInfo(info.getPageCurrent(), info.getPageSize(), articleService.getArticleCount(article));

        map.put("articles", list);
        map.put("pageInfo", info);

        return "admin-article";
    }

    @GetMapping("/admin-comment")
    public String adminComment(ModelMap map, HttpServletRequest request){

        int page = 1;
        String  param = request.getParameter("page");
        Comment comment = new Comment();
        page = param != null && param != "" ? Integer.valueOf(param) : page;
        PageInfo info = new PageInfo(page, 20);
        List<CommentDto> list = commentService.getCommentDtoList(info, comment);
        info = PageUtil.getPageInfo(info.getPageCurrent(), info.getPageSize(), commentService.getCommentCount(comment));

        map.put("comments", list);
        map.put("pageInfo", info);

        return "admin-comment";
    }

    @GetMapping("/admin-user")
    public String adminUser(ModelMap map, HttpServletRequest request){

        int page = 1;
        String  param = request.getParameter("page");
        User user = new User();
        page = param != null && param != "" ? Integer.valueOf(param) : page;
        PageInfo info = new PageInfo(page, 20);
        List<User> list = userService.getUserList(info, user);
        info = PageUtil.getPageInfo(info.getPageCurrent(), info.getPageSize(), userService.getUserListCount(user));

        map.put("users", list);
        map.put("pageInfo", info);

        return "admin-user";
    }

    @RequestMapping("/article/{id}")
    public String getArticle(@PathVariable int id, ModelMap map){

        User user = userService.getUserByPoliceId("admin");
        map.put("user", user);
        Article article = articleService.getArticleById(id);
        if (article != null && article.getUserId() > 0){
            User author = userService.getUserById(article.getUserId());
            map.put("author", author);
        }
        map.put("article", article);
        return "new-info";
    }

    @RequestMapping("/write")
    public String writeArticle(ModelMap map){
        User user = userService.getUserByPoliceId("admin");
        map.put("user", user);
        return "new-write";
    }

    @RequestMapping("/edit/{id}")
    public String editArticle(@PathVariable int id, ModelMap map){

        User user = userService.getUserByPoliceId("admin");
        map.put("user", user);
        Article article = articleService.getArticleById(id);
        map.put("article", article);
//        return "edit";
        return "new-edit";
    }

    @RequestMapping("/add-user")
    public String addUser(){
        return "admin-add-user";
    }
}
