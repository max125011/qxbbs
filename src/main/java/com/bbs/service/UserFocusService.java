package com.bbs.service;

import com.bbs.model.PageInfo;
import com.bbs.model.UserFocus;

import java.util.List;

/**
 * Created by max on 2017/3/27.
 */
public interface UserFocusService {


    List<UserFocus> getUserFocusList(PageInfo pageInfo, UserFocus focus);

    int getUserFocusCount(UserFocus focus);

    int insertUserFocus(UserFocus focus);

    int deleteUserFocus(int id);

}
