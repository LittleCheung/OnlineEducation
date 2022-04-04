package com.atguigu.orderservice.controller;


import com.easyLearn.commonutils.R;
import com.atguigu.orderservice.service.PayLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * <p>
 * 支付日志表 前端控制器
 * </p>
 *
 * @author atguigu
 * @since 2020-08-16
 */
@RestController
@RequestMapping("/edeorder/paylog")
@CrossOrigin
public class PayLogController {

    @Autowired
    private PayLogService payLogService;

    //生成微信支付二维码
    @GetMapping("createNative/{orderNo}")
    public R createNative(@PathVariable String orderNo){
        //返回信息，包含二维码地址，还有其他需要的信息
        Map map = payLogService.createNative(orderNo);
        System.out.println("************返回二维码map集合"+map);
        return R.ok().data(map);
    }
    //查询订单支付状态
    @GetMapping("queryPayStatus/{orderNo}")
    public R queryPayStatus(@PathVariable String orderNo){
        //返回信息，包含二维码地址，还有其他需要的信息
        Map<String,String> map = payLogService.queryPayStatus(orderNo);
        System.out.println("############二维码信息map集合"+map);
        if (map == null){
            return R.error().message("支付出错了");
        }
        //如果不为空，通过map获取订单状态;
        if ("SUCCESS".equals(map.get("trade_state"))){
            //支付成功，更改订单状态
            payLogService.updateOrderStatus(map);
            return R.ok().message("支付成功");
        }

        return R.error().code(25000).message("支付中");
    }
}

