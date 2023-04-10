package com.admin.servlet;

import com.admin.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "adminDeleteServlet", value = "/admin/delete")
public class AdminDeleteServlet extends HttpServlet {

    private AdminService adminService = new AdminService();

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String admin_id = request.getParameter("admin_id");
//        Boolean result = this.adminService.deleteAdminInfo(admin_id == null || admin_id.trim().length()== 0 ? 0 : Integer.parseInt(admin_id));
        Boolean result = this.adminService.deleteAdminInfo(admin_id == null ? 0 : Integer.parseInt(admin_id));
        if (!result)
            System.out.println("删除书籍信息失败！");//这句判断到底有什么用
        response.sendRedirect("list");
    }

    public void destroy() {
    }
}
