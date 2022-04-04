package com.easyLearn.educenter.controller;


import com.easyLearn.commonutils.JwtUtils;
import com.easyLearn.commonutils.R;
import com.easyLearn.commonutils.user.UcenterMemberOrder;
import com.easyLearn.educenter.entity.UcenterMember;
import com.easyLearn.educenter.entity.vo.RegisterVo;
import com.easyLearn.educenter.service.UcenterMemberService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 会员表 前端控制器
 * </p>
 */
@RestController
@RequestMapping("/educenter/member")
@CrossOrigin
public class UcenterMemberController {

    @Autowired
    private UcenterMemberService ucenterMemberService;

    //ucenterMember封装手机号和密码登录
    @PostMapping("login")
    public R login(@RequestBody UcenterMember ucenterMember){
        String token = ucenterMemberService.login(ucenterMember);
        return R.ok().data("token",token);
    }

    //电话、密码、验证码、昵称进行注册
    @PostMapping("register")
    public R register(@RequestBody RegisterVo registerVo){
        ucenterMemberService.register(registerVo);
        return R.ok();
    }

    /**
     * 根据token获取用户信息
     * @param request
     * @return
     */
    @GetMapping("getMemberInfo")
    public R getMemberInfo(HttpServletRequest request){
        //调用jwt工具类，获取头部信息，返回用户id
        String memberId = JwtUtils.getMemberIdByJwtToken(request);
        //查询数据库根据id获得用户信息
        UcenterMember member = ucenterMemberService.getById(memberId);
        return R.ok().data("userInfo",member);
    }



    /**
     * 根据用户id获取客户信息
     */
    @PostMapping("getUserInfoOrder/{id}")
    public UcenterMemberOrder getUserInfoOrder(@PathVariable String id){
        UcenterMember ucenterMember = ucenterMemberService.getById(id);
        //把UcenterMember对象里面的值复制给UcenterMemberOrder对象
        UcenterMemberOrder ucenterMemberOrder = new UcenterMemberOrder();
        BeanUtils.copyProperties(ucenterMember,ucenterMemberOrder);
        return ucenterMemberOrder;
    }

    @GetMapping("countRegister/{day}")
    public R countRegister(@PathVariable String day){
        Integer count = ucenterMemberService.ucenterMemberService(day);
        return R.ok().data("countRegister",count);
    }

}

