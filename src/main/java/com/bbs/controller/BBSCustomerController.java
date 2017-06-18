package com.bbs.controller;

import com.bbs.model.Article;
import com.bbs.model.User;
import com.bbs.service.ArticleService;
import com.bbs.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by max on 2017/3/31.
 */
@Controller
@RequestMapping("/bbs")
public class BBSCustomerController {

    private static Logger logger = LoggerFactory.getLogger(BBSCustomerController.class);

    @Autowired
    ArticleService articleService;

    @Autowired
    UserService userService;

    @RequestMapping(value = "/home")
    public String home(ModelMap map, HttpServletRequest request){

        String userId = (String)request.getSession().getAttribute("userId");
        if (userId != null && userId != ""){
            User user = userService.getUserById(Integer.valueOf(userId));
            map.put("user", user);
        }
        Date date = new Date();
        String time = (new SimpleDateFormat("yyyy年MM月dd日")).format(date);
        map.put("time", time);
//        return "home";
        return "new-home";
    }

    @GetMapping("/info/{id}")
    public String ArticleInfo(HttpServletRequest request, @PathVariable int id, ModelMap map){

        String userId = (String)request.getSession().getAttribute("userId");
        if (userId != null && userId != ""){
            User user = userService.getUserById(Integer.valueOf(userId));
            map.put("user", user);
        }
        Article article = articleService.getArticleById(id);
        if (article != null && article.getUserId() > 0){
            User author = userService.getUserById(article.getUserId());
            map.put("author", author);
        }
        map.put("article", article);
        articleService.increaseReadTimes(id);
//        return "info";
        return "new-info";
    }

    @RequestMapping("/write")
    public String writeArticle(HttpServletRequest request, ModelMap map){
        String userId = (String)request.getSession().getAttribute("userId");
        if (userId != null && userId != ""){
            User user = userService.getUserById(Integer.valueOf(userId));
            map.put("user", user);
        }
//        return "write";
        return "new-write";
    }
    @RequestMapping("/edit/{id}")
    public String editArticle(HttpServletRequest request, @PathVariable int id, ModelMap map){
        String userId = (String)request.getSession().getAttribute("userId");
        if (userId != null && userId != ""){
            User user = userService.getUserById(Integer.valueOf(userId));
            map.put("user", user);
        }
        Article article = articleService.getArticleById(id);
        map.put("article", article);
//        return "edit";
        return "new-edit";
    }

    @RequestMapping("/user/update/{id}")
    public String updateUser(HttpServletRequest request, @PathVariable int id, ModelMap map){

        String userId = (String)request.getSession().getAttribute("userId");
        if (userId != null && userId != "" && id == Integer.valueOf(userId)){
            User user = userService.getUserById(Integer.valueOf(userId));
            map.put("user", user);
            List<String> pictures = userService.getUserPictureList();
            map.put("pictures", pictures);
        }else
            return "redirect:/bbs/home";
        return "updateUser";
    }

}
