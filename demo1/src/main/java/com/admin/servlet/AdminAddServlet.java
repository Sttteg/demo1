package com.admin.servlet;

import com.admin.entity.AdminInfo;
import com.admin.service.AdminService;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "adminAddServlet", value = "/admin/add")
public class AdminAddServlet extends HttpServlet {

    private AdminService adminService = new AdminService();

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }


    public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AdminInfo adminInfo = new AdminInfo();
        //读取页面输入的value
        adminInfo.setAccount(request.getParameter("account") == null ? "":request.getParameter("account"));//这里出问题了
        adminInfo.setPassword(request.getParameter("password") == null ? "":request.getParameter("password"));
        adminInfo.setAdmin_type(request.getParameter("admin_type") == null ? 0 : Integer.parseInt(request.getParameter("admin_type")));
        AdminInfo result = this.adminService.addAdminInfo(adminInfo);

        if(result == null)//这一句都没用
            System.out.println("添加用户信息失败!!!");
        response.sendRedirect("list");
    }

    public void destroy() {
    }
}
