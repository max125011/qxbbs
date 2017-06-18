package com.bbs.service;

import com.bbs.model.PageInfo;
import com.bbs.model.User;

import java.util.List;

/**
 * Created by max on 2017/3/27.
 */
public interface UserService {

    List<User> getUserList(PageInfo pageInfo, User user);

    int getUserListCount(User user);

    User getUserById(int id);

    User getUserByPoliceId(String policeId);

    int insertUser(User user);

    int updateUser(User user);

    int updateReadTimes(int id);

    int updateFlag(int id, int flag);

    List<String> getUserPictureList();
}
