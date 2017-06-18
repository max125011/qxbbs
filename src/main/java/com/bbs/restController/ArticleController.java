package com.bbs.restController;

import com.bbs.model.*;
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
@RequestMapping("/article")
public class ArticleController {

    Logger logger = LoggerFactory.getLogger(ArticleController.class);

    @Autowired
    ArticleService articleService;

    @Autowired
    UserService userService;

    @Autowired
    AdminService adminService;

    @GetMapping("/better/list")
    public ResponseVo getBetterArticleList(HttpServletRequest request){

        ResponseVo vo = new ResponseVo();
        HttpSession session = request.getSession();
        String userId = (String)session.getAttribute("userId");
        String param = request.getParameter("page");
        int page = param == null ? 1 :Integer.valueOf(param);
//        User user = userService.getUserById(Integer.valueOf(userId));
        PageInfo pageInfo = new PageInfo(page,8);
        Article article = new Article();
//        article.setGroupId(user.getGroupId());
        article.setBetter(1);
        article.setFlag(2);
        List<ArticleDto> list = articleService.getArticleDtoList(pageInfo, article);
        pageInfo = PageUtil.getPageInfo(pageInfo.getPageCurrent(), pageInfo.getPageSize(),
                articleService.getArticleCount(article));

        vo.setList(list);
        vo.setPageInfo(pageInfo);
        return vo;
    }

    @GetMapping("/common/list")
    public ResponseVo getCommonArticleList(HttpServletRequest request){

        ResponseVo vo = new ResponseVo();
        HttpSession session = request.getSession();
        String userId = (String)session.getAttribute("userId");
        String param = request.getParameter("page");
        int page = param == null ? 1 :Integer.valueOf(param);
//        User user = userService.getUserById(Integer.valueOf(userId));
        PageInfo pageInfo = new PageInfo(page,10);
        Article article = new Article();
//        article.setGroupId(user.getGroupId());
        article.setBetter(0);
        article.setFlag(2);
        List<ArticleDto> list = articleService.getArticleDtoList(pageInfo, article);
        pageInfo = PageUtil.getPageInfo(pageInfo.getPageCurrent(), pageInfo.getPageSize(),
                articleService.getArticleCount(article));

        vo.setList(list);
        vo.setPageInfo(pageInfo);
        return vo;
    }

    @PostMapping("/focus/{id}")
    public int focusArticle(@PathVariable int id){
        if (id > 0)
            return articleService.increaseFocusNum(id);
        else
            return 0;
    }

    @PostMapping("/praise/{id}")
    public int praiseArticle(@PathVariable int id){
        if (id > 0)
            return articleService.increasePraiseNum(id);
        else
            return 0;
    }

    @PostMapping("/better/{id}")
    public int setArticleBetter(@PathVariable int id){
        if (id > 0)
            return articleService.setBetter(id);
        else
            return 0;
    }

    @PostMapping("/delete/{id}")
    public int deleteArticle(@PathVariable int id){
        if (id > 0)
            return articleService.updateFlag(id, 3);
        else
            return 0;
    }

    @PostMapping("/check/{id}")
    public int checkArticle(@PathVariable int id){
        if (id > 0)
            return articleService.updateFlag(id, 2);
        else
            return 0;
    }

    /**
     *  is = true时，直接将id对应的Article的groupId置
     *  is = false时，先判断有没有传userId，如果有直接将Article的groupId置为user所对应的g为0（帖子置为公共的）roupId值，否则从session中取
     *      userId来获得user的groupId值
     *
     * @param request
     * @param id
     * @param is
     * @return
     */
    @PostMapping("/public/{id}")
    public int toPublic(HttpServletRequest request,@PathVariable int id, boolean is){

        int groupId = 0;
        if (is == false){
            User user = null;
            String userId = request.getParameter("user");
            if (userId != null && userId != ""){
                user = userService.getUserById(Integer.valueOf(userId));
                if (user != null)
                    groupId = user.getGroupId();
                else {
                    userId = (String)request.getSession().getAttribute("userId");
                    if (userId != null && userId != ""){
                        user = userService.getUserById(Integer.valueOf(userId));
                        if (user != null)
                            groupId = user.getGroupId();
                        else
                            return 0;
                    }
                }
            }
        }
        return articleService.updateGroup(id, groupId);
    }

    @PostMapping("/insert")
    public int insertArticle(String title, String titleColor, String content, String summary, String leadComment, HttpServletRequest request){

        HttpSession session = request.getSession();
        int res = 0;
        if (title != null && content != null){

            String author = request.getParameter("author");
            String userId = (String)session.getAttribute("userId");
            String admin = (String)session.getAttribute("adminId");
            if ((userId == null || userId == "") && (admin == null || admin == ""))
                return res;
            User user;
            if (userId == null)
                user = userService.getUserByPoliceId("admin");
            else
                user = userService.getUserById(Integer.valueOf(userId));
            Article article = new Article();
            article.setTitle(title);
            article.setTitleColor(titleColor);
            if (author != null && author != "")
                article.setAuthor(author);
            article.setSummary(summary);
            article.setContent(content);
            article.setLeadComment(leadComment);
            article.setUserId(user.getId());
            article.setIp(IPUtil.getIpAddr(request));

            res = articleService.insertArticle(article);
        }
        return res;
    }

    @PostMapping("/update")
    public int updateArticle(int id, String title, String titleColor, String content, String summary, String leadComment, HttpServletRequest request){

        HttpSession session = request.getSession();
        int res = 0;
        if (title != null){
            String author = request.getParameter("author");
            String userId = (String)session.getAttribute("userId");
            String admin = (String)session.getAttribute("adminId");
            if ((userId == null || userId == "") && (admin == null || admin == ""))
                return res;
            Article article = new Article();
            article.setId(id);
            article.setTitle(title);
            article.setTitleColor(titleColor);
            if (author != null && author != "")
                article.setAuthor(author);
            article.setSummary(summary);
            article.setContent(content);
            article.setLeadComment(leadComment);
            article.setIp(IPUtil.getIpAddr(request));

            res = articleService.updateArticle(article);
        }
        return res;
    }


}
