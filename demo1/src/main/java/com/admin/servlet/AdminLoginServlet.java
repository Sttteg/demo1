package com.admin.servlet;

import com.admin.dao.AdminDao;
import com.admin.entity.AdminInfo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "AdminLoginServlet", value = "/Login")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        String account = request.getParameter("account");
        String password = request.getParameter("password");
        PrintWriter out = response.getWriter();
//        out.println("输入账号为："+id+"输入的密码为："+pwd);
        try {
            AdminDao adminDao = new AdminDao();
            AdminInfo adminInfo = adminDao.login(account, password);
            if (adminInfo != null) {
//                request.setAttribute("account", adminInfo.getAccount());
//                out.println("登陆成功!尊贵的" + adminInfo.getAccount()+"管理员");
                //跳转到admin/list页面
                response.sendRedirect("admin/list");
            }
            else {
//                request.setAttribute("u13_input","<label>登录失败，账号或密码错误！</label>");
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
