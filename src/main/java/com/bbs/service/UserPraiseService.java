package com.bbs.service;

import com.bbs.model.PageInfo;
import com.bbs.model.UserPraise;

import java.util.List;

/**
 * Created by max on 2017/3/27.
 */

public interface UserPraiseService {

    List<UserPraise> getUserPraiseList(PageInfo pageInfo, UserPraise praise);

    int getUserPraiseCount(UserPraise praise);

    int insertAUserPraise(UserPraise praise);

    int deleteUserPraise(int id);
}
