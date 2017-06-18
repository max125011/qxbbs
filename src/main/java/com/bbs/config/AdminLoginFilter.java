package com.bbs.config;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by max on 2017/4/1.
 */
@WebFilter(filterName="AdminLoginFilter",urlPatterns="/admin/*")
public class AdminLoginFilter implements Filter {

    @Override
    public void init(FilterConfig config) throws ServletException {
        System.out.println("====================管理员过滤器初始化========================");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        String adminId = (String)session.getAttribute("adminId");
        String role = (String)session.getAttribute("role");
        if (adminId == null || role == null || adminId =="" || role == ""){
            session.setAttribute("from", request.getRequestURI());
            response.sendRedirect("/admin-login");
        } else
            filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        System.out.println("====================登录锅过滤器注销========================");
    }
}
