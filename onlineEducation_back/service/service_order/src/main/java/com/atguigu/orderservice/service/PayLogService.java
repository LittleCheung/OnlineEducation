package com.atguigu.orderservice.service;

import com.atguigu.orderservice.entity.PayLog;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 * 支付日志表 服务类
 * </p>
 *
 * @author atguigu
 * @since 2020-08-16
 */
public interface PayLogService extends IService<PayLog> {
    //返回信息，包含二维码地址，还有其他需要的信息
    Map createNative(String orderNo);

    Map<String, String> queryPayStatus(String orderNo);

    void updateOrderStatus(Map<String, String> map);
}
