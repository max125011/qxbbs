package com.bbs.service.impl;

import com.bbs.mapper.UserFocusMapper;
import com.bbs.model.PageInfo;
import com.bbs.model.UserFocus;
import com.bbs.service.UserFocusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by max on 2017/3/28.
 */
@Service
public class UserFocusServiceImpl implements UserFocusService {

    @Autowired
    UserFocusMapper userFocusMapper;

    @Override
    public List<UserFocus> getUserFocusList(PageInfo pageInfo, UserFocus focus) {
        return userFocusMapper.getUserFocusList(pageInfo, focus);
    }

    @Override
    public int getUserFocusCount(UserFocus focus) {
        return userFocusMapper.getUserFocusCount(focus);
    }

    @Override
    public int insertUserFocus(UserFocus focus) {
        return userFocusMapper.insertUserFocus(focus);
    }

    @Override
    public int deleteUserFocus(int id) {
        return userFocusMapper.deleteUserFocus(id);
    }
}
