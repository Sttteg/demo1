package com.admin.servlet;

import com.admin.entity.AdminInfo;
import com.admin.service.AdminService;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "adminModifyServlet", value = "/admin/modify")
public class AdminModifyServlet extends HttpServlet {
    private AdminService adminService = new AdminService();

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }

    public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        AdminInfo adminInfo = new AdminInfo();
        adminInfo.setAdmin_id(request.getParameter("admin_id") == null ? 0 : Integer.parseInt(request.getParameter("admin_id")));
        adminInfo.setAccount(request.getParameter("account") == null ? "" : request.getParameter("account"));
        adminInfo.setPassword(request.getParameter("password") == null ? "" : request.getParameter("password"));
        adminInfo.setAdmin_type(request.getParameter("admin_type") == null ? 0 : Integer.parseInt(request.getParameter("admin_type")));
        AdminInfo result = this.adminService.modifyAdminInfo(adminInfo);
        if (result == null)
            System.out.println("修改管理员信息失败！");
        response.sendRedirect("list");
    }

    public void destroy() {
    }
}
