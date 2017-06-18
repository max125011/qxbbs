package com.bbs.restController;

import com.bbs.model.PageInfo;
import com.bbs.model.ResponseVo;
import com.bbs.model.User;
import com.bbs.service.UserService;
import com.bbs.util.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by max on 2017/3/28.
 */
@RestController
@RequestMapping("/admin/user")
public class AdminUserController {

    private static Logger logger = LoggerFactory.getLogger(AdminUserController.class);

    @Autowired
    UserService userService;

    @RequestMapping("/list")
    public ResponseVo getUserList(PageInfo info, User user){
        ResponseVo vo = new ResponseVo();
        info = info.getPageCurrent() > 0 && info.getPageSize() > 0 ? info : new PageInfo(1, 20);
        List<User> list = userService.getUserList(info, user);
        info = PageUtil.getPageInfo(info.getPageCurrent(), info.getPageSize(), userService.getUserListCount(user));
        for (User item : list
                ) {
            item.setPassword("******");
            if (item.getPhone() != null && item.getPhone().length() == 11)
                item.setPhone(item.getPhone().substring(0,3) + "****" + item.getPhone().substring(7,11));
        }
        vo.setList(list);
        vo.setPageInfo(info);
        return vo;
    }

    @PostMapping("/insert")
    public int addUserByAdmin(User user){

        int res = 0;
        if (user == null)
            return res;
        try {
            if (user.getGroupName() == null || user.getGroupName() == "")
                user.setGroupName("栖霞公安分局");
            if (user.getName() == null || user.getName() == "")
                user.setName(user.getNickname());
            res = userService.insertUser(user);
            logger.info("用户【" + user.getNickname() + "】添加成功！");
        }catch (Exception e){
            return res;
        }
        return 1;
    }

    @RequestMapping("/check/{id}")
    public int check(@PathVariable int id){

        int res = id > 0 ? userService.updateFlag(id, 2) : 0;
        return  res;
    }

    @RequestMapping("/delete/{id}")
    public int deleteUser(@PathVariable int id){

        int res = id > 0 ? userService.updateFlag(id, 3) : 0;
        return  res;
    }

}
