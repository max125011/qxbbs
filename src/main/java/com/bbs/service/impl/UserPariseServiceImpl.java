package com.bbs.service.impl;

import com.bbs.mapper.UserPraiseMapper;
import com.bbs.model.PageInfo;
import com.bbs.model.UserPraise;
import com.bbs.service.UserPraiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by max on 2017/3/28.
 */
@Service
public class UserPariseServiceImpl implements UserPraiseService {

    @Autowired
    UserPraiseMapper userPraiseMapper;

    @Override
    public List<UserPraise> getUserPraiseList(PageInfo pageInfo, UserPraise praise) {
        return userPraiseMapper.getUserPraiseList(pageInfo, praise);
    }

    @Override
    public int getUserPraiseCount(UserPraise praise) {
        return userPraiseMapper.getUserPraiseCount(praise);
    }

    @Override
    public int insertAUserPraise(UserPraise praise) {
        return userPraiseMapper.insertUserPraise(praise);
    }

    @Override
    public int deleteUserPraise(int id) {
        return userPraiseMapper.deleteUserPraise(id);
    }
}
