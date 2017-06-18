package com.bbs.service.impl;

import com.bbs.mapper.UserMapper;
import com.bbs.model.PageInfo;
import com.bbs.model.User;
import com.bbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by max on 2017/3/27.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public List<User> getUserList(PageInfo pageInfo, User user) {
        return userMapper.getUserList(pageInfo, user);
    }

    @Override
    public int getUserListCount(User user) {
        return userMapper.getUserListCount(user);
    }

    @Override
    public User getUserById(int id) {
        return userMapper.getUserById(id);
    }

    @Override
    public User getUserByPoliceId(String policeId) {
        return userMapper.getUserByPoliceId(policeId);
    }

    @Override
    public int insertUser(User user) {
        return userMapper.insertUser(user);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int updateReadTimes(int id) {
        return userMapper.updateReadTimes(id);
    }

    @Override
    public int updateFlag(int id, int flag) {
        return userMapper.updateFlag(id, flag);
    }

    @Override
    public List<String> getUserPictureList() {
        return userMapper.getUserPictureList();
    }
}
