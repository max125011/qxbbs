package com.bbs.service.impl;

import com.bbs.mapper.AdminMapper;
import com.bbs.model.Admin;
import com.bbs.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by max on 2017/3/28.
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminMapper;

    @Override
    public Admin getAdminById(int id) {
        return adminMapper.getAdminById(id);
    }

    @Override
    public Admin getAdminByPoliceId(String id) {
        return adminMapper.getAdminByPoliceId(id);
    }
}
