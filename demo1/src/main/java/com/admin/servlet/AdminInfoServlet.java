package com.admin.servlet;

import com.admin.entity.AdminInfo;
import com.admin.service.AdminService;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "adminInfoServlet", value = "/admin/content")
public class AdminInfoServlet extends HttpServlet {

    private AdminService adminService = new AdminService();

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //从页面获取参数admin_id
        String admin_id = request.getParameter("admin_id");
        AdminInfo adminInfo = this.adminService.getAdminInfo(admin_id == null ? 0 : Integer.parseInt(admin_id));
        //传输adminInfo给页面
        request.getSession().setAttribute("adminInfo", adminInfo);
        //跳转页面到admin_info
        request.getRequestDispatcher("admin_info.jsp").forward(request, response);
    }

    public void destroy() {
    }
}
