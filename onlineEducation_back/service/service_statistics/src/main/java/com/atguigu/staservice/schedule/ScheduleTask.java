package com.atguigu.staservice.schedule;

import com.easyLearn.commonutils.DateUtil;
import com.atguigu.staservice.service.StatisticsDailyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class ScheduleTask {
    @Autowired
    private StatisticsDailyService statisticsDailyService;

    //在每天的凌晨一点，把前一天的数据进行添加
    @Scheduled(cron = "0 0 1 * * ?")
    public void task1() {
        //DateUtil工具类生成前一天时间
        String day = DateUtil.formatDate(DateUtil.addDays(new Date(), -1));
        statisticsDailyService.countRegister(day);
    }


    //每隔5秒执行一次
//    @Scheduled(cron = "0/5 * * * * ?")
//    public void task1() {
//        long l = System.currentTimeMillis();
//        System.out.println("*********++++++++++++*****执行了"+l);
//    }


}
