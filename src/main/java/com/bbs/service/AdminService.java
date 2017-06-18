package com.bbs.service;

import com.bbs.model.Admin;

/**
 * Created by max on 2017/3/27.
 */
public interface AdminService {

    Admin getAdminById(int id);

    Admin getAdminByPoliceId(String id);


}
