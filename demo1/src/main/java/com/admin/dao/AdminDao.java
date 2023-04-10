package com.admin.dao;

import com.admin.entity.AdminInfo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDao {

    private Connection conn;

    public AdminDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/admin_info?serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=utf8&useSSL=false";
            String user = "root";
            String passwd = "root";
            this.conn = DriverManager.getConnection(url, user, passwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //列表查询
//    public List<AdminInfo> list(AdminInfo adminInfo) {
//        List<AdminInfo> adminInfos = new ArrayList<AdminInfo>();
//        try {
//            String sql = "select * from admin_info where account like ? and admin_type like ?";
//            PreparedStatement stat = this.conn.prepareStatement(sql);
//            String b = adminInfo.getAccount() == null ? "" : adminInfo.getAccount();
//            String c = adminInfo.getAdmin_type() == 0 ? "" : adminInfo.getAdmin_type().toString();
//            stat.setString(1, "%" + b + "%");
//            stat.setString(2, "%" + c + "%");
//            ResultSet result = stat.executeQuery();
//            while (result.next()) {
//                AdminInfo admin = new AdminInfo();
//                admin.setAdmin_id(result.getInt("admin_id"));
//                admin.setAccount(result.getString("account"));
//                admin.setAdmin_type(result.getInt("admin_type"));
//                admin.setPassword(result.getString("password"));
//                adminInfos.add(admin);
//            }
//            result.close();
//            stat.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return adminInfos;
//    }

    //精确查询
    public AdminInfo get(int admin_id) {
        AdminInfo adminInfo = null;
        try {
            String sql = "select * from admin_info where admin_id=?";
            PreparedStatement stat = this.conn.prepareStatement(sql);
            stat.setInt(1, admin_id);
            ResultSet result = stat.executeQuery();
            if (result.next()) {
                adminInfo = new AdminInfo();
                adminInfo.setAdmin_id(result.getInt("admin_id"));
                adminInfo.setAccount(result.getString("account"));
                adminInfo.setPassword(result.getString("password"));
                adminInfo.setAdmin_type(result.getInt("admin_type"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return adminInfo;
    }

    //添加Admin
    public AdminInfo insert(AdminInfo adminInfo) {
        int result = 0;
        try {
            String sql = "insert into admin_info(account,password,admin_type) value(?,?,?)";
            PreparedStatement stat = this.conn.prepareStatement(sql);
//            stat.setString(1, adminInfo.getAdmin_id());
            stat.setString(1, adminInfo.getAccount());
            stat.setString(2, adminInfo.getPassword());
            stat.setInt(3, adminInfo.getAdmin_type());
            result = stat.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (result > 0)
            return adminInfo;
        else
            return null;
    }

    //修改Admin
    public AdminInfo update(AdminInfo adminInfo) {
        int result = 0;
        try {
            String sql = "update admin_info set account=?,password=?,admin_type=? where admin_id=?";
            PreparedStatement stat = this.conn.prepareStatement(sql);
            stat.setString(1, adminInfo.getAccount());
            stat.setString(2, adminInfo.getPassword());
            stat.setInt(3, adminInfo.getAdmin_type());
            stat.setInt(4, adminInfo.getAdmin_id());
            result = stat.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (result > 0)
            return adminInfo;
        else
            return null;
    }

    //删除Admin
    public Boolean delete(int admin_id) {
        Boolean success = false;
        try {
            String sql = "delete from admin_info where admin_id=?";
            PreparedStatement stat = this.conn.prepareStatement(sql);
            stat.setInt(1, admin_id);
            int result = stat.executeUpdate();
            if (result > 0)
                success = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    //登陆login
    public AdminInfo login(String account, String password) throws SQLException {//登录时,查询登录账号是否存在
        PreparedStatement prep = conn.prepareStatement("select password from admin_info where account=?");
        prep.setString(1, account);
        prep.execute();
        ResultSet resultSet = prep.executeQuery();//运用executeQuery()对数据库进行查询
        if (resultSet.next()) {//判定拿出内容
            String myPassword = resultSet.getString("password");
            if (password.equals(myPassword)) {
                return getAccount(account);
            } else
                return null;
        } else
            return null;
    }

    //通过account精确查询
    public AdminInfo getAccount(String account) {
        AdminInfo adminInfo = null;
        try {
            String sql = "select * from admin_info where account=?";
            PreparedStatement stat = this.conn.prepareStatement(sql);
            stat.setString(1, account);
            ResultSet result = stat.executeQuery();
            if (result.next()) {
                adminInfo = new AdminInfo();
                adminInfo.setAdmin_id(result.getInt("admin_id"));
                adminInfo.setAccount(result.getString("account"));
                adminInfo.setPassword(result.getString("password"));
                adminInfo.setAdmin_type(result.getInt("admin_type"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return adminInfo;
    }

    //分页查询
//    public List<AdminInfo> listLimit(int index,int pageSize) {
//        List<AdminInfo> adminInfos = new ArrayList<AdminInfo>();
//
//        try {
//            String sql = "select * from admin_info limit ?,?";
//            PreparedStatement stat = this.conn.prepareStatement(sql);
//
//            stat.setInt(1,index);
//            stat.setInt(2,pageSize);
//
//            ResultSet result = stat.executeQuery();
//            while (result.next()) {
//                AdminInfo admin = new AdminInfo();
//                admin.setAdmin_id(result.getInt("admin_id"));
//                admin.setAccount(result.getString("account"));
//                admin.setAdmin_type(result.getInt("admin_type"));
//                admin.setPassword(result.getString("password"));
//                adminInfos.add(admin);
//            }
//            result.close();
//            stat.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return adminInfos;
//    }

    //分页查询2.0
    public List<AdminInfo> listLimit(AdminInfo adminInfo,int index,int pageSize) {
        List<AdminInfo> adminInfos = new ArrayList<AdminInfo>();
        try {String sql = "select * from admin_info where account like ? and admin_type like ? limit ?,?";
            PreparedStatement stat = this.conn.prepareStatement(sql);
//            String a =adminInfo.getAdmin_id() == 0 ? "" : adminInfo.getAdmin_id().toString();
            String b = adminInfo.getAccount() == null ? "" : adminInfo.getAccount();
            String c = adminInfo.getAdmin_type() == 0 ? "" : adminInfo.getAdmin_type().toString();
//            stat.setString(1,"%" + a + "%");
            stat.setString(1, "%" + b + "%");
            stat.setString(2, "%" + c + "%");
            stat.setInt(3,index);
            stat.setInt(4,pageSize);
            ResultSet result = stat.executeQuery();
            while (result.next()) {
                AdminInfo admin = new AdminInfo();
                admin.setAdmin_id(result.getInt("admin_id"));
                admin.setAccount(result.getString("account"));
                admin.setAdmin_type(result.getInt("admin_type"));
                admin.setPassword(result.getString("password"));
                adminInfos.add(admin);
            }
            result.close();
            stat.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return adminInfos;
    }

    //返回admin_info表总条数
    public long getTotalCount(AdminInfo adminInfo) {
        long count = 0;

        try {
            String sql = "select count(*) from admin_info where account like ? and admin_type like ?";
            PreparedStatement stat = this.conn.prepareStatement(sql);
            String b = adminInfo.getAccount() == null ? "" : adminInfo.getAccount();
            String c = adminInfo.getAdmin_type() == 0 ? "" : adminInfo.getAdmin_type().toString();
            stat.setString(1, "%" + b + "%");
            stat.setString(2, "%" + c + "%");
            ResultSet result = stat.executeQuery();
            if (result.next()) {
                count = result.getInt(1);
            }
            result.close();
            stat.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}
