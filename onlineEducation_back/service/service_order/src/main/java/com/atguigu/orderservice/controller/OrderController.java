package com.atguigu.orderservice.controller;


import com.easyLearn.commonutils.JwtUtils;
import com.easyLearn.commonutils.R;
import com.atguigu.orderservice.entity.Order;
import com.atguigu.orderservice.service.OrderService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 订单 前端控制器
 * </p>
 *
 * @author atguigu
 * @since 2020-08-16
 */
@RestController
@RequestMapping("/edeorder/order")
@CrossOrigin
public class OrderController {

    @Autowired
    private OrderService orderService;

    //1.生成订单的方法
    @PostMapping("createOrder/{courseId}")
    public R createOrder(@PathVariable String courseId, HttpServletRequest request){
        String memberId = JwtUtils.getMemberIdByJwtToken(request);
        //创建订单，返回订单号
        String orderNo = orderService.createOrders(courseId,memberId);
        return R.ok().data("orderId",orderNo);
    }

    //2.根据订单id查询
    @GetMapping("getOrderInfo/{orderId}")
    public R getOrderInfo(@PathVariable String orderId){
        QueryWrapper<Order> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("order_no",orderId);
        Order orderInfo = orderService.getOne(queryWrapper);
        return R.ok().data("item",orderInfo);
    }

    //3.根据课程Id和用户ID查询订单表中的订单状态
    @GetMapping("isBuyCourse/{courseId}/{memberId}")
    public boolean isBuyCourse(@PathVariable String courseId,
                               @PathVariable String memberId){
        QueryWrapper<Order> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("course_id",courseId);
        queryWrapper.eq("member_id",memberId);
        queryWrapper.eq("status",1);
        int count = orderService.count(queryWrapper);
        if (count>0){
            return true;
        }else {
            return false;
        }
    }


}

