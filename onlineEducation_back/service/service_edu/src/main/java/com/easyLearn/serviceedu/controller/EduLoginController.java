package com.easyLearn.serviceedu.controller;

import com.easyLearn.commonutils.R;
import org.springframework.web.bind.annotation.*;

/**
 * 用于进行登录调用的接口
 */
@RestController
@RequestMapping("/eduservice/user")
@CrossOrigin
public class EduLoginController {

    /**
     * login：登录操作方法
     * @return R
     */
    @PostMapping("/login")
    public R login() {
        return R.ok().data("token", "admin");
    }


    /**
     * info：登录之后获取用户信息方法
     * @return R
     */
    @GetMapping("/info")
    public R info() {
        return R.ok().data("roles", "[admin]").data("avatar", "https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif");
    }
}
