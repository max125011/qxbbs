package com.bbs.restController;

import com.bbs.model.User;
import com.bbs.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by max on 2017/3/28.
 */
@RestController
public class UserController {

    private static Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    UserService userService;

    @GetMapping("/user/{id}")
    public User getUserById(@PathVariable int id, HttpServletRequest request){

        User user = null;
        String userId = (String)request.getSession().getAttribute("userId");
        if (userId != null && userId != "" && Integer.valueOf(userId) == id){
            user = userService.getUserById(id);
            user.setPassword("******");
        }
        return user;
    }

    @PostMapping("/user/update")
    public int updateUser(HttpServletRequest request, User user){

        int res = 0;
        String userId = (String)request.getSession().getAttribute("userId");
        if (userId != null && userId != "" && Integer.valueOf(userId) == user.getId()){
            res = userService.updateUser(user);
        }
        return res;
    }

    @GetMapping("/user/picture/list")
    public List<String> getUserPictureList(){
        List<String> list = userService.getUserPictureList();
        return list;
    }


}
