package com.bbs.config;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by max on 2017/3/27.
 */
@WebFilter(filterName="loginFilter",urlPatterns="/bbs/*")
public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig config) throws ServletException {
        System.out.println("====================登录过滤器初始化========================");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        String userId = (String)session.getAttribute("userId");
        String role = (String)session.getAttribute("role");
//        String visitor = (String)session.getAttribute("visitor");
        if (userId == null || role == null || userId =="" || role == ""){
            String url = request.getRequestURI();
            session.setAttribute("from", url);
            if (url.contains("home") || url.contains("info")){
                filterChain.doFilter(request, response);
            }else{
                response.sendRedirect("/login");
            }

        } else
            filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        System.out.println("====================登录锅过滤器注销========================");
    }
}
