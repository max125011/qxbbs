package com.bbs.restController;

import com.bbs.model.Article;
import com.bbs.model.PageInfo;
import com.bbs.model.ResponseVo;
import com.bbs.model.User;
import com.bbs.service.AdminService;
import com.bbs.service.ArticleService;
import com.bbs.service.UserService;
import com.bbs.util.IPUtil;
import com.bbs.util.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by max on 2017/3/28.
 */
@RestController
@RequestMapping("/admin/article")
public class AdminArticleController {

    Logger logger = LoggerFactory.getLogger(AdminArticleController.class);

    @Autowired
    ArticleService articleService;

    @Autowired
    UserService userService;

    @Autowired
    AdminService adminService;

    @GetMapping("/list")
    public ResponseVo getArticleList(PageInfo pageInfo, Article article){

        ResponseVo vo = new ResponseVo();
        pageInfo = pageInfo.getPageSize() > 0 && pageInfo.getPageSize() > 0 ? pageInfo : new PageInfo(1, 20);
        List<Article> list = articleService.getArticleList(pageInfo, article);
        pageInfo = PageUtil.getPageInfo(pageInfo.getPageCurrent(), pageInfo.getPageSize(),
                articleService.getArticleCount(article));
        vo.setList(list);
        vo.setPageInfo(pageInfo);

        return vo;
    }

    @PostMapping("/check/{id}")
    public int checkArticle(@PathVariable int id){

        int res = id > 0 ? articleService.updateFlag(id, 2) : 0;
        return res;
    }

    @PostMapping("/delete/{id}")
    public int deleteArticle(@PathVariable int id){

        int res = id > 0 ? articleService.updateFlag(id, 3) : 0;
        return res;
    }

    @PostMapping("/better/{id}")
    public int betterArticle(@PathVariable int id){

        int res = id > 0 ? articleService.setBetter(id) : 0;
        return res;
    }

    @PostMapping("/top/{id}")
    public int setTop(@PathVariable int id){
        if (id > 0)
            return articleService.setTop(id);
        else
            return 0;
    }

    @PostMapping("/cancelTop/{id}")
    public int cancelTop(@PathVariable int id){
        if (id > 0)
            return articleService.cancelTop(id);
        else
            return 0;
    }

}
