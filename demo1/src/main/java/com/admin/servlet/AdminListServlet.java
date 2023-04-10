package com.admin.servlet;

import com.admin.dao.AdminDao;
import com.admin.entity.AdminInfo;
import com.admin.service.AdminService;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "adminListServlet", value = "/admin/list")
public class AdminListServlet extends HttpServlet {
    private final AdminService adminService = new AdminService();

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
//        AdminInfo adminInfo = new AdminInfo();
//        adminInfo.setAccount(request.getParameter("account") == null ? "" : request.getParameter("account"));
////        adminInfo.setPassword(request.getParameter("password") == null ? "" : request.getParameter("password"));
//        adminInfo.setAdmin_type(request.getParameter("admin_type") == null ? 0 : Integer.parseInt(request.getParameter("admin_type")));
//        List<AdminInfo> adminInfos = this.adminService.getAdminInfos(adminInfo);
//        request.getSession().setAttribute("searchCondition", adminInfo);
//        request.getSession().setAttribute("adminInfos", adminInfos);//发送给界面的参数
//        request.getRequestDispatcher("admin_list.jsp").forward(request,response);
//    }
//
//    public void destroy() {
//    }
        AdminDao adminDao = new AdminDao();
        AdminInfo adminInfo = new AdminInfo();
        //request.getParameter:将jsp中的数据读取出来
//        adminInfo.setAdmin_id(request.getParameter("admin_id") == null ?0:Integer.parseInt(request.getParameter("admin_id")));
        adminInfo.setAccount(request.getParameter("account") == null ? "" : request.getParameter("account"));
        adminInfo.setAdmin_type(request.getParameter("admin_type") == null ? 0 : Integer.parseInt(request.getParameter("admin_type")));

        int pageSize = 6;//每页最多数据数
        int pageNum = 1;//当前页数
        long totalCount = adminDao.getTotalCount(adminInfo);//总条数
        int totalPage = 0;//页面总数(最后一页)


        //这里是求页面的总数,用数据总条数去%(求余)每一页的数据数
        if (totalCount % pageSize == 0) {
            totalPage = (int) (totalCount / pageSize);//取整
        } else {
            totalPage = (int) (totalCount / pageSize) + 1;//取整后+1
        }
        //totalPage总页数=总条数/每页显示的数量
        try {
            pageNum = Integer.parseInt(request.getParameter("pageNum")==null ? "1" : request.getParameter("pageNum"));
            if (pageNum <= 0) {
                pageNum = 1;//小于最小页数和大于最大页数的判定
            }
            if (pageNum > totalPage) {
                pageNum = totalPage;
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        int index = (pageNum - 1) * pageSize;//初始页数的计算方法

        adminDao.listLimit(adminInfo,index,pageSize);//在adminDao里面调用这三个参数
        List<AdminInfo> adminInfos = this.adminService.getAdminInfos(adminInfo,index, pageSize);
            //request.setAttribute这个的生命周期就是request级别的(只能在request里面使用)
            //request.getSession().setAttribute这个的生命周期是session级别的(只要当前会话不过期， 任何地方都可以访问到)
            //set()是给属性赋值的，get()是取得属性值的
        //下面都是返回给页面的值
        request.getSession().setAttribute("searchCondition", adminInfo);
        request.getSession().setAttribute("adminInfos", adminInfos);
        request.setAttribute("adminInfos", adminInfos);
        request.setAttribute("pageNum", pageNum);
//        request.setAttribute("admin_id",admin_id);
        request.setAttribute("account", adminInfo.getAccount());
        request.setAttribute("admin_type", adminInfo.getAdmin_type());//admin_type的值返回给页面
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("totalCount", totalCount);

        //请求转发到admin_list
        request.getRequestDispatcher("admin_list.jsp").forward(request, response);
    }

    public void destroy() {
    }
}