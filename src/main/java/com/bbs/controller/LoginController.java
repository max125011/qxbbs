package com.bbs.controller;

import com.bbs.model.Admin;
import com.bbs.model.User;
import com.bbs.service.AdminService;
import com.bbs.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by max on 2017/3/29.
 */
@Controller
public class LoginController {

    private static Logger logger = LoggerFactory.getLogger(LoginController.class);

    @Autowired
    UserService userService;

    @Autowired
    AdminService adminService;

    /**
     * 普通用户登录
     *
     * @param map
     * @param request
     * @return
     */
    @RequestMapping("/login")
    public String login(ModelMap map, HttpServletRequest request) {

        int type = 1;
        HttpSession session = request.getSession();
        String param = (String) session.getAttribute("userId");
        //如果已经登录后再访问这个页面的时候，直接跳转到首页
        if (param != null && param != "")
            return "redirect:/bbs/home";
        if (request.getMethod().toLowerCase().equals("post")) {
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            String from = (String) request.getSession().getAttribute("from");
            User user = null;
            if (userName != null && userName != "") {
                user = userService.getUserByPoliceId(userName.replaceAll(" ", ""));
            }
            if (user == null)
                type = 2;
            else if (!user.getPassword().equals(password))
                type = 3;
            else {
                session.setAttribute("userId", String.valueOf(user.getId()));
                session.setAttribute("role", "user");
                logger.info("=============用户：【" + user.getNickname() + "】登录了创客平台============");
                if (from != null && from.contains("bbs"))
                    return "redirect:" + from;
                else
                    return "redirect:/bbs/home";
            }
        }
        map.put("type", type);
        return "login";
    }

    /**
     * 超级管理员登录
     *
     * @param map
     * @param request
     * @return
     */
    @RequestMapping("/admin-login")
    public String adminLogin(ModelMap map, HttpServletRequest request) {

        int type = 1;
        HttpSession session = request.getSession();
        String param = (String) session.getAttribute("adminId");
        //如果已经登录后再访问这个页面的时候，直接跳转到首页
        if (param != null && param != "")
            return "redirect:/admin/home";
        if (request.getMethod().toLowerCase().equals("post")) {
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            String from = (String) request.getSession().getAttribute("from");
            Admin admin = null;
            if (userName != null && userName != "") {
                admin = adminService.getAdminByPoliceId(userName);
            }
            if (admin == null)
                type = 2;
            else if (!admin.getPassword().equals(password))
                type = 3;
            else {
                session.setAttribute("adminId", String.valueOf(admin.getId()));
                session.setAttribute("role", "admin");
                logger.info("=============管理员：【" + admin.getNickname() + "】登录了管理员系统============");
                if (from != null && from.contains("admin"))
                    return "redirect:" + from;
                else
                    return "redirect:/admin/home";
            }
        }
        map.put("type", type);
        return "adminLogin";
    }

    @PostMapping("/logout")
    @ResponseBody
    public int logout(HttpSession session){

        session.removeAttribute("userId");
        session.removeAttribute("role");
        session.removeAttribute("from");
        return 1;
    }
}