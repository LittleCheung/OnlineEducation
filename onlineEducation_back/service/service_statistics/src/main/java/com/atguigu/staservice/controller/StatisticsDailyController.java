package com.atguigu.staservice.controller;


import com.easyLearn.commonutils.R;
import com.atguigu.staservice.service.StatisticsDailyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * <p>
 * 网站统计日数据 前端控制器
 * </p>
 *
 * @author atguigu
 * @since 2020-08-18
 */
@RestController
@RequestMapping("/staservice/sta")
@CrossOrigin
public class StatisticsDailyController {

    @Autowired
    private StatisticsDailyService statisticsDailyService;

    //统计一天的注册人数,生成统计数据
    @PostMapping("registerCount/{day}")
    public R registerCount(@PathVariable String day){
        statisticsDailyService.countRegister(day);
        return R.ok();
    }

    @GetMapping("getShowData/{type}/{begin}/{end}")
    public R getShowData(@PathVariable String type,@PathVariable String begin,@PathVariable String end){
        Map<String,Object> map = statisticsDailyService.getShowData(type,begin,end);
        return R.ok().data(map);
    }
}

