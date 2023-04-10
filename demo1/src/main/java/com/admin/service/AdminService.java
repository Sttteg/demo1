package com.admin.service;

import com.admin.dao.AdminDao;
import com.admin.entity.AdminInfo;

import java.util.List;

public class AdminService {

    private final AdminDao adminDao;

    public AdminService() {
        this.adminDao = new AdminDao();
    }

    public List<AdminInfo> getAdminInfos(AdminInfo adminInfo,int index,int pageSize) {
        // TODO Add your bussiness
        return this.adminDao.listLimit(adminInfo,index,pageSize);
    }

    public AdminInfo getAdminInfo(int admin_id) {
        // TODO Add your bussiness
        return this.adminDao.get(admin_id);
    }

    public AdminInfo addAdminInfo(AdminInfo adminInfo) {
        // TODO Add your bussiness
        return this.adminDao.insert(adminInfo);
    }

    public AdminInfo modifyAdminInfo(AdminInfo adminInfo) {
        // TODO Add your bussiness
        return this.adminDao.update(adminInfo);
    }

    public Boolean deleteAdminInfo(int admin_id) {
        // TODO Add your bussiness
        return this.adminDao.delete(admin_id);
    }
}

